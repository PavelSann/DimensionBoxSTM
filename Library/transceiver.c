#include "transceiver.h"
#include <string.h>
#include <assert.h>
#include "xprint.h"
#include "package_queue.h"

#define __STR(val) #val
#define DEF_TO_STR(X) __STR(X)

#define LOG_PACKAGE 0
#define CONFIG_SP1ML 0
#define SP1ML_PAYLOAD_SIZE 48
#define SP1ML_PAYLOAD_SIZE_STR DEF_TO_STR(SP1ML_PAYLOAD_SIZE)
static_assert(sizeof (TRANS_PACKAGE) == SP1ML_PAYLOAD_SIZE, "sizeof(TRANS_PACKAGE) != SP1ML_PAYLOAD_SIZE");
static_assert(sizeof (TRANS_PACKAGE) < 96, "Max PAYLOAD_SIZE SP1ML 96");

#define SEND_TIMEOUT 10000
#define SEND_PAUSE   200
#define PACKAGE_QUEUE_SIZE 100

static PACKAGE_QUEUE_NODE queueBuffer[PACKAGE_QUEUE_SIZE];
static PACKAGE_QUEUE queue;
static volatile bool queueOverflow = false;

static TRANSConfig conf;
static volatile HAL_StatusTypeDef lastReceiveStatus = HAL_OK;

TRANS_PACKAGE TRANS_NewLocalPackage(TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	return TRANS_NewPackage(conf.localAddress, targetAddress, type);
}

static void sendBytes(uint8_t *bytes, int len) {
	static uint32_t lastSendTime = 0;
#if LOG_PACKAGE
	LOG("TRANS: sendBytes:");
	LOGMEM(bytes, TRANS_PACKAGE_SIZE);
#endif
	while ((HAL_GetTick() - lastSendTime) < SEND_PAUSE) {
		//пауза между отправками, не менее SEND_PAUSE
	}
	HAL_StatusTypeDef status = HAL_UART_Transmit(conf.hUART, bytes, len, SEND_TIMEOUT);
	lastSendTime = HAL_GetTick();
	if (status != HAL_OK) {
		LOGERR("Not transmit bytes. status=0x%x", status);
	}
}

#if CONFIG_SP1ML
static void sendCommand(char *str) {
	size_t ln = strlen(str);
	uint8_t *cmd = (uint8_t*) str;
	HAL_UART_Transmit(conf.hUART, cmd, ln, SEND_TIMEOUT);
	HAL_Delay(500);
}
	#define CONFIG_ARR_SIZE 9
static char *(config[CONFIG_ARR_SIZE]) = {
	"+++",
	"ATR\r\n",
	//	"ATS02=1000\r\n",
	"ATS14=1\r\n",
	"ATS19=1\r\n",
	"ATS28=" SP1ML_PAYLOAD_SIZE_STR "\r\n",
	"AT/C\r\n",
	"AT/S\r\n",
	"ATO\r\n"
};

static void stopReceiveIT(UART_HandleTypeDef *huart) {
	huart->TxXferSize = 0;
	huart->TxXferCount = 0;
	huart->State = HAL_UART_STATE_READY;
}

static void config_SP1ML() {
	LOG("Config SP1ML:");
	HAL_Delay(500);
	uint8_t buff[1024] = {0};
	HAL_UART_Receive_IT(conf.hUART, buff, 1024);
	for (int i = 0; i < CONFIG_ARR_SIZE; i++) {
		sendCommand(config[i]);
		LOG(" %s ...", config[i]);
	}
	HAL_Delay(1000);
	LOG("Response: %s", buff);
	//останавливаем HAL_UART_Receive_IT
	stopReceiveIT(conf.hUART);
}
#endif


void TRANS_Init(TRANSConfig configuration) {
	conf = configuration;
	assert_param(conf.hUART != NULL);
	assert_param(conf.localAddress > 0);
	//	assert_param(conf.port != 0);
	//	assert_param(conf.pinReset > 0);
#if CONFIG_SP1ML
	config_SP1ML();
#endif
	//создаём очередь
	queue = QUEUE_NewQueue(queueBuffer, PACKAGE_QUEUE_SIZE);

	uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
	lastReceiveStatus = HAL_UART_Receive_DMA(conf.hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
	if (lastReceiveStatus != HAL_OK) {
		LOGERR("Not start HAL_UART_Receive_IT status:%d", lastReceiveStatus);
	}
	LOG("Transceiver init UART:0x%x TRANS_PACKAGE_SIZE:%d", conf.hUART->Instance, TRANS_PACKAGE_SIZE);
}

void TRANS_SendPackage(TRANS_PACKAGE *pPackage) {
	uint8_t *bytes = TRANS_PackageToByte(pPackage);
	sendBytes(bytes, TRANS_PACKAGE_SIZE);
}

void TRANS_SendDataMeters(TRANS_ADDRESS targetAddress, TRANS_DATA_METERS *dataMeters) {
	TRANS_PACKAGE p = TRANS_NewLocalPackage(targetAddress, TRANS_TYPE_METERS);
	p.data.meters = *dataMeters;
	TRANS_SendPackage(&p);
}

__weak void TRANS_OnProcessPackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

__weak void TRANS_OnError(bool queueOverflow, HAL_StatusTypeDef lastReceiveStatus) {
	UNUSED(queueOverflow);
	UNUSED(lastReceiveStatus);
}

void TRANS_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != conf.hUART->Instance) {
		return;
	}

	QUEUE_ReceiveNode(&queue);
	uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
	if (nodeBuffer != NULL) {
		lastReceiveStatus = HAL_UART_Receive_DMA(conf.hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
	} else {
		queueOverflow = true;
	}
}

static void processPackageNode(PACKAGE_QUEUE_NODE *node) {

	TRANS_PACKAGE *pPackage = NULL;
	uint8_t error = TRANS_ByteToPackage(node->package, &pPackage);
	if (error) {
		LOGERR("Receive data error %d. NodeStatus:%d QUEUE:%d:%d:%d", error, node->status, queue.size, queue.useIndex, queue.processIndex);
		LOGMEM(node->package, TRANS_PACKAGE_SIZE);
		//		LOG("* * * * * ");
		//		LOGMEM(queue.packetQueue, PACKAGE_QUEUE_SIZE*sizeof(PACKAGE_QUEUE_NODE));
	} else {
#if LOG_PACKAGE 
		LOG("TCP: ReceivePackage:");
		LOGMEM(pPackage, TRANS_PACKAGE_SIZE);
#endif
		TRANS_OnProcessPackage(pPackage);
	}

}

void TRANS_ProcessPackage() {
	if (queueOverflow || lastReceiveStatus) {
		TRANS_OnError(queueOverflow, lastReceiveStatus);
	}

	QUEUE_ProcessNode(&queue, processPackageNode);

	if (queueOverflow) {
		queueOverflow = false;
		uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
		lastReceiveStatus = HAL_UART_Receive_DMA(conf.hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
		LOG("Overflow Receive 0x%x", lastReceiveStatus);
		LOGERR("НЕ РАБОТАЕТ!");
	}
#if LOG_PACKAGE
	uint32_t count = QUEUE_GetReceiveNodeCount(&queue);
	if (count > 0) {
		LOG("TCP: ProcessPackage: receive node count %d QUEUE:%d:%d:%d", count, queue.size, queue.useIndex, queue.processIndex);
	}
#endif


}
