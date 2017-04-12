#include "transceiver.h"
#include <string.h>
#include <assert.h>
#include "xprint.h"
#include "package_queue.h"
#include "atomic.h"

#define __STR(val) #val
#define DEF_TO_STR(X) __STR(X)

#define LOG_PACKAGE 0
#define LOG_QUEUE 0
#define LOG_DMA_BUFFER 0
#define CONFIG_SP1ML 0

#define SP1ML_PAYLOAD_SIZE 48
#define SP1ML_PAYLOAD_SIZE_STR DEF_TO_STR(SP1ML_PAYLOAD_SIZE)
static_assert(sizeof (TRANS_PACKAGE) == SP1ML_PAYLOAD_SIZE, "sizeof(TRANS_PACKAGE) != SP1ML_PAYLOAD_SIZE");
static_assert(sizeof (TRANS_PACKAGE) < 96, "Max PAYLOAD_SIZE SP1ML 96");

#define SEND_TIMEOUT 10000
#define SEND_PAUSE   200
#define PACKAGE_QUEUE_SIZE 100
#define DMA_BUFFER_COUNT_PACKAGE 64
#define DMA_BUFFER_SIZE (DMA_BUFFER_COUNT_PACKAGE*TRANS_PACKAGE_SIZE)

static PACKAGE_QUEUE_NODE queueBuffer[PACKAGE_QUEUE_SIZE];
static PACKAGE_QUEUE queue;
static TRANSConfig conf;
static DMA_HandleTypeDef *hDMArx;
static __IO bool error = false;
static TRANSStatus status = {
	.lastError = TRANS_ERR_NONE,
	.lastTransmitStatus = HAL_OK,
//	.overflowQueueCount = 0,
	.countBadPackage = 0,
	.countGoodPackage = 0
};
static uint8_t *useDmaNodePackage;


static uint8_t dmaBuffer[DMA_BUFFER_SIZE];
static uint8_t *dmaBufferEnd = dmaBuffer + DMA_BUFFER_SIZE;

static enum {
	/*Запись в первую часть буфера*/
	DMA_BUFFER_FIRST_PART,
	/*Запись во вторую часть буфера*/
	DMA_BUFFER_SECOND_PART,
} dmaWritePart = DMA_BUFFER_FIRST_PART;

TRANS_PACKAGE TRANS_NewLocalPackage(TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	return TRANS_NewPackage(conf.localAddress, targetAddress, type);
}

static void sendBytes(uint8_t *bytes, int len) {
	static volatile uint32_t lastSendTime = 0;
#if LOG_PACKAGE
	LOG("TRANS: sendBytes:");
	LOGMEM(bytes, TRANS_PACKAGE_SIZE);
#endif
	while ((HAL_GetTick() - lastSendTime) < SEND_PAUSE) {
		//пауза между отправками, не менее SEND_PAUSE
	}
	status.lastTransmitStatus = HAL_UART_Transmit(conf.hUART, bytes, len, SEND_TIMEOUT);
	lastSendTime = HAL_GetTick();
	if (status.lastTransmitStatus != HAL_OK) {
		status.lastError = TRANS_ERR_UART_TRANSMIT;
		error = true;
		LOGERR("Not transmit bytes. status=0x%x", status.lastTransmitStatus);
	}
}

#if CONFIG_SP1ML

static void sendCommand(char *str) {
	size_t ln = strlen(str);
	uint8_t *cmd = (uint8_t*) str;
	HAL_UART_Transmit(conf.hUART, cmd, ln, SEND_TIMEOUT);
	HAL_Delay(500);
}
	#define CONFIG_ARR_SIZE 9
