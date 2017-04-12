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
	/**Значение для не подключённого счётчика*/
#define TRANS_DISCONNECT_METER_VALUE 0xFFFFFFFF

	enum TRANS_COMMANDS {
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
	} TRANS_DATA_COMMAND;

	/**Пакет*/
	typedef struct __packed {
		uint16_t magicMark;
		uint32_t sign;
		TRANS_ADDRESS sourceAddress;
		TRANS_ADDRESS targetAddress;
		TRANS_PACKAGE_TYPE type; //размер который занимает enum не специфицированно, в trans_package.h есть assert

		/**Данные, тип данных зависит от значения поля type*/
		union {
			TRANS_DATA_METERS meters;
			TRANS_DATA_COMMAND command;
		} data;
		uint8_t end;
	} TRANS_PACKAGE;


	/**
	 * Создаёт новый пакет
	 * @param sourceAddress
	 * @param targetAddress
	 * @param type
	 * @return
	 */
	TRANS_PACKAGE TRANS_NewPackage(TRANS_ADDRESS sourceAddress, TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type);

	/**
	 * Преобразует набор байт в TRANS_PACKAGE, заполняет указатель pPackage
	 * @param bytes массив байт, длинной TRANS_PACKAGE_SIZE
	 * @param pPackage указатель на пакет
	 * @return код ошибки, 0 если нет ошибок
	 */
	uint8_t TRANS_ByteToPackage(uint8_t *bytes, TRANS_PACKAGE **pPackage);
	/**
	 *
	 * @param pPackage
	 * @return
	 */
	uint8_t *TRANS_PackageToByte(TRANS_PACKAGE *pPackage);
	/**
	 *Возвращает true если переданы первый и второй байты пакета
	 * @param byteFirst первый байт
	 * @param byteSecond второй байт
	 * @return
	 */
	bool TRANS_IsMarkBeginPackage(uint8_t byteFirst, uint8_t byteSecond);


	/**Размер пакета в байтах*/
#define TRANS_PACKAGE_SIZE sizeof(TRANS_PACKAGE)
	/**Длина метки начала пакета*/
#define TRANS_PACKAGE_MARK_SIZE 2

#ifdef __cplusplus
}
#endif

#endif /* TRANS_PACKAGE_H */

