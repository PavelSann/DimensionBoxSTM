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
#include "tcp_connector.h"
#include "transceiver.h"
#include "xprint.h"
#include "package_queue.h"
#include <assert.h>
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
CRC_HandleTypeDef hcrc;
UART_HandleTypeDef huart4;
UART_HandleTypeDef huart5;
UART_HandleTypeDef huart2;
DMA_HandleTypeDef hdma_uart4_rx;
DMA_HandleTypeDef hdma_uart5_rx;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
void Error_Handler(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_UART4_Init(void);
static void MX_UART5_Init(void);
static void MX_USART2_UART_Init(void);
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
	MX_UART4_Init();
	MX_UART5_Init();
	MX_USART2_UART_Init();
	MX_CRC_Init();

	/* USER CODE BEGIN 2 */
#if X_PRINT_LOG
	//	xprint_init_SWO();
	xprint_init_UART(&huart2);
	LOG("Start Gate ID: 0x%x DEVID:0x%x REVID:0x%x HAL:0x%x", CONFIG_ID, HAL_GetDEVID(), HAL_GetREVID(), HAL_GetHalVersion());
#endif

#if TEST
	SP1MLTest();
#endif

	TRANSConfig conf = {
		.hUART = &huart4,
		.localAddress = CONFIG_LOCAL_ADDRESS,
	};
	TRANS_Init(conf);
	//использую одинаковый порт для TCPNotConnect и TCPConfig
	TCPConfig config = {
		.hUART = &huart5,
		.port = TCPConfig_GPIO_Port,
		.pinConfig = TCPConfig_Pin,
		.pinNotConnect = TCPNotConnect_Pin
	};
	TCP_Init(config);

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	//HAL_StatusTypeDef rStatus = HAL_UART_Receive_IT(&huart4, receiveData, UART_DT_SIZE);
	while (1) {
		if (TCP_IsConnect() != HAL_GPIO_ReadPin(ConnectLED_GPIO_Port, ConnectLED_Pin)) {
			if (TCP_IsConnect()) {
				LOG("Connect server");
			} else {
				LOG("Disconnect server");
			}
		}
		HAL_GPIO_WritePin(ConnectLED_GPIO_Port, ConnectLED_Pin, TCP_IsConnect());

		TCP_ProcessPackage();
		TRANS_ProcessPackage();
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */

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
	RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL6;
	RCC_OscInitStruct.PLL.PLLDIV = RCC_PLL_DIV3;
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

/* CRC init function */
static void MX_CRC_Init(void) {

	hcrc.Instance = CRC;
	if (HAL_CRC_Init(&hcrc) != HAL_OK) {
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
	huart5.Init.BaudRate = 115200;
	huart5.Init.WordLength = UART_WORDLENGTH_8B;
	huart5.Init.StopBits = UART_STOPBITS_1;
	huart5.Init.Parity = UART_PARITY_NONE;
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
	/* DMA2_Channel2_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(DMA2_Channel2_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(DMA2_Channel2_IRQn);
	/* DMA2_Channel3_IRQn interrupt configuration */
	HAL_NVIC_SetPriority(DMA2_Channel3_IRQn, 0, 0);
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
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOD_CLK_ENABLE();

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(TCPConfig_GPIO_Port, TCPConfig_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(LedErr_GPIO_Port, LedErr_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin Output Level */
	HAL_GPIO_WritePin(ConnectLED_GPIO_Port, ConnectLED_Pin, GPIO_PIN_RESET);

	/*Configure GPIO pin : ButtonBlue_Pin */
	GPIO_InitStruct.Pin = ButtonBlue_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(ButtonBlue_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : TCPConfig_Pin */
	GPIO_InitStruct.Pin = TCPConfig_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(TCPConfig_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : TCPNotConnect_Pin */
	GPIO_InitStruct.Pin = TCPNotConnect_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(TCPNotConnect_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : LedErr_Pin */
	GPIO_InitStruct.Pin = LedErr_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(LedErr_GPIO_Port, &GPIO_InitStruct);

	/*Configure GPIO pin : ConnectLED_Pin */
	GPIO_InitStruct.Pin = ConnectLED_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(ConnectLED_GPIO_Port, &GPIO_InitStruct);

	/* EXTI interrupt init*/
	HAL_NVIC_SetPriority(EXTI15_10_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

}

/* USER CODE BEGIN 4 */

void HAL_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	TCP_UART_RxCpltCallback(huart);
	TRANS_UART_RxCpltCallback(huart);
}

void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef* huart) {
	TRANS_UART_RxHalfCpltCallback(huart);
}

void TRANS_OnProcessPackage(TRANS_PACKAGE *pPackage) {
	//	LOG("TRANS: ProcessPackage: type:%d source:0x%x target:0x%x", pPackage->type, pPackage->sourceAddress, pPackage->targetAddress);
	TCP_SendTransPackage(pPackage);
}

void TCP_OnProcessPackage(TRANS_PACKAGE* pPackage) {
	//	LOG("TCP: ProcessPackage: type:%d source:0x%x target:0x%x", pPackage->type, pPackage->sourceAddress, pPackage->targetAddress);
	TRANS_SendPackage(pPackage);
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {

	if (GPIO_Pin == ButtonBlue_Pin) {
		HAL_GPIO_TogglePin(LedErr_GPIO_Port, LedErr_Pin);
		LOG("Toggle error led");

		TRANSStatus status = TRANS_GetStatus();
		LOG("TRANSStatus: good:%d bad:%d", status.countGoodPackage, status.countBadPackage);
	}
}

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

void TCP_OnError(TCPStatus status) {
	LOGERR("TCP Error: "
			"lastError:0x%x "
			"uartState:0x%x "
			"lastReceiveStatus:0x%x "
			"lastTransmitStatus:0x%x "
			"overflowQueueCount:%d",
			status.lastError,
			status.uartState,
			status.lastReceiveStatus,
			status.lastTransmitStatus,
			status.overflowQueueCount);
	LedErrorSet();
}

void HAL_UART_ErrorCallback(UART_HandleTypeDef* huart) {
	uint32_t uartErrorCode = HAL_UART_GetError(huart);
	LOGERR("UART %x Error %x", huart->Instance, uartErrorCode);
	LedErrorSet();
	//UART4 0x40004C00 SP1ML
	//UART5 0x40005000 TCP
	// see HAL_UART_ERROR_
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
	xprintln("HAL Error_Handler");
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