static char *(config[CONFIG_ARR_SIZE]) = {
	"+++", //Command mode
	"ATR\r\n", //Reset configuration to the default values
	//"ATS00=500000\r\n", //General:Baud rate of the UART interface in bps. The baud rate is stored when the configuration is stored.
	//"ATS02=500000\r\n", //Radio:Data rate in bps. The data rate for OOK and ASK modulation schemes is limited to 250000bps.
	//"ATS13=0\r\n", //Packet:Data whitening mode.
	//"ATS14=1\r\n", //Packet:Forward error correction.
	"ATS19=1\r\n", //Address:Filter packets that have an invalid CRC.
	"ATS28=" SP1ML_PAYLOAD_SIZE_STR "\r\n", //Packet: Packet payload size in bytes.
	"AT/C\r\n",
	"AT/S\r\n",
	"ATO\r\n"
};

static void stopReceiveIT(UART_HandleTypeDef *huart) {
	huart->TxXferSize = 0;
	huart->TxXferCount = 0;
	huart->State = HAL_UART_STATE_READY;
}

static void config_SP1ML() {
	LOG("Config SP1ML:");
	HAL_Delay(500);
	uint8_t buff[1024] = {0};
	HAL_UART_Receive_IT(conf.hUART, buff, 1024);
	for (int i = 0; i < CONFIG_ARR_SIZE; i++) {
		sendCommand(config[i]);
		LOG(" %s ...", config[i]);
	}
	HAL_Delay(1000);
	LOG("Response: %s", buff);
	//останавливаем HAL_UART_Receive_IT
	stopReceiveIT(conf.hUART);
}
#endif

static inline uint32_t getDmaAddressData() {
	return hDMArx->Instance->CMAR;
}

static inline uint32_t getDmaFreeBufferBytes() {
	return hDMArx->Instance->CNDTR;
}

static inline uint8_t getDmaBufferByte(size_t base, size_t offset) {
	size_t sizeToEnd = (DMA_BUFFER_SIZE - base);
	if (sizeToEnd > offset) {
		return dmaBuffer[base + offset];
	}
	offset = offset % DMA_BUFFER_SIZE; //на случай, если offset больше DMA_BUFFER_SIZE
	return dmaBuffer[offset - sizeToEnd];

}

static void processDmaBuffer() {

	static volatile struct {
		/**Защита при одновременном использовании processDmaBuffer из прерывания и основного потока*/
		uint8_t lock;
		/**Номер последнего обработанного байта*/
		uint32_t lastDmaPos;
		/**Номер последнего записанного к пакет байта*/
		size_t packByteNumber;
		/**Первый байт пакета */
		uint8_t byteFirst;

		/**текущее состояние*/
		enum {
			PP_FIND,
			PP_COPY,
			PP_CHECK
		} state;
	} proc = {
		.lock = 0,
		.lastDmaPos = 0,
		.packByteNumber = 0,
		.byteFirst = 0,
		.state = PP_FIND
	};
	/**
	 *Далее защита от одновременного параллельного выполнения метода
	 */
	bool setLock = false; //текущее значение блокировки
	while (__LDREXB(&(proc.lock)) == 0) {
		//пробует захватить блокировку, пока флаг 0
		if (__STREXB(1, &(proc.lock)) == 0) {
			//Захватили флаг
			setLock = true;
			break;
		}
	}
	if (setLock == false) {
		//не смогли захватить блокировку, сбрасываем флаг и уходим
		__CLREX();
		return;
	}

	const uint32_t dmaNumber = DMA_BUFFER_SIZE - getDmaFreeBufferBytes();
	register uint8_t *begin = dmaBuffer + proc.lastDmaPos;
	const uint8_t *end = dmaBuffer + dmaNumber;
	proc.lastDmaPos = dmaNumber;

#if LOG_DMA_BUFFER
	bool logDmaBuffer = false;
	if (begin != end) {
		logDmaBuffer = true;
		LOG("Begin processDmaBuffer: dmaBuffer:0x%x begin:0x%x end:0x%x dmaNumber:%d good:%d bad:%d",
				dmaBuffer, begin, end, dmaNumber, status.countGoodPackage, status.countBadPackage);
		//	LOGMEM(dmaBuffer, DMA_BUFFER_SIZE);
	}
#endif


	for (; begin != end; proc.byteFirst = *begin++) {
		//Закольцовываем буфер
		if (begin == dmaBufferEnd) {
			begin = dmaBuffer;
			if (begin == end) {
				break;
			}
		}

		if (proc.state == PP_COPY) {
			useDmaNodePackage[++(proc.packByteNumber)] = *begin;
			if (proc.packByteNumber == (TRANS_PACKAGE_SIZE - 1)) {
				proc.state = PP_CHECK;
			} else {
				continue;
			}
		}
		if (proc.state == PP_CHECK) {
			TRANS_PACKAGE *pPackage;
			uint8_t err = TRANS_ByteToPackage(useDmaNodePackage, &pPackage);
			if (!err) {
				QUEUE_ReceiveNode(&queue);
				useDmaNodePackage = QUEUE_UseNode(&queue);
				status.countGoodPackage++;
			} else {
				status.countBadPackage++;
				//нужно вернутся на (TRANS_PACKAGE_SIZE-2), вдруг нам попался мусор начинающийся с  TRANS_PACKAGE_MAGIC
				//TRANS_PACKAGE_MAGIC_SIZE нужен чтобы не зациклится
				const size_t backStep = (TRANS_PACKAGE_SIZE - 1) - TRANS_PACKAGE_MARK_SIZE;
				const size_t pos = begin - dmaBuffer;
				if (backStep > pos) {
					begin = dmaBufferEnd - (backStep - pos);
				} else {
					begin = begin - backStep;
				}
			}
			proc.packByteNumber = 0;
			proc.byteFirst = 0;
			proc.state = PP_FIND;
			continue;
		}

		if (proc.state == PP_FIND && TRANS_IsMarkBeginPackage(proc.byteFirst, *begin)) {
			useDmaNodePackage[0] = proc.byteFirst;
			useDmaNodePackage[1] = *begin;
			proc.packByteNumber = 1;
			proc.state = PP_COPY;
			continue;
		}

	}
#if LOG_DMA_BUFFER
	if (logDmaBuffer) {
		LOG("End processDmaBuffer: good:%d bad:%d",
				status.countGoodPackage, status.countBadPackage);
	}
#endif

	//разблокируем доступ к методу
	proc.lock = 0;
}

