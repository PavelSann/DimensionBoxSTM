/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   radio.h
 * Author: PavelSann(ExIngus@gmail.com)
 *
 * Created on 6 февраля 2018 г., 10:44
 */

#ifndef RADIO_H
#define RADIO_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include <stdbool.h>
#include "radio_packet.h"

  typedef enum {
    RADIO_INPROGRESS = 1,
    RADIO_OK = 0,
    RADIO_ERR_STATE = -1,
    RADIO_ERR_MEM = -2,
  } RADIO_Result;
#define RADIO_IS_RESULT_ERR(result) ((result)<0)

  typedef void(*RADIO_ReceiveCallbackFn)(RADIO_PacketHeader *header, void* pData, uint8_t dataLen);

  typedef struct {
    DeviceID devID;
    RADIO_ReceiveCallbackFn receiveCallbackFn;
  } RADIO_InitStruct;

  void RADIO_Init(RADIO_InitStruct *pInit);
  RADIO_Result RADIO_Transmit(DeviceID destID, void* pData, uint8_t dataLen);
  RADIO_Result RADIO_TransmitPacket(RADIO_PacketHeader *pRHead, uint8_t packetLen);
  void RADIO_IRQCallback();
  bool RADIO_IsTransmit();
  bool RADIO_IsReceive();
  void RADIO_Process();



#ifdef __cplusplus
}
#endif

#endif /* RADIO_H */

