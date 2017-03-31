
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

static COMP_HandleTypeDef *pCmp1;
static COMP_HandleTypeDef *pCmp2;

static uint32_t lastTick = 0;
static uint32_t value = 0;
static WaterMeteError error = WaterMete_OK;

void WaterMeter_Init(COMP_HandleTypeDef *pComp1, COMP_HandleTypeDef *pComp2) {

	pCmp1 = pComp1;
	pCmp2 = pComp2;
	HAL_StatusTypeDef stat1 = HAL_COMP_Start_IT(pComp1);
	HAL_StatusTypeDef stat2 = HAL_COMP_Start_IT(pComp2);
	if (stat1 != HAL_OK || stat2 != HAL_OK) {
		LOGERR("WaterMeter init error COMP1:0x%x COMP2:0x%x", stat1, stat2);
	}
	LOG("WaterMeter Init: Comp1:0x%x Comp2:0x%x", pComp1->Instance, pComp2->Instance);

	//проверяем на обрыв провода
	if (HAL_COMP_GetOutputLevel(pCmp2) == COMP_OUTPUTLEVEL_LOW) {
		error = WaterMete_ERR_NOT_CONNECT;
	}
}

void HAL_COMP_TriggerCallback(COMP_HandleTypeDef *hcomp) {
	//В прерывании нельзя делать длинные операции, даже print

	if (HAL_COMP_GetOutputLevel(pCmp1) == COMP_OUTPUTLEVEL_HIGH) {
		//импульс
		uint32_t tick = HAL_GetTick(); //In the default implementation, this variable is incremented each 1ms
		if (lastTick == 0 || (tick - lastTick) > MIN_PAUSE_IMPULSE) {//защита от дребезга контактов
			lastTick = tick;
			ATOMIC_BLOCK{
				value++;}
		}
	}

	//состояние подключения датчика
	if (HAL_COMP_GetOutputLevel(pCmp2) == COMP_OUTPUTLEVEL_HIGH) {
		error = WaterMete_OK;
	} else {
		error = WaterMete_ERR_NOT_CONNECT;
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

