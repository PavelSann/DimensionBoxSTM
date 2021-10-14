// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include "tcps_packet_queue.h"
#include "mem.h"


/**Указатель на первый элемент  очереди*/
static PQueueNode *pQueue;
/*Длинна заголовка PackNode*/
#define NODE_SIZE sizeof(PQueueNode)
/*Указатель на SRV_PacketHeader который идёт после SendPackHeader*/
#define NODE_PACKET(pNode) ((void *) (((uint8_t *)(pNode))+NODE_SIZE) )

static uint32_t memAlloc = 0;
static uint32_t maxMemAlloc = 0;

PQueueNode *PQueue_Alloc(uint16_t size) {
  if (maxMemAlloc > 0 && (memAlloc + size) > maxMemAlloc) {
    return NULL;
  }

  //выделяем память под пакет, для списка отправляемых пакетов
  PQueueNode *pPackNode = mem_malloc(NODE_SIZE + size);
  if (pPackNode) {
    //пакет будет расположен сразу после PackNode, в том же блоке памяти
    //указатель на часть буфера, в которой хранится сам пакет
    pPackNode->packet = NODE_PACKET(pPackNode);
    pPackNode->packetSize = size;
    pPackNode->sent = false;
    pPackNode->next = NULL;
    memAlloc += size;
    return pPackNode;
  }
  return NULL;
}

static inline PQueueNode *getLastNode() {
  if (pQueue) {
    PQueueNode *pNode = pQueue;
    while (pNode->next) {
      pNode = pNode->next;
    }
    return pNode;
  } else {
    return NULL;
  }
}

void PQueue_Add(PQueueNode *pNode) {
  //добавляем к конец очереди
  if (pNode) {
    if (pQueue) {
      PQueueNode *pLastNode = getLastNode();
      pLastNode->next = pNode;
    } else {
      pQueue = pNode;
    }
  }
}

PQueueNode *PQueue_GetFirst() {
  //берём первый пакет из очереди
  return pQueue;
}

uint16_t PQueue_Count() {
  if (pQueue) {
    //считаем кол-во пакетов
    PQueueNode *pNode = pQueue;
    uint16_t count = 1;
    while (pNode->next) {
      pNode = pNode->next;
      count++;
    }

    return count;
  } else {
    return 0;
  }
}

void PQueue_RemoveFirst() {
  if (pQueue) {
    //удаляем пакет из очереди
    PQueueNode *pNode = pQueue;
    pQueue = pNode->next;
    //освобождаем память
    memAlloc -= pNode->packetSize;
    mem_free(pNode);
  }
}

uint32_t PQueue_AllocSize() {
  return memAlloc;
}

void PQueue_SetMaxAllocSize(uint32_t size) {
  maxMemAlloc = size;
}


