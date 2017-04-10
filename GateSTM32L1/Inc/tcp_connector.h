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
		TCP_ERR_NONE = 0,
		TCP_ERR_OVERFLOW_QUEUE = 1,
		TCP_ERR_BAD_PACKAGE = 2,
		TCP_ERR_UART_TRANSMIT = 3,
		TCP_ERR_UART_RECEIVE = 4,
	} TCPError;

	typedef __IO struct {
		uint16_t overflowQueueCount;
		HAL_StatusTypeDef lastReceiveStatus;
		HAL_StatusTypeDef lastTransmitStatus;
		TCPError lastError;
		HAL_UART_StateTypeDef uartState;
	} TCPStatus;

	typedef struct {
		UART_HandleTypeDef *hUART;
		GPIO_TypeDef *port;
		uint16_t pinConfig;
		uint16_t pinNotConnect;
	} TCPConfig;



	void TCP_Init(TCPConfig configuration);
	bool TCP_IsConnect();
	void TCP_SendTransPackage(TRANS_PACKAGE *pPackage);
	void TCP_OnProcessPackage(TRANS_PACKAGE *pPackage);
	void TCP_UART_RxCpltCallback(UART_HandleTypeDef* huart);
	void TCP_ProcessPackage();
	void TCP_OnError(TCPStatus status);


#ifdef __cplusplus
}
#endif

#endif /* TCPCONNECTOR_H */

