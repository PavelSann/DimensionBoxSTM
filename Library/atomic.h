/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   atomic.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 4 марта 2017 г., 16:57
 */

#ifndef ATOMIC_H
#define ATOMIC_H

#ifdef __cplusplus
extern "C" {
#endif

	__attribute__ ( (always_inline)) __STATIC_INLINE int _iDisGetPrimask(void) {
		int priMask;
		__ASM volatile ("MRS %0, primask" : "=r" (priMask)); //read primask
		__ASM volatile ("cpsid i" : : : "memory"); //enable_irq
		return priMask;
	}

	__attribute__ ( (always_inline)) __STATIC_INLINE int _iSetPrimask(int priMask) {
		__ASM volatile ("MSR primask, %0" : : "r" (priMask) : "memory"); //
		return 0;
	}

	/**Блок в котором запрещены все прерывания*/
#define ATOMIC_BLOCK() for(int mask = _iDisGetPrimask(), flag = 1; flag; flag = _iSetPrimask(mask))

//	__attribute__ ( (always_inline)) __STATIC_INLINE uint8_t CompareAndSet(uint32_t * ptr, uint32_t oldValue, uint32_t newValue) {
//		// эксклюзивно читаем значение переменной и сравниваем со старым значением
//		if (__LDREXW(ptr) == oldValue) {
//			// пытаемся эксклюзивно записать в переменную новое значение
//			return __STREXW(newValue, ptr) == 0;
//		}
//		// кто-то изменил ячейку до нас
//		__CLREX();
//		return 0;
//	}

#ifdef __cplusplus
}
#endif

#endif /* ATOMIC_H */

