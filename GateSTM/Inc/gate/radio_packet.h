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
  /* Получение адреса радио модуля из ID устройства*/
#define RADIO_ADDRESS(devID) ((devID)&0xFF)

  typedef enum RADIO_PacketType {
    RADIO_PACKET_TYPE_PING = 0,
    RADIO_PACKET_TYPE_DATA_REQUEST = 1,


  } RADIO_PacketType;

  /*Основной заголовок для всех пакетов, выравнивание на 4 байта*/
  typedef struct __packed RADIO_PacketHeader {
    /*Устройство которому предназначен пакет*/
    DeviceID dest;
    /*Устройство отправившее пакет*/
    DeviceID src;
    /*Тип пакета*/
    RADIO_PacketType type;
    /*резерв, выравнивание*/
    uint8_t  reserve[3];

  } RADIO_PacketHeader;

#define RADIO_PACKET_HEADER_SIZE (sizeof(RADIO_PacketHeader))
#define RADIO_PACKET_PAYLOAD(pHead) (((uint8_t *)(pHead))+RADIO_PACKET_HEADER_SIZE)



#ifdef __cplusplus
}
#endif

#endif /* RADIO_PACKET_H */

