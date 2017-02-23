/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   adc.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 15 февраля 2017 г., 13:43
 */

#ifndef ADC_H
#define ADC_H

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_adc.h"
	/*
	 Результат АЦП у нас 12-битный, а значит максимальное значение равно 4095 (0b111111111111).
	 * То есть при напряжении, равном 3.3 В результат составит 4095.
	 * При напряжении 1 В получим значение преобразования: 1 * 4095 / 3.3 = 1241.
	 * Для 2 В соответственно будет 2482 и т. д.
	 */
#define VDDA_APPLI                     ((uint32_t) 3300)    /* Value of analog voltage supply Vdda (unit: mV) */
#define RANGE_12BITS                   ((uint32_t) 4095)    /* Max digital value with a full range of 12 bits */
	/**
	 * @brief  Computation of voltage (unit: mV) from ADC measurement digital
	 *         value on range 12 bits.
	 *         Calculation validity conditioned to settings:
	 *          - ADC resolution 12 bits (need to scale value if using a different
	 *            resolution).
	 *          - Power supply of analog voltage Vdda 3.3V (need to scale value
	 *            if using a different analog voltage supply value).
	 * @param ADC_DATA: Digital value measured by ADC
	 * @retval None
	 */
#define EX_ADC_VOLTAGE_FROM_12BITS(ADC_DATA)                        \
  ( ((ADC_DATA) * VDDA_APPLI) / RANGE_12BITS)

	/* ADC parameters */
	//#define ADCCONVERTEDVALUES_BUFFER_SIZE ((uint32_t)    3)    /* Size of array containing ADC converted values: set to ADC sequencer number of ranks converted, to have a rank in each address */

	/* Internal temperature sensor: constants data used for indicative values in  */
	/* this example. Refer to device datasheet for min/typ/max values.            */
	/* For more accurate values, device should be calibrated on offset and slope  */
	/* for application temperature range.                                         */
	//#define INTERNAL_TEMPSENSOR_V110       ((int32_t)  627)         /* Internal temperature sensor, parameter V110 (unit: mV). Refer to device datasheet for min/typ/max values. */
	//#define INTERNAL_TEMPSENSOR_AVGSLOPE   ((int32_t) 1610)         /* Internal temperature sensor, parameter Avg_Slope (unit: uV/DegCelsius). Refer to device datasheet for min/typ/max values. */
	//#define TEMP30_CAL_ADDR   ((uint16_t*) ((uint32_t) 0x1FF800FA)) /* Internal temperature sensor, parameter TS_CAL1: TS ADC raw data acquired at a temperature of 110 DegC (+-5 DegC), VDDA = 3.3 V (+-10 mV). */
	//#define TEMP110_CAL_ADDR  ((uint16_t*) ((uint32_t) 0x1FF800FE)) /* Internal temperature sensor, parameter TS_CAL2: TS ADC raw data acquired at a temperature of  30 DegC (+-5 DegC), VDDA = 3.3 V (+-10 mV). */
	//#define VDDA_TEMP_CAL                  ((uint32_t) 3000)        /* Vdda value with which temperature sensor has been calibrated in production (+-10 mV). */
	/* Internal voltage reference */
	//#define VREFINT_CAL       ((uint16_t*) ((uint32_t) 0x1FF800F8)) /* Internal voltage reference, parameter VREFINT_CAL: Raw data acquired at a temperature of 30 DegC (+-5 DegC), VDDA = 3.3 V (+-10 mV). */
	/**
	 * Читаем показания с ADC, синхронно
	 * @param hadc указатель на ADC_HandleTypeDef
	 * @param timeout время сбора данных с ADC
	 * @return
	 */
	uint32_t EX_ADC_SoftReadValue(ADC_HandleTypeDef* hadc, uint32_t timeout);

#ifdef __cplusplus
}
#endif

#endif /* ADC_H */

