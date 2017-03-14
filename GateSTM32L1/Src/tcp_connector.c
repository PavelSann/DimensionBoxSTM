
#include "tcp_connector.h"
#include "xprint.h"

//#define UART_DT_SIZE 10
#define SEND_TIMEOUT 1000


static UART_HandleTypeDef *hUART;
static uint8_t packageReceive[TRANS_PACKAGE_SIZE];

static TCP_Status sendBytes(uint8_t *pData, uint16_t size) {
	//TODO: проверить есть ли соединение
	//
	HAL_StatusTypeDef tStatus = HAL_UART_Transmit(hUART, pData, size, SEND_TIMEOUT);
	if (tStatus == HAL_OK) {
		return TCP_OK;
	} else {
		return TCP_ERROR;
	}
}

void TCP_Init(UART_HandleTypeDef *UARTHandle) {
	hUART = UARTHandle;
	
	LOG("TCP connector init UART:0x%x TRANS_PACKAGE_SIZE:%d", hUART->Instance, TRANS_PACKAGE_SIZE);
	
	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if (status != HAL_OK) {
		LOGERR("Not start HAL_UART_Receive_IT status:%d", status);
	}


}

TCP_Status TCP_SendTransPackage(TRANS_PACKAGE *pPackage) {
	//пакет в байты
	uint8_t* bytes = TRANS_toByte(pPackage);
	LOG("TCP send package:");
	return sendBytes(bytes, TRANS_PACKAGE_SIZE);
}

__weak void TCP_OnReceivePackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

void TCP_UART_TxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != hUART->Instance) {
		return;
	}

	LOG("ЕСЗ: Receive data size:%d", huart->RxXferSize);
	TRANS_PACKAGE *pPackage = NULL;
	uint8_t error = TRANS_toPackage(packageReceive, &pPackage);
	if (error) {
		LOGERR("Receive data error %d", error);
	} else {
		TCP_OnReceivePackage(pPackage);
	}


	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if (status != HAL_OK) {
		LOGERR("Not start Receive_IT status:%d", status);
	}
}
