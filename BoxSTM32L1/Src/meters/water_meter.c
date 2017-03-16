
#include "meters/water_meter.h"
#include "xprint.h"
#include "atomic.h"

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


#define WDG_HIGH_THRESHOLD 2000
#define WDG_LOW_THRESHOLD 1000
#define MIN_PAUSE_IMPULSE 300
#define MIN_VOLT 500

static ADC_HandleTypeDef * hADC;
static uint8_t awd = 0;
static uint32_t lastTick = 0;
static uint32_t value = 0;
static WaterMeteError error = WaterMete_OK;

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
		LOGERR("Error init AnalogWDGConfig %x", HAL_ADC_GetError(hadc));
	}

	HAL_StatusTypeDef status = HAL_ADC_Start_IT(hADC);
	if (status != HAL_OK) {
		LOGERR("WaterMeter init error 0x%x", status);
	}
	LOG("WaterMeter Init: ADC:0x%x Channel:0x%x", hadc->Instance, adcChannel);
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) {
	//В прерывании нельзя делать длинные операции, даже print
	
	uint32_t val12Bit = HAL_ADC_GetValue(hadc);
	uint32_t waterVolt = EX_ADC_VOLTAGE_FROM_12BITS(val12Bit);
	
	if (__HAL_ADC_GET_FLAG(hadc, ADC_FLAG_AWD)) {
		if (waterVolt < MIN_VOLT) {
			error = WaterMete_ERR_NOT_CONNECT;
		}else{
			error=WaterMete_OK;
		}
		uint32_t tick = HAL_GetTick(); //In the default implementation, this variable is incremented each 1ms
		if (lastTick == 0 || (tick - lastTick) > MIN_PAUSE_IMPULSE) {
			lastTick = tick;
			awd = 1;
		}

	} else {
		if (awd == 1) {
			ATOMIC_BLOCK{
				value++;}
		}
		awd = 0;
	}
}

void WaterMeter_subValue(uint32_t delta) {
	ATOMIC_BLOCK{
		value -= delta;}
}

uint32_t WaterMeter_getValue() {
	return value;
}

WaterMeteError WaterMeter_getError() {
	return error;
}

