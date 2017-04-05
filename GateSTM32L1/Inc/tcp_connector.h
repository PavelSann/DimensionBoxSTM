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

	typedef struct {
		UART_HandleTypeDef *hUART;
		GPIO_TypeDef *port;
		uint16_t pinConfig;
		uint16_t pinNotConnect;
	} TCPConfig;

	void TCP_Init(TCPConfig configuration);
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

