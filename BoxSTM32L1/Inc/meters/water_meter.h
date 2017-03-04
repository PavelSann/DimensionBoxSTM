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
#include "adc.h"

	void WaterMeter_Init(ADC_HandleTypeDef * hadc,uint32_t adcChannel);

#ifdef __cplusplus
}
#endif

#endif /* WATER_METER_H */