static void tryError() {
	if (error) {
		error = false;
		TRANS_OnError(status);
	}
}

void TRANS_Init(TRANSConfig configuration) {
	conf = configuration;
	assert_param(conf.hUART != NULL);
	assert_param(conf.localAddress > 0);
#if CONFIG_SP1ML
	config_SP1ML();
#endif
	hDMArx = conf.hUART->hdmarx;
	if (hDMArx == NULL
			|| HAL_IS_BIT_CLR(hDMArx->Instance->CCR, DMA_CCR_CIRC)) {
		//не включен циклический dma буфер
		status.lastError = TRANS_ERR_UART_DMA;
		error = true;
		LOGERR("hDMArx=0x%x CIRC= ", hDMArx, HAL_IS_BIT_SET(hDMArx->Instance->CCR, DMA_CCR_CIRC));
	} else if (HAL_UART_Receive_DMA(conf.hUART, dmaBuffer, DMA_BUFFER_SIZE) != HAL_OK) {
		status.lastError = TRANS_ERR_UART_RECEIVE;
		error = true;
	}

	//создаём очередь
	queue = QUEUE_NewQueue(queueBuffer, PACKAGE_QUEUE_SIZE);
	useDmaNodePackage = QUEUE_UseNode(&queue);
	tryError();
	LOG("Transceiver init UART:0x%x TRANS_PACKAGE_SIZE:%d", conf.hUART->Instance, TRANS_PACKAGE_SIZE);
}

