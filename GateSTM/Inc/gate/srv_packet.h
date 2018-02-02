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

#define SRV_MAX_PAYLOAD_SIZE 1000
//SRV_MAX_PACKET_SIZE не должен переполнять uint16_t
#define SRV_MAX_PACKET_SIZE (SRV_MAX_PAYLOAD_SIZE+sizeof(SRV_PacketHeader))

  /*Тип пакета 1 байт*/
  typedef enum {
    SRV_PACKET_TYPE_RESERVE = 0,
    SRV_PACKET_TYPE_HANDSHAKING = 1,
    SRV_PACKET_TYPE_STR = 2,

    SRV_PACKET_TYPE_PING = 0xFD,
    SRV_PACKET_TYPE_ASK = 0xFF,
    SRV_PACKET_TYPE_MAX = 0xFF
  } SRV_PacketType;
#define SRV_IS_SIMPLE_PACKET(packetType) ((packetType)>SRV_PACKET_TYPE_SIMPLE_)

  /*Основной заголовок пакета, выравнивание на 4 байта*/
  typedef struct __packed {
    /* Длина блока данных */
    uint16_t payloadLength;
    /** SRVPacketType типа пакета uint8_t*/
    SRV_PacketType type;
    /* последовательный номер пакета */
    uint8_t sequenceNumber;
    uint32_t crc;
  } SRV_PacketHeader;

#ifdef __cplusplus
}
#endif

#endif /* SRV_PACKET_H */

