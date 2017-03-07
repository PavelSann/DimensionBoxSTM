#include "meters/electro_meter.h"



static UART_HandleTypeDef *hUART;
static GPIO_TypeDef* MAX484_RD_Port;
static uint16_t MAX484_RD_Pin;

void ElectroMeter_Init(UART_HandleTypeDef * huart, GPIO_TypeDef* GPIO_MAX484_RD_Port, uint16_t GPIO_MAX484_RD_Pin) {
	hUART = huart;
	MAX484_RD_Port = GPIO_MAX484_RD_Port;
	MAX484_RD_Pin = GPIO_MAX484_RD_Pin;
//	huart->Init.BaudRate = 9600;
	xprintf("ElectroMeter Init: UART:0x%x MAX484_Port:0x%x MAX484_Pin:0x%x \n",huart->Instance,*MAX484_RD_Port,MAX484_RD_Pin);
}

void ElectroMeter_CMD() {
	//	uint8_t data[] = {'/', '?', '1', '1', '1', '7', '5', '5', '0', '2', '3', '!', 0x0D, 0x0A}; //CR, возврат каретки,  код ODH;  LF,  перевод строки,  код ОАН
	xprintln("Enter command:");
	char command[102];
	xgets(command, 100);
	int ln = 0;
	for (ln = 0; command[ln] != 0 && ln < 102; ln++);
	command[ln++] = 0x0D;
	command[ln++] = 0x0A;
	xprintbt(command, ln);
	HAL_GPIO_TogglePin(LedGreen_GPIO_Port, LedGreen_Pin);
	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_SET); //вкл на передачу
	HAL_UART_Transmit(hUART, command, ln, 200);

	uint8_t result[100] = {0};
	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_RESET); //вкл на приём
	HAL_UART_Receive(hUART, result, 100, 1000);
	xprintbt(result, 100);
	HAL_GPIO_TogglePin(LedGreen_GPIO_Port, LedGreen_Pin);
}
