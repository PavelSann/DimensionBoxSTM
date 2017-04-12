
#include "tcp_connector.h"
#include "xprint.h"
#include "package_queue.h"

#define LOG_PACKAGE 0
#define LOG_QUEUE 0
#define SEND_TIMEOUT 1000
#define PACKAGE_QUEUE_SIZE 1000

static PACKAGE_QUEUE_NODE packetBuffer[PACKAGE_QUEUE_SIZE];
static PACKAGE_QUEUE queue;
static uint8_t overflowTrashPackage[TRANS_PACKAGE_SIZE];
static TCPConfig conf;

static __IO bool error = false;
static TCPStatus status = {
	.lastError = TCP_ERR_NONE,
	.lastReceiveStatus = HAL_OK,
	.lastTransmitStatus = HAL_OK,
	.overflowQueueCount = 0,
	.uartState = HAL_UART_STATE_READY
};

static void sendBytes(uint8_t *pData, uint16_t size) {
	//если нет связи, у модуля есть свой буфер, и когда появится связь он отправит пакеты, которые влезли в буфер
#if LOG_PACKAGE
	LOG("TCP: sendBytes:");
	LOGMEM(pData, size);
#endif
	status.lastTransmitStatus = HAL_UART_Transmit(conf.hUART, pData, size, SEND_TIMEOUT);
	if (status.lastTransmitStatus != HAL_OK) {
		status.lastError = TCP_ERR_UART_TRANSMIT;
		error = true;
	}
}

void setWorkMode(bool workMode) {// режим работы или конфигурации
	HAL_GPIO_WritePin(conf.port, conf.pinConfig, workMode);
}

static void inline ReceivePackage() {
	QUEUE_ReceiveNode(&queue);
	uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
	if (nodeBuffer == NULL) {
		//если нет места в очереди, то будем писать пакет в спец буфер,
		//и увеличиваем счётчик потерянных пакетов
		//т.е. пакет будет утерян
		status.overflowQueueCount++;
		nodeBuffer = overflowTrashPackage;
		status.lastError = TCP_ERR_OVERFLOW_QUEUE;
		error = true;
	}

	do {
		status.lastReceiveStatus = HAL_UART_Receive_DMA(conf.hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
	} while (status.lastReceiveStatus == HAL_BUSY);

	if (status.lastReceiveStatus != HAL_OK) {
		status.lastError = TCP_ERR_UART_RECEIVE;
		error = true;
	}
}

static void tryError() {
	status.uartState = HAL_UART_GetState(conf.hUART);
	if (error) {
		error = false;
		TCP_OnError(status);
	}
}

void TCP_Init(TCPConfig configuration) {
	queue = QUEUE_NewQueue(packetBuffer, PACKAGE_QUEUE_SIZE);
	conf = configuration;
	assert_param(conf.hUART != NULL);
	assert_param(conf.port != NULL);
	setWorkMode(true);

	ReceivePackage();
	tryError();
	LOG("TCP connector init UART:0x%x TRANS_PACKAGE_SIZE:%d", conf.hUART->Instance, TRANS_PACKAGE_SIZE);
}

bool TCP_IsConnect() {
	return HAL_GPIO_ReadPin(conf.port, conf.pinNotConnect) == GPIO_PIN_RESET;
}

void TCP_SendTransPackage(TRANS_PACKAGE *pPackage) {
	//пакет в байты
	uint8_t* bytes = PACK_PackageToByte(pPackage);
	sendBytes(bytes, TRANS_PACKAGE_SIZE);
}

__weak void TCP_OnProcessPackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

__weak void TCP_OnError(TCPStatus status) {
	UNUSED(status);
}

void TCP_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != conf.hUART->Instance) {
		return;
	}
	ReceivePackage();
}

static void processPackageNode(PACKAGE_QUEUE_NODE *node) {

	TRANS_PACKAGE *pPackage = NULL;
	uint8_t errCode = PACK_ByteToPackage(node->package, &pPackage);
	if (errCode) {
		//		LOGERR("Receive data error %d. NodeStatus:%d QUEUE:%d:%d:%d", errCode, node->status, queue.size, queue.useIndex, queue.processIndex);
		//		LOGMEM(node->package, TRANS_PACKAGE_SIZE);
		//		LOG("* * * * * ");
		//		LOGMEM(queue.packetQueue, PACKAGE_QUEUE_SIZE*sizeof(PACKAGE_QUEUE_NODE));
		/*
		 Если получены кривые данные, можно поискать в пакете начало пакета, если он сдвинут, то записать в доп. буфер
		 при получении следуюущих кривых данных, начало можно будет взять из доп буфера
		 */
		status.lastError = TCP_ERR_BAD_PACKAGE;
		error = true;
	} else {
#if LOG_PACKAGE && 0
		LOG("TCP: ReceivePackage:");
		LOGMEM(pPackage, TRANS_PACKAGE_SIZE);
#endif
		TCP_OnProcessPackage(pPackage);
	}

}

void TCP_ProcessPackage() {
	tryError();
	QUEUE_ProcessNode(&queue, processPackageNode);

#if LOG_QUEUE
	uint32_t count = QUEUE_GetReceiveNodeCount(&queue);
	if (count > 0) {
		LOG("TCP: ProcessPackage: receive node count %d QUEUE:%d:%d:%d", count, queue.size, queue.useIndex, queue.processIndex);
	}
#endif

}

