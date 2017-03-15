#include "package_queue.h"

#include "xprint.h"

PACKAGE_QUEUE QUEUE_newQueue(PACKAGE_QUEUE_NODE packetBuffer[], const uint32_t size) {
	PACKAGE_QUEUE queue = {size, packetBuffer, 0, 0};
	return queue;
}

uint8_t *QUEUE_useNode(PACKAGE_QUEUE *queue) {
	PACKAGE_QUEUE_NODE *node = &queue->packetQueue[queue->useIndex];
	if (node->status == PQ_NODE_FREE) {
		node->status = PQ_NODE_USE;
		return node->package;
	} else {
		LOGERR("Epic FAIL. Node status: %d", node->status);
		return NULL;
	}
}

void QUEUE_receiveNode(PACKAGE_QUEUE *queue) {
	queue->packetQueue[queue->useIndex].status = PQ_NODE_RECEIVE;

	queue->useIndex++;
	if (queue->useIndex == queue->size) {
		queue->useIndex = 0;
	}
}

void QUEUE_processNode(PACKAGE_QUEUE *queue, void (*callback)(PACKAGE_QUEUE_NODE *)) {
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

uint32_t QUEUE_getReceiveNodeCount(PACKAGE_QUEUE *queue) {

	if (queue->useIndex >= queue->processIndex) {
		return queue->useIndex - queue->processIndex;
	} else {
		return (queue->size - queue->processIndex)+queue->useIndex;
	}
}
