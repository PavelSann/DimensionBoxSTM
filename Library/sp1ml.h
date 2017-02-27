/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   spirit.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 27 февраля 2017 г., 11:42
 */

#ifndef SPIRIT_H
#define SPIRIT_H

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_uart.h"

	void SP1ML_Init(UART_HandleTypeDef* UARTHandle);
	void SP1ML_Ping();
	void SP1ML_OnReceiveCallback(UART_HandleTypeDef* huart);
	void SP1ML_OnPing(uint8_t data[],uint16_t size);

#ifdef __cplusplus
}
#endif

#endif /* SPIRIT_H */

