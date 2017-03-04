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

#define ATOMIC_BLOCK for(int mask = _iDisGetPrimask(), flag = 1;flag;flag = _iSetPrimask(mask))


#ifdef __cplusplus
}
#endif

#endif /* ATOMIC_H */

