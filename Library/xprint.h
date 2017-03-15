/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   print.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 1 марта 2017 г., 15:12
 */

#ifndef X_PRINT_H
#define X_PRINT_H
#ifndef X_PRINT_UART
#define X_PRINT_UART 1
#endif

#ifndef X_PRINT_LOG
#define X_PRINT_LOG 1
#endif

#ifdef __cplusplus
extern "C" {
#endif
#include "stm32l1xx_hal.h"
#include "xprintf.h"
	void xprint_init_SWO();
	void xprintln(const char* str);
	void xprint(const void* buff, int begin, int len);
	/**
	 * byte buffer dump
	 * @param buff
	 * @param len
	 */
	void xprintbt(const void* buff, int len);
#if X_PRINT_UART
#include "stm32l1xx_hal_uart.h"
	void xprint_init_UART(UART_HandleTypeDef* huart);
#endif


#if X_PRINT_LOG

#define LOG(args...) xprintf(args);xputc('\n')
#define LOGMEM(buff,buffLn) xprintbt(buff,buffLn)
#define LOGERR(args...)xprintf("%d	%s:%d	",HAL_GetTick(),__FILE__, __LINE__); xprintf(args);xputc('\n')
#else
#define LOG(args...)
#define LOGMEM(buff,buffLn)
#define LOGERR(args...)
#endif

#ifdef __cplusplus
}
#endif

#endif /* PRINT_H */

