#include "package_queue.h"

#include "xprint.h"

PACKAGE_QUEUE QUEUE_NewQueue(PACKAGE_QUEUE_NODE packetBuffer[], const uint32_t size) {
	PACKAGE_QUEUE queue = {
		.size = size,
		.packetQueue = packetBuffer,
		.processIndex = 0,
		.useIndex = 0
	};
	return queue;
}

uint8_t *QUEUE_UseNode(PACKAGE_QUEUE *queue) {
	PACKAGE_QUEUE_NODE *node = &queue->packetQueue[queue->useIndex];
	if (node->status == PQ_NODE_FREE) {
		node->status = PQ_NODE_USE;
		return node->package;
	} else {
		return NULL;
	}
}

bool QUEUE_ReceiveNode(PACKAGE_QUEUE *queue) {
	PACKAGE_QUEUE_NODE *node = &queue->packetQueue[queue->useIndex];
	//если текущая нода не используется вернём false
	if (node->status != PQ_NODE_USE) {
		return false;
	}

	node->status = PQ_NODE_RECEIVE;
	queue->useIndex++;
	if (queue->useIndex == queue->size) {
		queue->useIndex = 0;
	}
	return true;
}

void QUEUE_ProcessNode(PACKAGE_QUEUE *queue, void (*callback)(PACKAGE_QUEUE_NODE *)) {
	if (queue->processIndex == queue->size) {
		queue->processIndex = 0;
	}

	//	if (queue->processIndex == queue->useIndex) {
	//		//больше нет элементов в очереди
	//	} else {
	PACKAGE_QUEUE_NODE *node = &queue->packetQueue[queue->processIndex];
	if (node->status == PQ_NODE_RECEIVE) {
		//		LOG("QUEUE: size:%d useIndex:%d processIndex:%d count:%d", queue->size, queue->useIndex, queue->processIndex, QUEUE_getReceiveNodeCount(queue));
		callback(node);
		node->status = PQ_NODE_FREE;
		queue->processIndex++;
	} else {
		//текущая нода свободна или используется
	}
	//	}
}

uint32_t QUEUE_GetReceiveNodeCount(PACKAGE_QUEUE *queue) {

	if (queue->useIndex >= queue->processIndex) {
		return queue->useIndex - queue->processIndex;
	} else {
		return (queue->size - queue->processIndex)+queue->useIndex;
	}
}

//inline uint8_t *QUEUE_GetPackage(PACKAGE_QUEUE_NODE *node){
//	return (uint8_t *)node->package;
//}