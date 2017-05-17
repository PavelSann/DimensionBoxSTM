/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   storage.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 16 мая 2017 г., 15:14
 */

#ifndef STORAGE_H
#define STORAGE_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32l1xx_hal.h"
#include "stm32l1xx_hal_flash.h"
	//#include "stm32l1xx_hal_flash_ex.h"



	void STORAGE_Init(size_t regionSize);

	HAL_StatusTypeDef STORAGE_WriteWord(uint32_t offset, uint32_t value);
	
	uint32_t STORAGE_ReadWord(uint32_t offset);


#ifdef __cplusplus
}
#endif

#endif /* STORAGE_H */

