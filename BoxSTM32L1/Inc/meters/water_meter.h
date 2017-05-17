/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   water_meter.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 3 марта 2017 г., 12:39
 */

#ifndef WATER_METER_H
#define WATER_METER_H

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"

	typedef enum {
		WaterMete_OK = 0,
		/*Нет ответа от счётчика*/
		WaterMete_ERR_NOT_CONNECT = 1,
	} WaterMeteError;

	typedef struct {
		COMP_HandleTypeDef *pComp1;
		COMP_HandleTypeDef *pComp2;
		uint32_t beginValue;
	} WaterMeterConfig;

	void WaterMeter_Init(WaterMeterConfig config);
	void WaterMeter_subValue(uint32_t delta);
	uint32_t WaterMeter_getValue();
	WaterMeteError WaterMeter_getError();

#ifdef __cplusplus
}
#endif

#endif /* WATER_METER_H */

