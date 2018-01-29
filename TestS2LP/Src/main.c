/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
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
#include "xprint.h"
#include "storage.h"
#include "MCU_Interface_template.h"
#include <stdbool.h>
#include "S2LP_Config.h"

/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
SPI_HandleTypeDef hspi1;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
static volatile FlagStatus xTxDoneFlag = RESET;
static volatile FlagStatus isInitS2LP = RESET;
static SGpioInit xGpio0IRQ = {
	S2LP_GPIO_0, //PA0
	S2LP_GPIO_MODE_DIGITAL_OUTPUT_LP,
	S2LP_GPIO_DIG_OUT_IRQ
};

static SRadioInit xRadioInit = {
	BASE_FREQUENCY,
	MODULATION_SELECT,
	DATARATE,
	FREQ_DEVIATION,
	BANDWIDTH
};

static PktBasicInit xBasicInit = {
	PREAMBLE_LENGTH,
	SYNC_LENGTH,
	SYNC_WORD,
	VARIABLE_LENGTH,
	EXTENDED_LENGTH_FIELD,
	CRC_MODE,
	EN_ADDRESS,
	EN_FEC,
	EN_WHITENING
};

static S2LPIrqs xIrqStatus;
static volatile int32_t rssidBm = -200;

static uint8_t txBuff[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
#define TX_BUFF_SIZE sizeof(txBuff)
static uint8_t rxBuff[256] = {0};

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_SPI1_Init(void);

/* USER CODE BEGIN PFP */

/* Private function prototypes -----------------------------------------------*/

void printIrqs(const char* msg, S2LPIrqs *pxIrqs) {
	LOG("S2LP IRQs: %s", msg);
	LOGMEM(pxIrqs, sizeof (S2LPIrqs));
	LOG("IRQ_RX_DATA_READY:%d", pxIrqs->IRQ_RX_DATA_READY); /*!< IRQ: RX data ready */
	LOG("IRQ_RX_DATA_DISC:%d", pxIrqs->IRQ_RX_DATA_DISC); /*!< IRQ: RX data discarded (upon filtering) */
	LOG("IRQ_TX_DATA_SENT:%d", pxIrqs->IRQ_TX_DATA_SENT); /*!< IRQ: TX data sent */
	LOG("IRQ_MAX_RE_TX_REACH:%d", pxIrqs->IRQ_MAX_RE_TX_REACH); /*!< IRQ: Max re-TX reached */
	LOG("IRQ_CRC_ERROR:%d", pxIrqs->IRQ_CRC_ERROR); /*!< IRQ: CRC error */
	LOG("IRQ_TX_FIFO_ERROR:%d", pxIrqs->IRQ_TX_FIFO_ERROR); /*!< IRQ: TX FIFO underflow/overflow error */
	LOG("IRQ_RX_FIFO_ERROR:%d", pxIrqs->IRQ_RX_FIFO_ERROR); /*!< IRQ: RX FIFO underflow/overflow error */
	LOG("IRQ_TX_FIFO_ALMOST_FULL:%d", pxIrqs->IRQ_TX_FIFO_ALMOST_FULL); /*!< IRQ: TX FIFO almost full */
	LOG("IRQ_TX_FIFO_ALMOST_EMPTY:%d", pxIrqs->IRQ_TX_FIFO_ALMOST_EMPTY); /*!< IRQ: TX FIFO almost empty */
	LOG("IRQ_RX_FIFO_ALMOST_FULL:%d", pxIrqs->IRQ_RX_FIFO_ALMOST_FULL); /*!< IRQ: RX FIFO almost full */
	LOG("IRQ_RX_FIFO_ALMOST_EMPTY:%d", pxIrqs->IRQ_RX_FIFO_ALMOST_EMPTY); /*!< IRQ: RX FIFO almost empty  */
	LOG("IRQ_MAX_BO_CCA_REACH:%d", pxIrqs->IRQ_MAX_BO_CCA_REACH); /*!< IRQ: Max number of back-off during CCA */
	LOG("IRQ_VALID_PREAMBLE:%d", pxIrqs->IRQ_VALID_PREAMBLE); /*!< IRQ: Valid preamble detected */
	LOG("IRQ_VALID_SYNC:%d", pxIrqs->IRQ_VALID_SYNC); /*!< IRQ: Sync word detected */
	LOG("IRQ_RSSI_ABOVE_TH:%d", pxIrqs->IRQ_RSSI_ABOVE_TH); /*!< IRQ: RSSI above threshold */
	LOG("IRQ_WKUP_TOUT_LDC:%d", pxIrqs->IRQ_WKUP_TOUT_LDC); /*!< IRQ: Wake-up timeout in LDC mode */
	LOG("IRQ_READY:%d", pxIrqs->IRQ_READY); /*!< IRQ: READY state */
	LOG("IRQ_STANDBY_DELAYED:%d", pxIrqs->IRQ_STANDBY_DELAYED); /*!< IRQ: STANDBY state after MCU_CK_CONF_CLOCK_TAIL_X clock cycles */
	LOG("IRQ_LOW_BATT_LVL:%d", pxIrqs->IRQ_LOW_BATT_LVL); /*!< IRQ: Battery level below threshold*/
	LOG("IRQ_POR:%d", pxIrqs->IRQ_POR); /*!< IRQ: Power On Reset */
	LOG("IRQ_BOR:%d", pxIrqs->IRQ_BOR); /*!< IRQ: Brown out event (both accurate and inaccurate)*/
	LOG("IRQ_LOCK:%d", pxIrqs->IRQ_LOCK); /*!< IRQ: LOCK state */
	LOG("IRQ_VCO_CALIBRATION_END:%d", pxIrqs->IRQ_VCO_CALIBRATION_END); /*!< IRQ: End of VCO calibration procedure */
	LOG("IRQ_PA_CALIBRATION_END:%d", pxIrqs->IRQ_PA_CALIBRATION_END); /*!< IRQ: End of PA calibration procedure */
	LOG("IRQ_PM_COUNT_EXPIRED:%d", pxIrqs->IRQ_PM_COUNT_EXPIRED); /*!< IRQ: only for debug; Power Management startup timer expiration (see reg PM_START_COUNTER, 0xB5) */
	LOG("IRQ_XO_COUNT_EXPIRED:%d", pxIrqs->IRQ_XO_COUNT_EXPIRED); /*!< IRQ: only for debug; Crystal oscillator settling time counter expired */
	LOG("IRQ_TX_START_TIME:%d", pxIrqs->IRQ_TX_START_TIME); /*!< IRQ: only for debug; TX circuitry startup time; see TX_START_COUNTER */
	LOG("IRQ_RX_START_TIME:%d", pxIrqs->IRQ_RX_START_TIME); /*!< IRQ: only for debug; RX circuitry startup time; see TX_START_COUNTER */
	LOG("IRQ_RX_TIMEOUT:%d", pxIrqs->IRQ_RX_TIMEOUT); /*!< IRQ: RX operation timeout */
	LOG("IRQ_RX_SNIFF_TIMEOUT:%d", pxIrqs->IRQ_RX_SNIFF_TIMEOUT); /*!< IRQ: RX sniff opeartion timeout */

}

void initS2LP() {
	LOG("initS2LP...");
	SdkEvalSpiInitEx(&hspi1, S2LP_CSn_GPIO_Port, S2LP_CSn_Pin);
	LOG("Shutdown S2LP...");
	/* Puts high the GPIO connected to shutdown pin */
	HAL_GPIO_WritePin(S2LP_Shutdown_GPIO_Port, S2LP_Shutdown_Pin, GPIO_PIN_SET);
	/* Puts low the GPIO connected to shutdown pin */
	HAL_GPIO_WritePin(S2LP_Shutdown_GPIO_Port, S2LP_Shutdown_Pin, GPIO_PIN_RESET);
	/* Delay to allow the circuit POR, about 700 us */
	for (volatile uint32_t i = 0; i < 0x1E00; i++);

	/* S2LP IRQ config */
	S2LPGpioInit(&xGpio0IRQ);

	/* S2LP Radio config */
	S2LPRadioInit(&xRadioInit);

	/* S2LP Radio set power */
	S2LPRadioSetMaxPALevel(S_ENABLE); //выбираем максимальную мощность 14dBm
	//	S2LPRadioSetPALeveldBm(7, POWER_DBM);// задаём 7 уровень мощности
	//	S2LPRadioSetPALevelMaxIndex(7);// выбираем 7 уровень мощности
	S2LPRadioSetRssiThreshdBm(RSSI_THREHSOLD_DBM);
	
	/* S2LP Packet config */
	S2LPPktBasicInit(&xBasicInit);

	/* S2LP IRQs enable */
	S2LPIrqs irqInit = {0};
	irqInit.IRQ_TX_DATA_SENT = S_ENABLE;
	irqInit.IRQ_RX_DATA_READY = S_ENABLE;
	S2LPGpioIrqInit(&irqInit);

	//	S2LPGpioIrqDeInit(NULL);
	//	S2LPGpioIrqConfig(TX_DATA_SENT, S_ENABLE);
	//	S2LPGpioIrqConfig(RX_DATA_READY, S_ENABLE);

	/* payload length config */
	S2LPPktBasicSetPayloadLength(TX_BUFF_SIZE);

	/* IRQ registers blanking */
	S2LPGpioIrqClearStatus();

	/* RX timeout config */
	//	S2LPTimerSetRxTimerUs(700000);

	LOG("initS2LP done");
	isInitS2LP = SET;

	//	S2LPIrqs irqMask = {0};
	//	S2LPGpioIrqGetMask(&irqMask);
	//	printIrqs("mask", &irqMask);

}

void txS2LP() {

	/* fit the TX FIFO */
	S2LPCmdStrobeFlushTxFifo();
	S2LPSpiWriteFifo(TX_BUFF_SIZE, txBuff);

	/* send the TX command */
	S2LPCmdStrobeTx();

	//	S2LPGpioIrqGetStatus(&xIrqStatus);
	/* wait for TX done */
	while (!xTxDoneFlag);
	xTxDoneFlag = RESET;
	//	LOG("Data transmit");

}

void rxS2LP() {
	/* RX command */
	S2LPCmdStrobeRx();
}

void abortS2LP() {
	S2LPGpioIrqConfig(RX_DATA_DISC, S_DISABLE);
	S2LPCmdStrobeSabort();
	for (uint32_t i = 0; i < 0xfff; i++);
	S2LPGpioIrqClearStatus();
	S2LPGpioIrqConfig(RX_DATA_DISC, S_ENABLE);
}

/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

int main(void)
{

  /* USER CODE BEGIN 1 */
	//
  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  MX_SPI1_Init();

  /* USER CODE BEGIN 2 */
#if X_PRINT_LOG
	//	xprint_init_SWO();
	xprint_init_UART(&huart2);
	LOG("Start TestS2LP");
#endif

	initS2LP();


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */
		HAL_GPIO_WritePin(LedErr_GPIO_Port, LedErr_Pin, GPIO_PIN_RESET);
		rxS2LP();
		HAL_Delay(1000);
		abortS2LP();
		txS2LP();
		//rss show
		int32_t rssi = rssidBm;
		HAL_GPIO_WritePin(LedG_GPIO_Port, LedG_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(LedB_GPIO_Port, LedB_Pin, GPIO_PIN_RESET);
		HAL_GPIO_WritePin(LedR_GPIO_Port, LedR_Pin, GPIO_PIN_RESET);
		if (rssi > -50) {
			HAL_GPIO_WritePin(LedG_GPIO_Port, LedG_Pin, GPIO_PIN_SET);
		} else if (rssi > -90) {
			HAL_GPIO_WritePin(LedB_GPIO_Port, LedB_Pin, GPIO_PIN_SET);
		} else {
			HAL_GPIO_WritePin(LedR_GPIO_Port, LedR_Pin, GPIO_PIN_SET);
		}

	}
  /* USER CODE END 3 */

}

/** System Clock Configuration
*/
void SystemClock_Config(void)
{

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
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Configure the Systick interrupt time 
    */
  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    /**Configure the Systick 
    */
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* SPI1 init function */
static void MX_SPI1_Init(void)
{

  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_4;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* USART2 init function */
static void MX_USART2_UART_Init(void)
{

  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
*/
static void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, S2LP_CSn_Pin|LedErr_Pin|S2LP_Shutdown_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, LedR_Pin|LedG_Pin|LedB_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : ButtonBlue_Pin */
  GPIO_InitStruct.Pin = ButtonBlue_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(ButtonBlue_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : S2LP_Pin3i_Pin */
  GPIO_InitStruct.Pin = S2LP_Pin3i_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(S2LP_Pin3i_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : S2LP_Pin0_Pin S2LP_Pin1_Pin */
  GPIO_InitStruct.Pin = S2LP_Pin0_Pin|S2LP_Pin1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : S2LP_CSn_Pin LedErr_Pin S2LP_Shutdown_Pin */
  GPIO_InitStruct.Pin = S2LP_CSn_Pin|LedErr_Pin|S2LP_Shutdown_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : LedR_Pin LedG_Pin LedB_Pin */
  GPIO_InitStruct.Pin = LedR_Pin|LedG_Pin|LedB_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pin : S2LP_Pin2i_Pin */
  GPIO_InitStruct.Pin = S2LP_Pin2i_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(S2LP_Pin2i_GPIO_Port, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

  HAL_NVIC_SetPriority(EXTI4_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI4_IRQn);

  HAL_NVIC_SetPriority(EXTI15_10_IRQn, 4, 0);
  HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

}

/* USER CODE BEGIN 4 */

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	if (GPIO_Pin == ButtonBlue_Pin) {
		S2LPGpioIrqGetStatus(&xIrqStatus);
		LOGMEM(&xIrqStatus, sizeof (S2LPIrqs));
	}

	if (isInitS2LP && GPIO_Pin == S2LP_Pin0_Pin) {
		/* Get the IRQ status */
		S2LPGpioIrqGetStatus(&xIrqStatus);
		//LOGMEM(&xIrqStatus, sizeof (S2LPIrqs));
		/* Check the SPIRIT TX_DATA_SENT IRQ flag */
		if (xIrqStatus.IRQ_TX_DATA_SENT) {
			xTxDoneFlag = SET;
			//			LOG("IRQ_TX_DATA_SENT");
		}

		if (xIrqStatus.IRQ_RX_DATA_READY) {
			/* Get the RX FIFO size */
			uint8_t rxDataSize = S2LPFifoReadNumberBytesRxFifo();
			/* Read the RX FIFO */
			S2LPSpiReadFifo(rxDataSize, rxBuff);
			rxBuff[rxDataSize++] = '\0';

			/* Flush the RX FIFO */
			S2LPCmdStrobeFlushRxFifo();

			/* RX command */
			S2LPCmdStrobeRx();
			rssidBm = S2LPRadioGetRssidBm();
			HAL_GPIO_WritePin(LedErr_GPIO_Port, LedErr_Pin, GPIO_PIN_SET);
			LOG("Data receiver. RSSI: %d dBm", rssidBm);
			//			LOGMEM(rxBuff, rxDataSize);

		}
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

void HAL_UART_ErrorCallback(UART_HandleTypeDef* huart) {
	uint32_t uartErrorCode = HAL_UART_GetError(huart);
	LOGERR("UART 0x%x Error 0x%x", huart->Instance, uartErrorCode);
	//SEE HAL_UART_ERROR_
	LedErrorSet();
}

void HAL_SPI_ErrorCallback(SPI_HandleTypeDef* hspi) {
	uint32_t spiErrorCode = HAL_SPI_GetError(hspi);
	LOGERR("SPI 0x%x Error 0x%x", hspi->Instance, spiErrorCode);
	//SEE HAL_SPI_ERROR_
	LedErrorSet();
}



/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void _Error_Handler(char * file, int line)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	LOGERR("HAL Error_Handler %s:%d", file, line);
	LedErrorSoftWhile();
	/* User can add his own implementation to report the HAL error return state */
	while (1) {
	}
  /* USER CODE END Error_Handler_Debug */ 
}

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
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
