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
#include "trans_package.h"
#include <stdbool.h>

	typedef struct {
		UART_HandleTypeDef *hUART;
		TRANS_ADDRESS localAddress;
//		GPIO_TypeDef *port;
//		uint16_t pinReset;
	} TRANSConfig;

	/**
	 * Инициализация модуля связи TRANS
	 * @param UARTHandle
	 */
	void TRANS_Init(TRANSConfig configuration);

	/**
	 * Создаёт новый пакет, заполняет основные поля
	 * @param targetAddress
	 * @param type TRANS_PACKAGE_TYPE
	 * @return
	 */
	TRANS_PACKAGE TRANS_NewLocalPackage(TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type);

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
	void TRANS_UART_RxCpltCallback(UART_HandleTypeDef* huart);
	/**
	 * __weak Callback, вызывается при обработке пакетов, через TRANS_ProcessPackage
	 * 
	 * @param pPackage
	 */
	void TRANS_OnProcessPackage(TRANS_PACKAGE *pPackage);
	/**
	 * Обрабатывает 1 пакет из очереди, вызывает TRANS_OnProcessPackage
	 */
	void TRANS_ProcessPackage();

	void TRANS_OnError(bool queueOverflow, HAL_StatusTypeDef lastReceiveStatus);

#ifdef __cplusplus
}
#endif

#endif /* SPIRIT_H */

