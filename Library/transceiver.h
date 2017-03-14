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

	typedef uint32_t TRANS_ADDRESS;

	/**Тип содержимого пакета*/
	typedef enum {
		TRANS_TYPE_METERS = 1,
		TRANS_TYPE_COMMAND = 2,
	} TRANS_PACKAGE_TYPE;

	/** Пакет с измерениями со счётчиков	 */
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

	/**Пакет с коммандой*/
	typedef struct __packed {
		uint32_t command;
		uint32_t parametr1;
		uint32_t parametr2;
	} TRANS_DATA_COMMAND;

	/**Пакет*/
	typedef struct __packed {
		uint16_t magicMark;
		uint32_t sign;
		TRANS_ADDRESS sourceAddress;
		TRANS_ADDRESS targetAddress;
		TRANS_PACKAGE_TYPE type;

		/**Данные, тип данных зависит от значения поля type*/
		union {
			TRANS_DATA_METERS meters;
			TRANS_DATA_COMMAND command;
		} data;
		uint8_t end;
	} TRANS_PACKAGE;

#define TRANS_PACKAGE_SIZE sizeof(TRANS_PACKAGE)

	/**
	 * Инициализация модуля связи TRANS
	 * @param UARTHandle
	 */
	void TRANS_Init(UART_HandleTypeDef* UARTHandle, TRANS_ADDRESS address);
	/**
	 * Создаёт новый пакет, заполняет основные поля
	 * @param targetAddress
	 * @param type TRANS_PACKAGE_TYPE
	 * @return
	 */
	TRANS_PACKAGE TRANS_newPackage(TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type);

	/**
	 * Преобразует набор байт в TRANS_PACKAGE, заполняет указатель pPackage
	 * @param bytes массив байт, длинной TRANS_PACKAGE_SIZE
	 * @param pPackage указатель на пакет
	 * @return код ошибки, 0 если нет ошибок
	 */
	uint8_t TRANS_toPackage(uint8_t *bytes, TRANS_PACKAGE **pPackage);
	/**
	 *
	 * @param pPackage
	 * @return
	 */
	uint8_t *TRANS_toByte(TRANS_PACKAGE *pPackage);
	/**
	 * Отправляет произвольный пакет
	 * @param pPackage
	 */
	void TRANS_SendPackage(TRANS_PACKAGE *pPackage);
	/**
	 * Отправка показаний с счётчиков
	 * @param targetAddress
	 * @param dataMeters
	 */
	void TRANS_SendDataMeters(TRANS_ADDRESS targetAddress, TRANS_DATA_METERS *dataMeters);
	/**
	 * Обработчик для  HAL_UART_TxCpltCallback
	 * для приёма пакетов, нужно вызывать в HAL_UART_TxCpltCallback
	 * @param huart
	 */
	void TRANS_UART_TxCpltCallback(UART_HandleTypeDef* huart);
	/**
	 * __weak Callback, вызывается когда получен корректный пакет
	 * 
	 * @param pPackage
	 */
	void TRANS_OnReceivePackage(TRANS_PACKAGE *pPackage);

#ifdef __cplusplus
}
#endif

#endif /* SPIRIT_H */

