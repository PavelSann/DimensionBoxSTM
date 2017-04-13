// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/**
 ******************************************************************************
 * File Name          : main.c
 * Description        : Main program body
 ******************************************************************************
 *
 * COPYRIGHT(c) 2017 STMicroelectronics
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *   1. Redistributions of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 *   2. Redistributions in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the documentation
 *      and/or other materials provided with the distribution.
 *   3. Neither the name of STMicroelectronics nor the names of its contributors
 *      may be used to endorse or promote products derived from this software
 *      without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32l1xx_hal.h"

/* USER CODE BEGIN Includes */
#include "stm32l1xx_hal_uart.h"
#include "config.h"
#include "transceiver.h"
#include "xprint.h"
#include "meters/water_meter.h"
#include "meters/electro_meter.h"
#include <stdbool.h>
#define TEST 0
#if TEST
	#include "../Test/sp1ml_uart_test.h"
#endif
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
COMP_HandleTypeDef hcomp1;
COMP_HandleTypeDef hcomp2;

CRC_HandleTypeDef hcrc;

TIM_HandleTypeDef htim2;

UART_HandleTypeDef huart4;
UART_HandleTypeDef huart5;
UART_HandleTypeDef huart2;
DMA_HandleTypeDef hdma_uart4_rx;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
static volatile bool readMeters = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void Error_Handler(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_TIM2_Init(void);
static void MX_UART4_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_UART5_Init(void);
static void MX_COMP2_Init(void);
static void MX_COMP1_Init(void);
static void MX_CRC_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

int main(void) {

	/* USER CODE BEGIN 1 */
	//
	/* USER CODE END 1 */

	/* MCU Configuration----------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* Configure the system clock */
	SystemClock_Config();

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_TIM2_Init();
	MX_UART4_Init();
	MX_USART2_UART_Init();
	MX_UART5_Init();
	MX_COMP2_Init();
	MX_COMP1_Init();
	MX_CRC_Init();

	/* USER CODE BEGIN 2 */
#if X_PRINT_LOG
	//	xprint_init_SWO();
	xprint_init_UART(&huart2);
	LOG("Start Box ID:0x%x DEVID:0x%x REVID:0x%x HAL:0x%x", CONFIG_ID, HAL_GetDEVID(), HAL_GetREVID(), HAL_GetHalVersion());
#endif


#if TEST
	SP1MLTest();
#endif
	PACK_Init(&hcrc);
	//запускаем таймер 2
	HAL_TIM_Base_Start_IT(&htim2);

	//Инициализируем радио модуль
	TRANSConfig transConf = {
		.hUART = &huart4,
		.localAddress = CONFIG_LOCAL_ADDRESS,
	};
	TRANS_Init(transConf);

	//Инициализируем счётчик электричества
	ElectroMeterConfig emConf = {
		.hUART = &huart5,
		.portMAX484 = MAX484RD_GPIO_Port,
		.pinRD = MAX484RD_Pin,
		.password = "777777"
	};
	ElectroMeter_Init(emConf);

	//Инициализируем счётчик воды
	WaterMeterConfig wmConf = {
		.pComp1 = &hcomp1,
		.pComp2 = &hcomp2
	};
	WaterMeter_Init(wmConf);

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */

		TRANS_ProcessPackage();
		if (readMeters == true) {
			//			HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_SET);
			uint32_t waterValue = TRANS_DISCONNECT_METER_VALUE;
			if (!WaterMeter_getError()) {
				waterValue = WaterMeter_getValue();
				//				LOG("Water value: %d ", waterValue);
			} else {
				LOG("Water meter not connect");
			}

			ElectroMeterValues values = ElectroMeter_GetValues();
			if (!values.error) {
				//LOG("Electro values: t1=%d t2=%d t3=%d t4=%d ", values.tariff1, values.tariff2, values.tariff3, values.tariff4);
			} else {
				//				LOG("Electro meter not connect");
				values.tariff1 = TRANS_DISCONNECT_METER_VALUE;
				values.tariff2 = TRANS_DISCONNECT_METER_VALUE;
				values.tariff3 = TRANS_DISCONNECT_METER_VALUE;
				values.tariff4 = TRANS_DISCONNECT_METER_VALUE;
			}

			TRANSDataMeters meters = {
				values.tariff1, values.tariff2, values.tariff3, values.tariff4,
				waterValue
			};

			TRANS_SendDataMeters(CONFIG_GATE_ADDRESS, &meters);

			//HAL_GPIO_WritePin(LedGreen_GPIO_Port, LedGreen_Pin, GPIO_PIN_RESET);
			readMeters = false;
		}
		//		__WFI;
	}
	/* USER CODE END 3 */

}

/** System Clock Configuration
 */
