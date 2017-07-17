
/* 
 * File:   stm32_hal.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 17 июля 2017 г., 8:52
 */

#ifndef STM32_HAL_H
	#define STM32_HAL_H

	#ifdef __cplusplus
extern "C" {
	#endif

	//STM32L152xE
	//STM32F207xx

	//HEADER_HAL_UART
	//HEADER_HAL_FLASH
	//HEADER_HAL_CRC

	#if defined(STM32L152xE)
		#include "stm32l1xx_hal.h"
		#ifdef HEADER_HAL_UART
			#include "stm32l1xx_hal_uart.h"
		#endif
		#ifdef HEADER_HAL_FLASH
			#include "stm32l1xx_hal_flash.h"
			#include "stm32l1xx_hal_flash_ex.h"
		#endif
		#ifdef HEADER_HAL_CRC
			#include "stm32l1xx_hal_crc.h"
		#endif
	#elif defined(STM32F207xx)
		#include "stm32f2xx_hal.h"
		#ifdef HEADER_HAL_UART
			#include "stm32f2xx_hal_uart.h"
		#endif
		#ifdef HEADER_HAL_FLASH
			#include "stm32f2xx_hal_flash.h"
			#include "stm32f2xx_hal_flash_ex.h"
		#endif
		#ifdef HEADER_HAL_CRC
			#include "stm32f2xx_hal_crc.h"
		#endif
	#else
		#warning "Select target STM32 device. (in file stm32_hal.h)"
	#endif





	#ifdef __cplusplus
}
	#endif

#endif /* STM32_HAL_H */

