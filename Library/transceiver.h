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

#ifndef TRANSCEIVER_H
#define TRANSCEIVER_H

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_uart.h"
#include "trans_package.h"
#include <stdbool.h>

	typedef struct {
		UART_HandleTypeDef *hUART;
		TRANSAddress localAddress;
		//		GPIO_TypeDef *port;
		//		uint16_t pinReset;
	} TRANSConfig;

	typedef enum {
		TRANS_ERR_NONE = 0,
		TRANS_ERR_OVERFLOW_QUEUE = 1,
		TRANS_ERR_BAD_PACKAGE = 2,
		TRANS_ERR_UART_TRANSMIT = 3,
		TRANS_ERR_UART_RECEIVE = 4,
		TRANS_ERR_UART_DMA = 5,
	} TRANSError;

	typedef __IO struct {
		//		uint16_t overflowQueueCount;
		HAL_StatusTypeDef lastTransmitStatus;
		TRANSError lastError;
		uint32_t countGoodPackage;
		uint32_t countBadPackage;
		uint32_t countSkipPackage;
	} TRANSStatus;

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
	TRANSPackage TRANS_NewLocalPackage(TRANSAddress targetAddress, TRANSPackageType type);

	/**
	 * Отправляет произвольный пакет
	 * @param pPackage
	 */
	void TRANS_SendPackage(TRANSPackage *pPackage);
	/**
	 * Отправка показаний с счётчиков
	 * @param targetAddress
	 * @param dataMeters
	 */
	void TRANS_SendDataMeters(TRANSAddress targetAddress, TRANSDataMeters *dataMeters);
	/**
	 * Обработчик для  HAL_UART_RxCpltCallback
	 * для приёма пакетов, нужно вызывать в HAL_UART_RxCpltCallback
	 * @param huart
	 */
	void TRANS_UART_RxCpltCallback(UART_HandleTypeDef* huart);
	/**
	 * Обработчик для  HAL_UART_RxHalfCpltCallback
	 * для приёма пакетов, нужно вызывать в HAL_UART_RxHalfCpltCallback
	 * @param huart
	 */
	void TRANS_UART_RxHalfCpltCallback(UART_HandleTypeDef* huart);
	/**
	 * __weak Callback, вызывается при обработке пакетов, через TRANS_ProcessPackage
	 * 
	 * @param pPackage
	 */
	void TRANS_OnProcessPackage(TRANSPackage *pPackage);
	/**
	 * Обрабатывает 1 пакет из очереди, вызывает TRANS_OnProcessPackage
	 */
	void TRANS_ProcessPackage();
	/**
	 * Информация о состоянии
	 * @return
	 */
	TRANSStatus TRANS_GetStatus();
	/**
	 * Вызывается при ошибке
	 * @param status
	 */
	void TRANS_OnError(TRANSStatus status);

#ifdef __cplusplus
}
#endif

#endif /* TRANSCEIVER_H */