void SystemClock_Config(void) {

	RCC_OscInitTypeDef RCC_OscInitStruct;
	RCC_ClkInitTypeDef RCC_ClkInitStruct;

	/**Configure the main internal regulator output voltage
	 */
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = 16;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL4;
	RCC_OscInitStruct.PLL.PLLDIV = RCC_PLL_DIV2;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}

	/**Initializes the CPU, AHB and APB busses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK) {
		Error_Handler();
	}

	/**Configure the Systick interrupt time
	 */
	HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq() / 1000);

	/**Configure the Systick
	 */
	HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

	/* SysTick_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* COMP1 init function */
static void MX_COMP1_Init(void) {

	hcomp1.Instance = COMP1;
	hcomp1.Init.NonInvertingInput = COMP_NONINVERTINGINPUT_NONE;
	hcomp1.Init.TriggerMode = COMP_TRIGGERMODE_IT_RISING;
	hcomp1.Init.NonInvertingInputPull = COMP_NONINVERTINGINPUT_NOPULL;
	if (HAL_COMP_Init(&hcomp1) != HAL_OK) {
		Error_Handler();
	}

}

/* COMP2 init function */
static void MX_COMP2_Init(void) {

	hcomp2.Instance = COMP2;
	hcomp2.Init.InvertingInput = COMP_INVERTINGINPUT_1_2VREFINT;
	hcomp2.Init.NonInvertingInput = COMP_NONINVERTINGINPUT_PB4;
	hcomp2.Init.Output = COMP_OUTPUT_NONE;
	hcomp2.Init.Mode = COMP_MODE_LOWSPEED;
	hcomp2.Init.WindowMode = COMP_WINDOWMODE_ENABLE;
	hcomp2.Init.TriggerMode = COMP_TRIGGERMODE_IT_RISING_FALLING;
	if (HAL_COMP_Init(&hcomp2) != HAL_OK) {
		Error_Handler();
	}

}

/* CRC init function */
static void MX_CRC_Init(void) {

	hcrc.Instance = CRC;
	if (HAL_CRC_Init(&hcrc) != HAL_OK) {
		Error_Handler();
	}

}

/* TIM2 init function */
static void MX_TIM2_Init(void) {

	TIM_ClockConfigTypeDef sClockSourceConfig;
	TIM_MasterConfigTypeDef sMasterConfig;

	htim2.Instance = TIM2;
	htim2.Init.Prescaler = 32000;
	htim2.Init.CounterMode = TIM_COUNTERMODE_UP;
	htim2.Init.Period = 5000;
	htim2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	if (HAL_TIM_Base_Init(&htim2) != HAL_OK) {
		Error_Handler();
	}

	sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
	if (HAL_TIM_ConfigClockSource(&htim2, &sClockSourceConfig) != HAL_OK) {
		Error_Handler();
	}

	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim2, &sMasterConfig) != HAL_OK) {
		Error_Handler();
	}

}

/* UART4 init function */
static void MX_UART4_Init(void) {

	huart4.Instance = UART4;
	huart4.Init.BaudRate = 115200;
	huart4.Init.WordLength = UART_WORDLENGTH_8B;
	huart4.Init.StopBits = UART_STOPBITS_1;
	huart4.Init.Parity = UART_PARITY_NONE;
	huart4.Init.Mode = UART_MODE_TX_RX;
	huart4.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart4.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart4) != HAL_OK) {
		Error_Handler();
	}

}

/* UART5 init function */
static void MX_UART5_Init(void) {

	huart5.Instance = UART5;
	huart5.Init.BaudRate = 9600;
	huart5.Init.WordLength = UART_WORDLENGTH_8B;
	huart5.Init.StopBits = UART_STOPBITS_1;
	huart5.Init.Parity = UART_PARITY_EVEN;
	huart5.Init.Mode = UART_MODE_TX_RX;
	huart5.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart5.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart5) != HAL_OK) {
		Error_Handler();
	}

}

/* USART2 init function */
static void MX_USART2_UART_Init(void) {

	huart2.Instance = USART2;
	huart2.Init.BaudRate = 115200;
	huart2.Init.WordLength = UART_WORDLENGTH_8B;
	huart2.Init.StopBits = UART_STOPBITS_1;
	huart2.Init.Parity = UART_PARITY_NONE;
	huart2.Init.Mode = UART_MODE_TX_RX;
	huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	huart2.Init.OverSampling = UART_OVERSAMPLING_16;
	if (HAL_UART_Init(&huart2) != HAL_OK) {
		Error_Handler();
	}

}

/** 
 * Enable DMA controller clock
 */
