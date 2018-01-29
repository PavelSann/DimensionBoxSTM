/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   srv_packet.h
 * Author: PavelSann(ExIngus@gmail.com)
 *
 * Created on 19 января 2018 г., 19:12
 */

#ifndef SRV_PACKET_H
#define SRV_PACKET_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <limits.h>
#include <stdbool.h>
#include <assert.h>


  /* Уникальный идентификатор устройства*/
  typedef uint32_t DeviceID;

#define SRV_PACKET_MAX_PAYLOAD_SIZE 1000

  /*Тип пакета 1 байт*/
  typedef enum {
    SRV_PACKET_TYPE_RESERVE = 0,
    SRV_PACKET_TYPE_HANDSHAKING = 1,
    SRV_PACKET_TYPE_TEST = 2,

    SRV_PACKET_TYPE_ASK = 0xFF,
    SRV_PACKET_TYPE_MAX = 0xFF
  } SRVPacketType;
  //Проверим что SRVPacketType занимает 1 байт
  //static_assert((sizeof (SRVPacketType)) == 1, "Size SRVPacketType NOT 1 byte");

  /*Основной заголовок пакета, выравнивание на 4 байта*/
  typedef struct __packed {
    /** SRVPacketType типа пакета */
    SRVPacketType type; //uint8_t
    /* Для выравнивание структуры, зарезервировано */
    uint8_t reserv;
    /* Длина блока данных */
    uint16_t payloadLength;

    //uint32_t crc;
  } SRVPacketHeader;

#define SRV_HEADER_PLEN(type) (sizeof(type)-sizeof(SRVPacketHeader))

  typedef struct __packed {
    SRVPacketHeader head;
    /* Уникальный идентификатор устройства*/
    DeviceID id;
  } SRVHandshaking;
#define INIT_SRVHandshaking(pHand,DeviceID) {\
(pHand)->head.type=SRV_PACKET_TYPE_HANDSHAKING;\
(pHand)->head.payloadLength=SRV_HEADER_PLEN(SRVHandshaking);\
(pHand)->id=DeviceID;\
}

  typedef struct __packed {
    SRVPacketHeader head;

  } SRVRequestHeader;



#ifdef __cplusplus
}
#endif

#endif /* SRV_PACKET_H */

