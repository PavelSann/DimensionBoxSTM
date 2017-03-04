
#include "adc.h"

uint32_t EX_ADC_SoftReadValue(ADC_HandleTypeDef* hadc, uint32_t timeout) {
	HAL_ADC_Start(hadc);
	HAL_ADC_PollForConversion(hadc, timeout);
	uint32_t value = HAL_ADC_GetValue(hadc);
	HAL_ADC_Stop(hadc);
	return EX_ADC_VOLTAGE_FROM_12BITS(value);
}
