/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   config.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 14 марта 2017 г., 15:54
 */

#ifndef CONFIG_H
	#define CONFIG_H

	#ifdef __cplusplus
extern "C" {
	#endif

	#define ELECTRO_BOX 1

	#if ELECTRO_BOX
	//Электрическая коробка
		#define CONFIG_ID 2
		#define CONFIG_LOCAL_ADDRESS 2
		#define CONFIG_GATE_ADDRESS 1

		#define ELECTRO_METER 1
		#define WATER_METER 0
	#else
	//Водная коробка
		#define CONFIG_ID 3
		#define CONFIG_LOCAL_ADDRESS 3
		#define CONFIG_GATE_ADDRESS 1

		#define WATER_METER 1
		#define ELECTRO_METER 0
	#endif

	//	#define CONFIG_ID 2
	//	#define CONFIG_LOCAL_ADDRESS 2
	//	#define CONFIG_GATE_ADDRESS 1
	//	#define WATER_METER 0
	//	#define ELECTRO_METER 1

	#ifdef __cplusplus
}
	#endif

#endif /* CONFIG_H */

