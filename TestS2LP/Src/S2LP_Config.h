/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   S2LP_Config.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 18 октября 2017 г., 13:24
 */

#ifndef S2LP_CONFIG_H
	#define S2LP_CONFIG_H

	#ifdef __cplusplus
extern "C" {
	#endif

	#define USE_HIGH_BAND
	/*  Radio configuration parameters  */
	#ifdef USE_MIDDLE_BAND
		#define BASE_FREQUENCY              433000000
	#endif

	#ifdef USE_HIGH_BAND
		#define BASE_FREQUENCY              868000000
	#endif

	#define MODULATION_SELECT           MOD_2GFSK_BT1
	#define DATARATE                    38400
	#define FREQ_DEVIATION              20000
	#define BANDWIDTH                   100000

	#define POWER_DBM                   12/*.0*/

	/*  Packet configuration parameters  */
	#define PREAMBLE_LENGTH             PREAMBLE_BYTE(4)
	#define SYNC_LENGTH                 SYNC_BYTE(4)
	#define SYNC_WORD                   0x88888888
	#define VARIABLE_LENGTH             S_ENABLE
	#define EXTENDED_LENGTH_FIELD       S_DISABLE
	#define CRC_MODE                    PKT_CRC_MODE_8BITS
	#define EN_ADDRESS                  S_DISABLE
	#define EN_FEC                      S_DISABLE
	#define EN_WHITENING                S_ENABLE

	/* Wake Up timer in ms for LDC mode */
	#define WAKEUP_TIMER                100/*.0*/

	#define PREAMBLE_BYTE(v)        (4*v)
	#define SYNC_BYTE(v)            (8*v)


	#ifdef __cplusplus
}
	#endif

#endif /* S2LP_CONFIG_H */

