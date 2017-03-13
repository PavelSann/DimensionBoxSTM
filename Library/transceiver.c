#include "transceiver.h"
#include "xprint.h"

#define SEND_TIMEOUT 500
#define PACKAGE_SIZE 4
//typedef void (*CALLBACK)(uint8_t data[PACKAGE_SIZE]);
static UART_HandleTypeDef *hUART;
static uint8_t packageReceive[PACKAGE_SIZE];
//CALLBACK onPing;
TRANS_InitTRANS_Init(UART_HandleTypeDef *UARTHandle) {
	hUART = UARTHandle;
	//	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
	HAL_UART_Receive_DMA(hUART, packageReceive, PACKAGE_SIZE);
}

uint8_t pingPackage[PACKAGE_SIZE] = {'P', 'I', 'N', 'G'};
TRANS_PingTRANS_Ping() {
	//	HAL_UART_Transmit_IT(hUART, pingPackage, PACKAGE_SIZE);
	HAL_UART_Transmit_DMA(hUART, pingPackage, PACKAGE_SIZE);
}

__TRANS_OnPingTRANS_OnPing(uint8_t data[], uint16_t size) {
	UNUSED(data);
	UNUSED(sizTRANS_OnReceiveCallbackTRANS_OnReceiveCallback(UART_HandleTypeDef* huart) {
	if (huart != hUART) {
		return;
	}
	xprintbt(packageReceive, PACKAGE_SIZE);
	if (packageReceive[0] == 'P' && packageReceive[1] == 'I' && packageReceive[2] == 'N' && packageReceive[3] == 'G') {
		TRANS_OnPing(packageReceive, PACKAGE_SIZE);
	}

	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
}
