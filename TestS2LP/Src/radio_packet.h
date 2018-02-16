/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   radio_packet.h
 * Author: PavelSann(ExIngus@gmail.com)
 *
 * Created on 16 февраля 2018 г., 11:10
 */

#ifndef RADIO_PACKET_H
#define RADIO_PACKET_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <limits.h>
#include <stdbool.h>

  /* Уникальный идентификатор устройства*/
  typedef uint32_t DeviceID;

#define RADIO_ADDRESS(devID) ((devID)&0xFF)

  /*Основной заголовок для всех пакетов, выравнивание на 4 байта*/
  typedef struct __packed RADIO_PacketHeader {
    /*Устройство которому предназначен пакет*/
    DeviceID src;
    /*Устройство отправившее пакет*/
    DeviceID dest;

  } RADIO_PacketHeader;



#ifdef __cplusplus
}
#endif

#endif /* RADIO_PACKET_H */

