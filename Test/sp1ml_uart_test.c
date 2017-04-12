#include "sp1ml_uart_test.h"
#include <string.h>
#define __STR(val) #val
#define DEF_TO_STR(X) __STR(X)

#define RECEIVE_DMA 1
#define CONFIG 0
#define CALLBACK_RECEIVE 1
#define TRANSMIT_TIMEOUT 200
#define PACKAGE_SIZE 48
#define BUFFER_SIZE_STR DEF_TO_STR(PACKAGE_SIZE)
#define CHECK_CRC 1
//#define UART_SPEED 9600
//#define UART_SPEED_STR DEF_TO_STR(UART_SPEED)
#if RECEIVE_DMA
	#define BUFFER_DMA_PACKAGE_COUNT 32
	#define BUFFER_DMA_SIZE (PACKAGE_SIZE*BUFFER_DMA_PACKAGE_COUNT)
#endif

extern UART_HandleTypeDef huart4;
#if CHECK_CRC
extern CRC_HandleTypeDef hcrc;
static volatile uint32_t baseCRC;
#endif


#if RECEIVE_DMA
extern DMA_HandleTypeDef hdma_uart4_rx;

static uint8_t bufferDma[BUFFER_DMA_SIZE];
#else
static uint8_t buffer[PACKAGE_SIZE];
#endif
static volatile uint32_t good = 0;
static volatile uint32_t bad = 0;
static volatile uint32_t send = 0;
static volatile uint32_t countCplt = 0;
static volatile uint32_t countHalfCplt = 0;
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
#if RECEIVE_DMA
	HAL_UART_Receive_DMA(&huart4, bufferDma, BUFFER_DMA_SIZE);
#else
	HAL_UART_Receive_IT(&huart4, buffer, PACKAGE_SIZE);
#endif
	//	while (HAL_UART_Receive_IT(&huart4, buffer, BUFFER_SIZE) == HAL_BUSY) {
	//		busy++;
	//	}
}

bool checkPackage(const uint8_t *pPackage) {
	if (pPackage[0] == 0xCA && pPackage[1] == 0xFE && pPackage[PACKAGE_SIZE - 2] == 0xBA && pPackage[PACKAGE_SIZE - 1] == 0xBE) {
#if CHECK_CRC
		uint32_t crc = HAL_CRC_Calculate(&hcrc, (uint32_t*) pPackage, PACKAGE_SIZE / 4);
		if (crc == baseCRC) {
			good++;
			return true;
		} else {
			bad++;
			return false;
		}
#else
		good++;
		return true;
#endif
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
#if CHECK_CRC
	baseCRC = HAL_CRC_Calculate(&hcrc, (uint32_t*) dataToSend, PACKAGE_SIZE / 4);
#endif

	StartReceive();
	//	hdma_uart4_rx.Instance->CNDTR
	//	HAL_DMA_PollForTransfer()
	uint32_t lastLog = 0;
	uint32_t lastTransmit = 0;
	while (true) {
#if !RECEIVE_DMA && !CALLBACK_RECEIVE
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

#if RECEIVE_DMA && !CALLBACK_RECEIVE
		if (dmaFirst) {
			dmaFirst = false;
			checkPackages(true);
		} else if (dmaLast) {
			dmaLast = false;
			checkPackages(false);
		}
#endif

		if ((HAL_GetTick() - lastLog) > 1000) {
			LOG("send=%d good=%d bad=%d countHalfCplt=%d countCplt=%d", send, good, bad, countHalfCplt, countCplt);
			lastLog = HAL_GetTick();
			DMA_Channel_TypeDef *pDMC = huart4.hdmarx->Instance;
			// pDMC->CMAR адрес буфера
			// pDMC->CNDTR смещение
//			LOG("DMA: CMAR:0x%x CNDTR:0x%x CPAR:0x%x bufferDma:0x%x", pDMC->CMAR, pDMC->CNDTR, pDMC->CPAR,&bufferDma);
		}
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
	countHalfCplt++;
	#if CALLBACK_RECEIVE
	checkPackages(true);
	#endif

}
#endif

void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance == huart4.Instance) {
#if RECEIVE_DMA
		countCplt++;
		dmaFirst = false;
		dmaLast = true;
	#if CALLBACK_RECEIVE
		checkPackages(false);
	#endif
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
		//LOGMEM(bufferDma, BUFFER_DMA_SIZE);
	}
}