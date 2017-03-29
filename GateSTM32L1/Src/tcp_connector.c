
#include "tcp_connector.h"
#include "xprint.h"
#include "package_queue.h"

#define LOG_PACKAGE 0
#define SEND_TIMEOUT 1000
#define PACKAGE_QUEUE_SIZE 100


static UART_HandleTypeDef *hUART;
static PACKAGE_QUEUE_NODE packetBuffer[PACKAGE_QUEUE_SIZE];
static PACKAGE_QUEUE queue;
static uint8_t queueOverflow = 0;
static HAL_StatusTypeDef lastReceiveStatus = HAL_OK;

static GPIO_TypeDef *gpioPort;
static uint16_t configPin;
static uint16_t notConnectPin;

static TCP_Status sendBytes(uint8_t *pData, uint16_t size) {
	//TODO: проверить есть ли соединение
	//
#if LOG_PACKAGE
	LOG("TCP: sendBytes:");
	LOGMEM(pData, size);
#endif
	HAL_StatusTypeDef tStatus = HAL_UART_Transmit(hUART, pData, size, SEND_TIMEOUT);
	if (tStatus == HAL_OK) {
		return TCP_OK;
	} else {
		return TCP_ERROR;
	}
}

void setWorkMode(bool workMode) {// режим работы или конфигурации
	HAL_GPIO_WritePin(gpioPort, configPin, workMode);
}

void TCP_Init(UART_HandleTypeDef *UARTHandle, GPIO_TypeDef *GPIO_Port, uint16_t config_Pin, uint16_t notConnect_Pin) {
	queue = QUEUE_NewQueue(packetBuffer, PACKAGE_QUEUE_SIZE);
	hUART = UARTHandle;
	gpioPort = GPIO_Port;
	configPin = config_Pin;
	notConnectPin = notConnect_Pin;
	setWorkMode(true);

	uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
	lastReceiveStatus = HAL_UART_Receive_DMA(hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
	if (lastReceiveStatus != HAL_OK) {
		LOGERR("Not start HAL_UART_Receive_IT status:%d", lastReceiveStatus);
	}

	LOG("TCP connector init UART:0x%x TRANS_PACKAGE_SIZE:%d", hUART->Instance, TRANS_PACKAGE_SIZE);
}

bool TCP_IsConnect() {
	return HAL_GPIO_ReadPin(gpioPort, notConnectPin) == GPIO_PIN_RESET;
}

TCP_Status TCP_SendTransPackage(TRANS_PACKAGE *pPackage) {
	//пакет в байты
	uint8_t* bytes = TRANS_PackageToByte(pPackage);
	return sendBytes(bytes, TRANS_PACKAGE_SIZE);
}

__weak void TCP_OnProcessPackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

__weak void TCP_OnError(uint8_t queueOverflow, uint8_t receiveStatusError) {
	UNUSED(queueOverflow);
	UNUSED(receiveStatusError);
}

void TCP_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != hUART->Instance) {
		return;
	}
	QUEUE_ReceiveNode(&queue);
	uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
	if (nodeBuffer != NULL) {
		lastReceiveStatus = HAL_UART_Receive_DMA(hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
	} else {
		queueOverflow++;
	}
}

static void processPackageNode(PACKAGE_QUEUE_NODE *node) {

	TRANS_PACKAGE *pPackage = NULL;
	uint8_t error = TRANS_ByteToPackage(node->package, &pPackage);
	if (error) {
		LOGERR("TCP: Receive data error %d", error);
		LOGMEM(node->package, TRANS_PACKAGE_SIZE);
	} else {
#if LOG_PACKAGE && 0
		LOG("TCP: ReceivePackage:");
		LOGMEM(pPackage, TRANS_PACKAGE_SIZE);
#endif
		TCP_OnProcessPackage(pPackage);
	}

}

void TCP_ProcessPackage() {
	if (queueOverflow || lastReceiveStatus) {
		TCP_OnError(queueOverflow, lastReceiveStatus);
	}

	QUEUE_ProcessNode(&queue, processPackageNode);

	if (queueOverflow) {
		queueOverflow = 0;
		uint8_t *nodeBuffer = QUEUE_UseNode(&queue);
		lastReceiveStatus = HAL_UART_Receive_DMA(hUART, nodeBuffer, TRANS_PACKAGE_SIZE);
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

