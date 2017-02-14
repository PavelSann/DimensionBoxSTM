
#include "processor.h"
#include "stm32l1xx_hal.h"

typedef enum {
	NOT_SHOW = 0,
	SHOW = 1,
} SH_MODE;

char showMode = NOT_SHOW;
int count = 0;
int showCount = 0;
char ledBlink = 0;
char counterSleep = 0;

void onTimer() {
	if (counterSleep > 0) {
		counterSleep--;
	}
	if (ledBlink) {
		HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_RESET);
		ledBlink = 0;
	} else {
		if (showMode == SHOW && showCount > 0) {
			//выводим значения счётчика, светодиодом
			HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_SET);
			ledBlink = 1;
			showCount--;
		}
		if (showCount == 0) {
			showMode = NOT_SHOW;
		}
	}


}

void incCount() {
	//для устранения дребезга принимает сигналы не чаше чем таймер
	if (counterSleep == 0) {
		count++;
		HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_SET);
		ledBlink = 1;
		counterSleep = 2; //пропускаем 2 такта таймера
	}
}

void doShow() {
	if (showMode == NOT_SHOW) {
		showCount = count;
		count=0;
		showMode = SHOW;
	}
}
