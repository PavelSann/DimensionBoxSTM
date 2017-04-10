#include "sp1ml_uart_test.h"
#include <string.h>
#define __STR(val) #val
#define DEF_TO_STR(X) __STR(X)
extern UART_HandleTypeDef huart4;
#define PACKAGE_SIZE 96
#define BUFFER_SIZE_STR DEF_TO_STR(PACKAGE_SIZE)
//#define UART_SPEED 9600
//#define UART_SPEED_STR DEF_TO_STR(UART_SPEED)

#define RECEIVE 1
#define RECEIVE_DMA 1
#define CONFIG 0
#define CALLBACK_RECEIVE 1
#define TRANSMIT_TIMEOUT 200

#if RECEIVE
static const char *mode = "Rx&Tx";
#else
static const char *mode = "Tx";
#endif

#if RECEIVE_DMA
extern DMA_HandleTypeDef hdma_uart4_rx;
	#define BUFFER_DMA_PACKAGE_COUNT 16
	#define BUFFER_DMA_SIZE (PACKAGE_SIZE*BUFFER_DMA_PACKAGE_COUNT)
static uint8_t bufferDma[BUFFER_DMA_SIZE];
#else
static uint8_t buffer[PACKAGE_SIZE];
#endif
static volatile uint32_t good = 0;
static volatile uint32_t bad = 0;
static volatile uint32_t send = 0;
static volatile uint32_t busy = 0;
static volatile bool run = false;
static volatile bool dmaFirst = false;
static volatile bool dmaLast = false;
static uint8_t dataToSend[PACKAGE_SIZE] = {[0] = 0xCA, [1] = 0xFE, [PACKAGE_SIZE - 2] = 0xBA, [PACKAGE_SIZE - 1] = 0xBE};
#if CONFIG

static void sendCommand(char *str) {
	size_t ln = strlen(str);
	uint8_t *cmd = (uint8_t*) str;
	HAL_UART_Transmit(&huart4, cmd, ln, 1000);
	HAL_Delay(500);
}
	#define CONFIG_ARR_SIZE 9
static char *(config[CONFIG_ARR_SIZE]) = {
	"+++", //Command mode
	"ATR\r\n", //Reset configuration to the default values
	//"ATS00=9600\r\n", //General:Baud rate of the UART interface in bps. The baud rate is stored when the configuration is stored.
	//"ATS02=9600\r\n", //Radio:Data rate in bps. The data rate for OOK and ASK modulation schemes is limited to 250000bps.
	//"ATS13=0\r\n", //Packet:Data whitening mode.
	//"ATS14=1\r\n", //Packet:Forward error correction.
	"ATS19=1\r\n", //Address:Filter packets that have an invalid CRC.
	"ATS28=" BUFFER_SIZE_STR "\r\n", //Packet: Packet payload size in bytes.
	"AT/C\r\n",
	"AT/S\r\n",
	"ATO\r\n"
};

static void stopReceiveIT(UART_HandleTypeDef *huart) {
	//	HAL_UART_DeInit(huart);
	huart->TxXferSize = 0;
	huart->TxXferCount = 0;
	huart->State = HAL_UART_STATE_READY;
}

static void config_SP1ML() {
	LOG("Config SP1ML:");
	HAL_Delay(500);
	uint8_t buff[1024] = {0};
	HAL_UART_Receive_IT(&huart4, buff, 1024);
	for (int i = 0; i < CONFIG_ARR_SIZE; i++) {
		sendCommand(config[i]);
		LOG(" %s ...", config[i]);
	}
	HAL_Delay(1000);
	//останавливаем HAL_UART_Receive_IT
	stopReceiveIT(&huart4);
	LOG("Response: %s", buff);
}
#endif

static void StartReceive() {
#if RECEIVE
	#if RECEIVE_DMA
	HAL_UART_Receive_DMA(&huart4, bufferDma, BUFFER_DMA_SIZE);
	#else
	HAL_UART_Receive_IT(&huart4, buffer, PACKAGE_SIZE);
	#endif
	//	while (HAL_UART_Receive_IT(&huart4, buffer, BUFFER_SIZE) == HAL_BUSY) {
	//		busy++;
	//	}
#endif
}

