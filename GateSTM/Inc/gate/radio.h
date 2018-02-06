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

void RADIO_Init(SPI_HandleTypeDef *pHSPI, GPIO_TypeDef* csnPort, uint16_t csnPin,GPIO_TypeDef* sdnPort, uint16_t sdnPin);
void RADIO_GPIOCallback();
void RADIO_Test();
void RADIO_Transmit();
void RADIO_Receive();


#ifdef __cplusplus
}
#endif

#endif /* RADIO_H */

