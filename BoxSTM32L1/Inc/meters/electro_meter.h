/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   electro_meter.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 7 марта 2017 г., 9:55
 */

#ifndef ELECTRO_METER_H
#define ELECTRO_METER_H

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_uart.h"
#include "xprint.h"

	void ElectroMeter_Init(UART_HandleTypeDef * huart, GPIO_TypeDef* GPIO_MAX484_RD_Port, uint16_t GPIO_MAX484_RD_Pin);
	void ElectroMeter_CMD() ;



#ifdef __cplusplus
}
#endif

#endif /* ELECTRO_METER_H */