void TRANS_SendPackage(TRANS_PACKAGE *pPackage) {
	uint8_t *bytes = TRANS_PackageToByte(pPackage);
#if 1
	sendBytes(bytes, TRANS_PACKAGE_SIZE);
#else
	static uint8_t byteBuffer[TRANS_PACKAGE_SIZE];
	//ждём пока освободится линия передачи данных
	HAL_UART_StateTypeDef uartStat = HAL_UART_GetState(conf.hUART);
	while (uartStat == HAL_UART_STATE_BUSY_TX || uartStat == HAL_UART_STATE_BUSY_TX_RX) {
		//	while ((uartStat != HAL_UART_STATE_READY) && (uartStat != HAL_UART_STATE_BUSY_RX)) {
		uartStat = HAL_UART_GetState(conf.hUART);
	}

	if (uartStat == HAL_UART_STATE_ERROR || uartStat == HAL_UART_STATE_RESET) {
		status.lastError = TRANS_ERR_UART_TRANSMIT;
		error = true;
		return;
	}
	//копируем пакет во временный буфер
	for (size_t i = 0; i < TRANS_PACKAGE_SIZE; i++) {
		byteBuffer[i] = bytes[i];
	}
	//запускаем отправку
	status.lastTransmitStatus = HAL_UART_Transmit_IT(conf.hUART, byteBuffer, TRANS_PACKAGE_SIZE);
	//	status.lastTransmitStatus = HAL_UART_Transmit_DMA(conf.hUART, byteBuffer, TRANS_PACKAGE_SIZE);
	if (status.lastTransmitStatus != HAL_OK) {
		status.lastError = TRANS_ERR_UART_TRANSMIT;
		error = true;
	}
#endif
}

void TRANS_SendDataMeters(TRANS_ADDRESS targetAddress, TRANS_DATA_METERS *dataMeters) {
	TRANS_PACKAGE p = TRANS_NewLocalPackage(targetAddress, TRANS_TYPE_METERS);
	p.data.meters = *dataMeters;
	TRANS_SendPackage(&p);
}

__weak void TRANS_OnProcessPackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

__weak void TRANS_OnError(TRANSStatus status) {
	UNUSED(status);
}

void TRANS_UART_RxHalfCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != conf.hUART->Instance) {
		return;
	}
	dmaWritePart = DMA_BUFFER_SECOND_PART;
	processDmaBuffer();
}

void TRANS_UART_RxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != conf.hUART->Instance) {
		return;
	}
	dmaWritePart = DMA_BUFFER_FIRST_PART;
	processDmaBuffer();
}

static void processPackageNode(PACKAGE_QUEUE_NODE *node) {

	TRANS_PACKAGE *pPackage = NULL;
	uint8_t errCode = TRANS_ByteToPackage(node->package, &pPackage);
	if (errCode) {
		LOGERR("Receive data error %d. NodeStatus:%d QUEUE:%d:%d:%d", errCode, node->status, queue.size, queue.useIndex, queue.processIndex);
		LOGMEM(node->package, TRANS_PACKAGE_SIZE);
		//		LOG("* * * * * ");
		//		LOGMEM(queue.packetQueue, PACKAGE_QUEUE_SIZE*sizeof(PACKAGE_QUEUE_NODE));
		/*
		 Если получены кривые данные, можно поискать в пакете начало пакета, если он сдвинут, то записать в доп. буфер
		 при получении следуюущих кривых данных, начало можно будет взять из доп буфера
		 */
		status.lastError = TRANS_ERR_BAD_PACKAGE;
		error = true;
	} else {
#if LOG_PACKAGE 
		LOG("TRANS: process PackageNode:");
		LOGMEM(pPackage, TRANS_PACKAGE_SIZE);
#endif
		TRANS_OnProcessPackage(pPackage);
	}

}

void TRANS_ProcessPackage() {
	tryError();
	QUEUE_ProcessNode(&queue, processPackageNode);
	uint32_t count = QUEUE_GetReceiveNodeCount(&queue);
	if (count == 0) {
		processDmaBuffer();
	}

#if LOG_QUEUE
	if (count > 0) {
		LOG("TRANS: ProcessPackage: node count %d QUEUE:%d:%d:%d DmaGood:%d DmaBad:%d",
				count, queue.size, queue.useIndex, queue.processIndex, status.countGoodPackage, status.countBadPackage);
	}
#endif


}

TRANSStatus TRANS_GetStatus() {
	return status;
}
