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
  //DATARATE 100 bps and 500 kbps
  //#define DATARATE                    300 //бит/сек(bps)
#define DATARATE                    38400 //bps =38,4кбит/сек
#define FREQ_DEVIATION              20000 //20kHz
#define BANDWIDTH                   100000 // 100kHz
  /*
   * Уровни мощности:
   *дБм(dBm)	мВт(mW)
   * 0		1
   * 1		1.3
   * 2		1.6
   * 3		2
   * 4		2.5
   * 5		3.2
   * 6		4
   * 7		5
   * 8		6
   * 9		8
   * 10		10
   * 11		13
   * 12		16
   * 13		20
   * 14		25
   * 15		32
   * 16		40
   * 17		50
   */
#define POWER_DBM                   14
#define RSSI_THREHSOLD_DBM   -130 //порог приёма сигнала

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


#ifndef MEMCPY
#define MEMCPY(dst,src,len)             memcpy(dst,src,len)
#endif


#endif

