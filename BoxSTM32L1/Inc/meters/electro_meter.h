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

	typedef enum {
		ElectroMeter_OK = 0,
		/*Общая ошибка*/
		ElectroMeter_ERROR = 1,
		/*Недопустимое число параметров в массиве. число параметров
		превышает допустимое значение и параметр, в ответ которого
		послано это сообщение, игнорируется
		 */
		ElectroMeter_ERR10 = 10,
		/*Команда не поддерживается устройством. Принятая команда
		не поддерживается и была проигнорирована (например –
		команда W2)
		 */
		ElectroMeter_ERR11 = 11,
		/*Неизвестное имя параметра.
		Возвращается если:
		– нет параметра в списке;
		– попытка записи непрограммируемого параметра;
		– запрос значения недоступного для чтения параметра
		 */
		ElectroMeter_ERR12 = 12,
		/* Неправильная структура параметра.
		 Возвращается, если фор-мат параметра не соответствует описанию
		 */
		ElectroMeter_ERR13 = 13,
		/*Не нажата кнопка «ДСТП». Невозможна запись параметров в
		память счётчика. Необходимо снять пломбу с кнопки «ДСТП» и
		перевести счётчик в режим программирования
		 */
		ElectroMeter_ERR14 = 14,
		/*Отказано в доступе.
		 Обнаружена попытка не парольного программирования (без предварительного выполнения команды «P1»)
		 */
		ElectroMeter_ERR15 = 15,
		/* Нет прав на программирование
		 */
		ElectroMeter_ERR16 = 16,
		/*Недопустимое значение параметра.
		 значение параметра на-ходится вне допустимого интервала
		 */
		ElectroMeter_ERR17 = 17,
		/*Не существует запрошенное значение параметра. Отсутствует
		запрашиваемая дата в списке дат профилей или накопленных
		энергий
		 */
		ElectroMeter_ERR18 = 18,

	} ElectroMeterStatus;

	typedef struct {
		ElectroMeterStatus status;
		uint32_t tariff1;
		uint32_t tariff2;
		uint32_t tariff3;
		uint32_t tariff4;
	} ElectroMeterValues;


	void ElectroMeter_Init(UART_HandleTypeDef * huart, GPIO_TypeDef* GPIO_MAX484_RD_Port, uint16_t GPIO_MAX484_RD_Pin);
	ElectroMeterValues ElectroMeter_GetValues();
	void ElectroMeter_ReadData();


#ifdef __cplusplus
}
#endif

#endif /* ELECTRO_METER_H */

