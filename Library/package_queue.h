/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   package_queue.h
 * Author: ExIngus (ExIngus@gmail.com)
 *
 * Created on 15 марта 2017 г., 11:10
 */

#ifndef PACKAGE_QUEUE_H
#define PACKAGE_QUEUE_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "trans_package.h"

	typedef struct {
		uint8_t package[TRANS_PACKAGE_SIZE];

		enum {
			/**Нода свободна*/
			PQ_NODE_FREE = 0,
			/**Нода в данный момент используется*/
			PQ_NODE_USE = 1,
			/**Нода содержит принятый пакет*/
			PQ_NODE_RECEIVE = 2,
		} status;
	} PACKAGE_QUEUE_NODE;

	typedef struct {
		uint32_t size;
		PACKAGE_QUEUE_NODE *packetQueue;
		uint32_t useIndex;
		uint32_t processIndex;
	} PACKAGE_QUEUE;


	/**
	 * Создаёт новую кольцевую очередь
	 * @param packetBuffer
	 * @param size
	 * @return
	 */
	PACKAGE_QUEUE QUEUE_NewQueue(PACKAGE_QUEUE_NODE packetBuffer[], const uint32_t size);
	/**
	 * Возвращает ноду для использования, если таких нет вернёт NULL
	 * @param queue
	 * @return 
	 */
	uint8_t *QUEUE_UseNode(PACKAGE_QUEUE *queue);
	/**
	 * Помечает текущую используемую ноду, как содержащую принятые данные
	 * @param queue
	 */
	void QUEUE_ReceiveNode(PACKAGE_QUEUE *queue);
	/**
	 * Обрабатывает 1 ноду с принятыми данными, если такая есть
	 * вызывает callback, потом отмечает ноду как свободную
	 * @param queue
	 * @param callback
	 */
	void QUEUE_ProcessNode(PACKAGE_QUEUE *queue, void (*callback)(PACKAGE_QUEUE_NODE *));
	/**
	 * Возвращает количество пакетов в очереди
	 * @param queue
	 * @return
	 */
	uint32_t QUEUE_GetReceiveNodeCount(PACKAGE_QUEUE *queue);



#ifdef __cplusplus
}
#endif

#endif /* PACKAGE_QUEUE_H */

