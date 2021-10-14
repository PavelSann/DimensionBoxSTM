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

#ifdef X_PRINT_NO_LOG
#define X_PRINT_UART 0
#define X_PRINT_LOG 0
#endif

#ifndef X_PRINT_UART
#define X_PRINT_UART 1
#endif

#ifndef X_PRINT_LOG
#define X_PRINT_LOG 1
#endif

#ifdef __cplusplus
extern "C" {
#endif

#if X_PRINT_UART
#define HEADER_HAL_UART
#endif
#include "stm32_hal.h"
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
	void xprint_init_UART(UART_HandleTypeDef* huart);
#endif


#if X_PRINT_LOG
	/**
	 *Format support:<br>
	 *LOG("%d", 1234);			"1234"<br>
	 *LOG("%6d,%3d%%", -200, 5);	"  -200,  5%"<br>
	 *LOG("%-6u", 100);			"100   "<br>
	 *LOG("%ld", 12345678L);		"12345678"<br>
	 *LOG("%04x", 0xA3);			"00a3"<br>
	 *LOG("%08LX", 0x123ABC);		"00123ABC"<br>
	 *LOG("%016b", 0x550F);		"0101010100001111"<br>
	 *LOG("%s", "String");		"String"<br>
	 *LOG("%-4s", "abc");			"abc "<br>
	 *LOG("%4s", "abc");			" abc"<br>
	 *LOG("%c", 'a');				"a"<br>
	 */
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

