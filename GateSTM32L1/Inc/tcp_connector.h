/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   TCPConnector.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 21 февраля 2017 г., 15:18
 */

#ifndef TCPCONNECTOR_H
#define TCPCONNECTOR_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_uart.h"
#include "trans_package.h"
#include "stdbool.h"

	typedef enum {
		TCP_OK = 0x00,
		TCP_ERROR = 0x01,
	} TCP_Status;

	void TCP_Init(UART_HandleTypeDef *UARTHandle, GPIO_TypeDef *GPIO_Port, uint16_t config_Pin, uint16_t notConnect_Pin);
	bool TCP_IsConnect();
	TCP_Status TCP_SendTransPackage(TRANS_PACKAGE *pPackage);
	void TCP_OnProcessPackage(TRANS_PACKAGE *pPackage);
	void TCP_UART_RxCpltCallback(UART_HandleTypeDef* huart);
	void TCP_ProcessPackage();
	void TCP_OnError(uint8_t queueOverflow, uint8_t receiveStatusError);


#ifdef __cplusplus
}
#endif

#endif /* TCPCONNECTOR_H */

