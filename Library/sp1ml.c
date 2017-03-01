#include "sp1ml.h"
#include "xprint.h"

#define SEND_TIMEOUT 500
#define PACKAGE_SIZE 4
//typedef void (*CALLBACK)(uint8_t data[PACKAGE_SIZE]);
static UART_HandleTypeDef *hUART;
static uint8_t packageReceive[PACKAGE_SIZE];
//CALLBACK onPing;

void SP1ML_Init(UART_HandleTypeDef *UARTHandle) {
	hUART = UARTHandle;
	//	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
	HAL_UART_Receive_DMA(hUART, packageReceive, PACKAGE_SIZE);
}

uint8_t pingPackage[PACKAGE_SIZE] = {'P', 'I', 'N', 'G'};

void SP1ML_Ping() {
	//	HAL_UART_Transmit_IT(hUART, pingPackage, PACKAGE_SIZE);
	HAL_UART_Transmit_DMA(hUART, pingPackage, PACKAGE_SIZE);
}

__weak void SP1ML_OnPing(uint8_t data[], uint16_t size) {
	UNUSED(data);
	UNUSED(size);
}

void SP1ML_OnReceiveCallback(UART_HandleTypeDef* huart) {
	if (huart != hUART) {
		return;
	}
	xprintbt(packageReceive, PACKAGE_SIZE);
	if (packageReceive[0] == 'P' && packageReceive[1] == 'I' && packageReceive[2] == 'N' && packageReceive[3] == 'G') {
		SP1ML_OnPing(packageReceive, PACKAGE_SIZE);
	}

	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
}
