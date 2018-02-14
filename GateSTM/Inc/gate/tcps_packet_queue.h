/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   tcps_packet_list.h
 * Author: PavelSann(ExIngus@gmail.com)
 *
 * Created on 13 февраля 2018 г., 16:42
 */

#ifndef TCPS_PACKET_LIST_H
#define TCPS_PACKET_LIST_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdbool.h>
#include <stdint.h>

  /**
   *Элементы очереди
   */
  typedef struct PQueueNode {
    /*Указатель на следующий элемент очереди*/
    struct PQueueNode *next;
    /*Указатель на пакет*/
    void *packet;
    /*Размер пакета*/
    uint16_t packetSize;
    /*пакет отправлен*/
    bool sent;
    //uint8_t _reserv;
  } PQueueNode;

  /**
   * Выделяет память под элемент очереди
   * @param size
   * @return указатель на элемент или NULL если нет свободной памяти
   */
  PQueueNode *PQueue_Alloc(uint16_t size);
  /**
   * Добавляет элемент в очередь
   * @return
   */
  void PQueue_Add(PQueueNode *pNode);
  /**
   * Возвращает указатель на 1-й элемент в очереди
   * не удаляет элемент из очереди
   * @return указатель на элемент или NULL если очередь пуста
   */
  PQueueNode *PQueue_GetFirst();
  /**
   * Возвращает количество элементов в очереди
   * @return
   */
  uint16_t PQueue_Count();
  /**
   * Удаляет первый элемент из очереди и освобождает память
   * После вызова нельзя использовать указатель полученный ранее через PQueue_GetFirst
   */
  void PQueue_RemoveFirst();
  /**
   * Возвращает размер памяти, занимаемые очередью
   * @return 
   */
  uint32_t PQueue_AllocSize();
  /**
   * Задаёт максимальный размер, который может занять очередь
   * @param size
   */
  void PQueue_SetMaxAllocSize(uint32_t size);



#ifdef __cplusplus
}
#endif

#endif /* TCPS_PACKET_LIST_H */