static void MX_DMA_Init(void) {
	/* DMA controller clock enable */
	__HAL_RCC_DMA2_CLK_ENABLE();

	/* DMA interrupt init */
	/* DMA2_Channel3_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(DMA2_Channel3_IRQn, 1, 0);
	HAL_NVIC_EnableIRQ(DMA2_Channel3_IRQn);

}

/** Configure pins as 
 * Analog
 * Input
 * Output
 * EVENT_OUT
 * EXTI
 */
static void MX_GPIO_Init(void) {

	GPIO_InitTypeDef GPIO_InitStruct;

	/* GPIO Ports Clock Enable */
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_GPIOH_CLK_ENABLE();
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(GPIOA, Valve1_Pin | Valve2_Pin | LedErr_Pin | MAX484RD_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin : ButtonBlue_Pin */
	GPIO_InitStruct.Pin = ButtonBlue_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(ButtonBlue_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pins : Valve1_Pin Valve2_Pin MAX484RD_Pin */
	GPIO_InitStruct.Pin = Valve1_Pin | Valve2_Pin | MAX484RD_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	/*Configure GPIO pin : LedErr_Pin */
	GPIO_InitStruct.Pin = LedErr_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(LedErr_GPIO_Port, &GPIO_InitStruct);

	/* EXTI interrupt init*/
	HAL_NVIC_SetPriority(EXTI15_10_IRQn, 4, 0);
	HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

}

/* USER CODE BEGIN 4 */

#if !TEST

void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	TRANS_UART_RxCpltCallback(huart);
}

void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef* huart) {
	TRANS_UART_RxHalfCpltCallback(huart);
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	readMeters = true;

}

void TRANS_OnProcessPackage(TRANSPackage* pPackage) {
	//	LOG("OnReceivePackage: source:0x%x type:%d", pPackage->sourceAddress, pPackage->type);
	if (pPackage->type == TRANS_TYPE_COMMAND) {
		uint32_t command = pPackage->data.command.command;
		uint32_t p1 = pPackage->data.command.parametr1;
		//		uint32_t p2 = pPackage->data.command.parametr2;
		uint8_t valve = 0;
		GPIO_PinState state = GPIO_PIN_RESET;
		switch (command) {
			case TRANS_COMMAND_VALVE_OPEN:
				valve = p1;
				state = GPIO_PIN_RESET;
				LOG("Open the valve %d", valve);
				break;
			case TRANS_COMMAND_VALVE_CLOSE:
				state = GPIO_PIN_SET;
				valve = p1;
				LOG("Close the valve %d", valve);
				break;
			case TRANS_COMMAND_RESET:
				LOG("System reset");
				HAL_NVIC_SystemReset();
			default:
				break;
		}
		if (valve == 1) {
			HAL_GPIO_WritePin(Valve1_GPIO_Port, Valve1_Pin, state);
		}
		if (valve == 2) {
			HAL_GPIO_WritePin(Valve2_GPIO_Port, Valve2_Pin, state);
		}

	}
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	if (GPIO_Pin == ButtonBlue_Pin) {
		HAL_GPIO_TogglePin(LedErr_GPIO_Port, LedErr_Pin);
		LOG("Toggle error led");

		TRANSStatus status = TRANS_GetStatus();
		LOG("TRANSStatus: good:%d bad:%d", status.countGoodPackage, status.countBadPackage);
	}
}
#endif

void inline LedErrorSet() {
	HAL_GPIO_WritePin(LedErr_GPIO_Port, LedErr_Pin, GPIO_PIN_SET);
}

void inline LedErrorSoftWhile() {
	while (1) {
		HAL_GPIO_TogglePin(LedErr_GPIO_Port, LedErr_Pin);
		HAL_Delay(2000);
	}
}

void inline LedErrorHardWhile() {
	while (1) {
		HAL_GPIO_TogglePin(LedErr_GPIO_Port, LedErr_Pin);
		HAL_Delay(500);
	}
}

void HAL_UART_ErrorCallback(UART_HandleTypeDef* huart) {
	uint32_t uartErrorCode = HAL_UART_GetError(huart);
	LOGERR("UART 0x%x Error 0x%x", huart->Instance, uartErrorCode);
	//SEE HAL_UART_ERROR_
	LedErrorSet();
}

void TRANS_OnError(TRANSStatus status) {
	LOGERR("TRANS Error: "
			"lastError:0x%x "
			"lastTransmitStatus:0x%x "
			//"overflowQueueCount:%d",
			"countGoodPackage:%d "
			"countBadPackage:%d",
			status.lastError,
			status.lastTransmitStatus,
			//status.overflowQueueCount
			status.countGoodPackage,
			status.countBadPackage
			);
	LedErrorSet();
}

/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
void Error_Handler(void) {
	/* USER CODE BEGIN Error_Handler */
	/* User can add his own implementation to report the HAL error return state */
	LOGERR("HAL Error_Handler");
	LedErrorSoftWhile();
	/* USER CODE END Error_Handler */
}

#ifdef USE_FULL_ASSERT

/**
 * @brief Reports the name of the source file and the source line number
 * where the assert_param error has occurred.
 * @param file: pointer to the source file name
 * @param line: assert_param error line source number
 * @retval None
 */
void assert_failed(uint8_t* file, uint32_t line) {
	/* USER CODE BEGIN 6 */
	/* User can add his own implementation to report the file name and line number,
	  ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
	LOG("assert_failed: Wrong parameters value: file %s on line %d\r\n", file, line);
	LedErrorSoftWhile();
	/* USER CODE END 6 */

}

#endif

/**
 * @}
 */

/**
 * @}
 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
