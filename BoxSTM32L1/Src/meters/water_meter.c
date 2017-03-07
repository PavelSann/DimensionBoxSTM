
#include "meters/water_meter.h"
#include "xprint.h"
#include "atomic.h"

#define WDG_HIGH_THRESHOLD 2000
#define WDG_LOW_THRESHOLD 1000
#define MIN_PAUSE_IMPULSE 500

static ADC_HandleTypeDef * hADC;
static uint32_t adcValue = 0;
static uint8_t awd = 0;
static uint32_t lastTick = 0;
static uint32_t fullValue = 0;
static uint32_t deltaValue = 0;

void WaterMeter_Init(ADC_HandleTypeDef * hadc, uint32_t adcChannel) {
	
	hADC = hadc;
	/**
	 * Включаем analog watchdog
	 */
	ADC_AnalogWDGConfTypeDef AnalogWDGConfig;
	AnalogWDGConfig.WatchdogMode = ADC_ANALOGWATCHDOG_SINGLE_REG;
	AnalogWDGConfig.Channel = adcChannel;
	AnalogWDGConfig.ITMode = ENABLE;
	AnalogWDGConfig.HighThreshold = WDG_HIGH_THRESHOLD;
	AnalogWDGConfig.LowThreshold = WDG_LOW_THRESHOLD;
	if (HAL_ADC_AnalogWDGConfig(hadc, &AnalogWDGConfig) != HAL_OK) {
		xprintf("Error init AnalogWDGConfig %x", HAL_ADC_GetError(hadc));
	}
	
	HAL_ADC_Start_DMA(hadc, &adcValue, 1);
	xprintf("WaterMeter Init & Start DMA: ADC:0x%x Channel:0x%x\n",hadc->Instance,adcChannel);
}

//void HAL_ADC_LevelOutOfWindowCallback(ADC_HandleTypeDef * hadc) {
//	uint32_t rawValue = adcValue;
//	uint32_t value = EX_ADC_VOLTAGE_FROM_12BITS(rawValue);
//	xprintf("ADC_VALUE=%d (%d) %x\n", value, rawValue);
//
//
//}

void onImpulse() {
	xprintf("WaterMeter impulse deltaValue:%d fullValue:%d\n", deltaValue, fullValue);
	ATOMIC_BLOCK{
		deltaValue++;
		fullValue++;}
}

void subValue(uint32_t delta) {
	ATOMIC_BLOCK{
		deltaValue -= delta;}
}

uint32_t getValue() {
	return deltaValue;
}

uint32_t getFullValue() {
	return fullValue;
}

void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* hadc) {

	if (__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_AWD)) {
		uint32_t tick = HAL_GetTick(); //In the default implementation, this variable is incremented each 1ms
		if (lastTick == 0 || (tick - lastTick) > MIN_PAUSE_IMPULSE) {
			lastTick = tick;
			awd = 1;
		}

	} else {
		if (awd == 1) {
			onImpulse();
		}
		awd = 0;
	}
}


