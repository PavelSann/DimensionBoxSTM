// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include "meters/water_meter.h"
#include "xprint.h"
#include "atomic.h"

#define MIN_PAUSE_IMPULSE 1000
//Определять очень низкий уровень напряжения, как ошибку обрыва провода
#define DETECT_LOW_LEVEL_AS_ERROR 1

static WaterMeterConfig conf;
static volatile uint32_t value = 0;
static volatile WaterMeteError error = WaterMete_OK;

void WaterMeter_Init(WaterMeterConfig config) {
	conf = config;
	value = conf.beginValue;
	assert_param(conf.pComp1 != NULL);
	HAL_StatusTypeDef stat1 = HAL_COMP_Start_IT(conf.pComp1);
	if (stat1 != HAL_OK) {
		LOGERR("WaterMeter init error COMP1:0x%x", stat1);
	}

#if DETECT_LOW_LEVEL_AS_ERROR
	assert_param(conf.pComp2 != NULL);
	HAL_StatusTypeDef stat2 = HAL_COMP_Start_IT(conf.pComp2);
	if (stat2 != HAL_OK) {
		LOGERR("WaterMeter init error COMP2:0x%x", stat2);
	}
#endif

	LOG("WaterMeter Init");

#if DETECT_LOW_LEVEL_AS_ERROR
	//проверяем на обрыв провода
	if (HAL_COMP_GetOutputLevel(conf.pComp2) == COMP_OUTPUTLEVEL_LOW) {
		error = WaterMete_ERR_NOT_CONNECT;
	}
#endif
}

void HAL_COMP_TriggerCallback(COMP_HandleTypeDef *hcomp) {
	static uint32_t lastTick = 0; //защита от дребезга контактов
	//В прерывании нельзя делать длинные операции, даже print

	if (HAL_COMP_GetOutputLevel(conf.pComp1) == COMP_OUTPUTLEVEL_HIGH) {
		//импульс
		uint32_t tick = HAL_GetTick(); //In the default implementation, this variable is incremented each 1ms
		if (lastTick == 0 || (tick - lastTick) > MIN_PAUSE_IMPULSE) {//защита от дребезга контактов
			lastTick = tick;

			ATOMIC_BLOCK() {
				value++;
			}
		}
	}
#if DETECT_LOW_LEVEL_AS_ERROR
	//состояние подключения датчика
	if (HAL_COMP_GetOutputLevel(conf.pComp2) == COMP_OUTPUTLEVEL_HIGH) {
		error = WaterMete_OK;
	} else {
		error = WaterMete_ERR_NOT_CONNECT;
	}
#endif
}

void WaterMeter_subValue(uint32_t delta) {

	ATOMIC_BLOCK() {
		value -= delta;
	}
}

uint32_t WaterMeter_getValue() {
	return value;
}

WaterMeteError WaterMeter_getError() {
	return error;
}

