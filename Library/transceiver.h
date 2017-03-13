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

	typedef uint32_t SOURCE_ADDRESS;
	typedef uint32_t TARGET_ADDRESS;

	typedef enum {
		TRANS_TYPE_METERS = 1,
		TRANS_TYPE_COMMAND = 2,
	} TRANS_PACKAGE_TYPE;

	typedef struct __packed {
		uint32_t value0;
		uint32_t value1;
		uint32_t value2;
		uint32_t value3;
		uint32_t value4;
		uint32_t value5;
		uint32_t value6;
		uint32_t value7;
	} TRANS_DATA_METERS;

	typedef struct __packed {
		uint32_t command;
		uint32_t parametr1;
		uint32_t parametr2;
	} TRANS_DATA_COMMAND;

	typedef union {
		TRANS_DATA_METERS meters;
		TRANS_DATA_COMMAND command;
	} TRANS_DATA;

	typedef struct __packed {
		uint16_t magicMark;
		uint32_t sign;
		SOURCE_ADDRESS sourceAddress;
		TARGET_ADDRESS targetAddress;
		TRANS_PACKAGE_TYPE type;
		TRANS_DATA data;
		uint8_t end;
	} TRANS_PACKAGE;

#define TRANS_PACKAGE_SIZE sizeof(TRANS_PACKAGE)

	typedef struct {
		union  {
			TRANS_PACKAGE *package;
			uint8_t *bytes;
		} data;
		uint8_t error;
	} TRANS_PACKAGE_BYTES;


	void TRANS_Init(UART_HandleTypeDef* UARTHandle);
	void TRANS_MeterSend(TRANS_DATA_METERS *dataMeters);
	void TRANS_UART_TxCpltCallback(UART_HandleTypeDef* huart);
	void TRANS_OnReceivePackage(TRANS_PACKAGE *pPackage);

#ifdef __cplusplus
}
#endif

#endif /* SPIRIT_H */

