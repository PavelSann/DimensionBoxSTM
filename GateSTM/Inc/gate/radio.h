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

  typedef enum {
    RADIO_INPROGRESS = 1,
    RADIO_OK = 0,
    RADIO_ERR_STATE = -1,
    RADIO_ERR_MEM = -2,
  } RADIO_Result;
#define RADIO_IS_RESULT_ERR(result) ((result)<0)

  typedef RADIO_Result(*RADIO_ReceiveCallbackFn)(void* pData, uint8_t dataLen);

  typedef struct {
    RADIO_ReceiveCallbackFn receiveCallbackFn;
  } RADIO_InitStruct;

  void RADIO_Init(RADIO_InitStruct *pInit);
  RADIO_Result RADIO_Transmit(void* pData, uint8_t dataLen);
  void RADIO_GPIOCallback();
  void RADIO_Process();



#ifdef __cplusplus
}
#endif

#endif /* RADIO_H */