bool checkPackage(const uint8_t *pPackage) {
	if (pPackage[0] == 0xCA && pPackage[1] == 0xFE && pPackage[PACKAGE_SIZE - 2] == 0xBA && pPackage[PACKAGE_SIZE - 1] == 0xBE) {
		good++;
		return true;
	} else {
		bad++;
		return false;
	}
}

void checkPackages(bool first) {
	uint8_t *pack;
	uint8_t *end;
	if (first) {
		pack = bufferDma;
		end = (bufferDma + (BUFFER_DMA_PACKAGE_COUNT / 2 * PACKAGE_SIZE));
	} else {
		pack = (bufferDma + (BUFFER_DMA_PACKAGE_COUNT / 2 * PACKAGE_SIZE));
		end = (bufferDma + (BUFFER_DMA_PACKAGE_COUNT * PACKAGE_SIZE)) - 1;
	}

	while (pack < end) {
		if (pack[0] == 0xCA && pack[1] == 0xFE) {
			if (checkPackage(pack)) {
				pack += PACKAGE_SIZE;
				continue;
			}
		}
		pack++;
	}

}

void SP1MLTest() {
	//	__HAL_RCC_DMA1_CLK_DISABLE();
	//	__HAL_RCC_DMA2_CLK_DISABLE();
#if CONFIG
	config_SP1ML();
	//	huart4.Init.BaudRate = 115200;
	//	//	huart4.Init.BaudRate = 9600;
	//	HAL_UART_DeInit(&huart4);
	//	HAL_UART_Init(&huart4);
#endif
	StartReceive();
	//	hdma_uart4_rx.Instance->CNDTR
	//	HAL_DMA_PollForTransfer()
	uint32_t lastLog = 0;
	uint32_t lastTransmit = 0;
	uint32_t lastMem = 0;
	while (true) {
#if !CALLBACK_RECEIVE
		if (receive) {
			if (buffer[0] == 0xCA && buffer[1] == 0xFE && buffer[PACKAGE_SIZE - 2] == 0xBA && buffer[PACKAGE_SIZE - 1] == 0xBE) {
				good++;
			} else {
				bad++;
			}
			receive = false;
			StartReceive();
		}
#endif

#if RECEIVE_DMA
		if (dmaFirst) {
			dmaFirst = false;
			checkPackages(true);
		} else if (dmaLast) {
			dmaLast = false;
			checkPackages(false);
		}


#endif


		//		HAL_Delay(200);
		if ((HAL_GetTick() - lastLog) > 1000) {
			LOG("send=%d good=%d bad=%d busy=%d %s", send, good, bad, busy, mode);
			lastLog = HAL_GetTick();
		}

		//		if ((HAL_GetTick() - lastMem) > 5000) {
		//			LOGMEM(bufferDma, BUFFER_DMA_SIZE);
		//			lastMem = HAL_GetTick();
		//		}

		if (run && (HAL_GetTick() - lastTransmit) > TRANSMIT_TIMEOUT) {
			HAL_UART_Transmit(&huart4, dataToSend, PACKAGE_SIZE, 1000000);
			//			HAL_UART_Transmit_IT(&huart4, dataToSend, BUFFER_SIZE);
			// попробовать transmit DMA
			send++;
			lastTransmit = HAL_GetTick();
		}

	}
}

#if RECEIVE_DMA

void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef* huart) {
	//	huart->pRxBuffPtr
	//	for (int i = 0; i < BUFFER_DMA_PACKAGE_COUNT / 2; i++) {
	//		checkPackage(bufferDma + i * PACKAGE_SIZE);
	//	}
	//	checkPackages(true);
	dmaLast = false;
	dmaFirst = true;

}
#endif

void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance == huart4.Instance) {

#if RECEIVE_DMA
		//		for (int i = BUFFER_DMA_PACKAGE_COUNT / 2; i < BUFFER_DMA_PACKAGE_COUNT; i++) {
		//			checkPackage(bufferDma + i * PACKAGE_SIZE);
		//		}
		//		checkPackages(false);
		dmaFirst = false;
		dmaLast = true;
#elif CALLBACK_RECEIVE
		checkPackage(bufferDma);
		StartReceive();
#else
		receive = true;
#endif
	}
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	if (GPIO_Pin == ButtonBlue_Pin) {
		run = !run;
		LOG("Send loop run=%d", run);
		//		LOGMEM(bufferDma, BUFFER_DMA_SIZE);
	}
}