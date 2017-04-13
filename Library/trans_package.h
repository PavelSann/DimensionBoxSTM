/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   trans_package.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 15 марта 2017 г., 11:14
 */

#ifndef TRANS_PACKAGE_H
#define TRANS_PACKAGE_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include <limits.h>
#include <stdbool.h>
#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_crc.h"

	typedef uint32_t TRANSAddress;

	/**Тип содержимого пакета*/
	typedef enum {
		TRANS_TYPE_METERS = 1,
		TRANS_TYPE_COMMAND = 2,
	} TRANSPackageType;

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
	} TRANSDataMeters;
	/**Значение для не подключённого счётчика*/
#define TRANS_DISCONNECT_METER_VALUE 0xFFFFFFFF

	enum TRANSCommand {
		TRANS_COMMAND_NOP = 0,
		TRANS_COMMAND_VALVE_OPEN = 1,
		TRANS_COMMAND_VALVE_CLOSE = 2,
		TRANS_COMMAND_RESET = 0xFF,
	};

	/**Пакет с коммандой*/
	typedef struct __packed {
		uint32_t command;
		uint32_t parametr1;
		uint32_t parametr2;
	} TRANSDataCommand;

	/**Пакет*/
	typedef struct __packed {
		uint16_t magicMark;
		TRANSAddress sourceAddress;
		TRANSAddress targetAddress;
		TRANSPackageType type; //размер который занимает enum не специфицированно, в trans_package.h есть assert

		/**Данные, тип данных зависит от значения поля type*/
		union {
			TRANSDataMeters meters;
			TRANSDataCommand command;
		} data;
		uint8_t end;
		uint32_t crc;
	} TRANSPackage;

	typedef enum {
		PACK_ERR_NONE=0,
		PACK_ERR_BAD_MARK=1,
		PACK_ERR_BAD_END_BYTE=2,
		PACK_ERR_BAD_CRC=3,
	} PACKError;

	void PACK_Init(CRC_HandleTypeDef *hcrc);

	/**
	 * Создаёт новый пакет
	 * @param sourceAddress
	 * @param targetAddress
	 * @param type
	 * @return
	 */
	TRANSPackage PACK_NewPackage(TRANSAddress sourceAddress, TRANSAddress targetAddress, TRANSPackageType type);

	/**
	 * Преобразует набор байт в TRANS_PACKAGE, заполняет указатель pPackage
	 * @param bytes массив байт, длинной TRANS_PACKAGE_SIZE
	 * @param pPackage указатель на пакет
	 * @return код ошибки, 0 если нет ошибок
	 */
	PACKError PACK_ByteToPackage(uint8_t *bytes, TRANSPackage **pPackage);
	/**
	 *
	 * @param pPackage
	 * @return
	 */
	uint8_t *PACK_PackageToByte(TRANSPackage *pPackage);
	/**
	 *Возвращает true если переданы первый и второй байты пакета
	 * @param byteFirst первый байт
	 * @param byteSecond второй байт
	 * @return
	 */
	bool PACK_IsMarkBeginPackage(uint8_t byteFirst, uint8_t byteSecond);


	/**Размер пакета в байтах*/
#define TRANS_PACKAGE_SIZE sizeof(TRANSPackage)
	/**Длина метки начала пакета*/
#define TRANS_PACKAGE_MARK_SIZE 2

#ifdef __cplusplus
}
#endif

#endif /* TRANS_PACKAGE_H */

