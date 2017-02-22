
#include "tcp_connector.h"

#define UART_DT_SIZE 10
#define SEND_TIMEOUT 1000
#define TCP_MAGIC_MARK 0xCAFEBABE

typedef uint16_t DATA_SIZE;
typedef uint8_t DATA;

typedef struct {
	uint32_t magicMark; //4byte
	uint32_t sign; //4byte
	uint32_t dataSize; //4byte
	DATA *data;
} TCP_PACKAGE;

#define TCP_HEADER_SIZE (sizeof (TCP_PACKAGE) - sizeof (uintptr_t))

typedef union {
	TCP_PACKAGE package;
	uint8_t bytes[TCP_HEADER_SIZE];
} TCP_PACKAGE_BYTES;

uint8_t transmitData[UART_DT_SIZE];
uint8_t receiveData[UART_DT_SIZE];
UART_HandleTypeDef *hUART;

void fillPackage(TCP_PACKAGE *pPackage, DATA *pData, DATA_SIZE dataSize) {
	pPackage->magicMark = TCP_MAGIC_MARK;
	pPackage->dataSize = dataSize;
	pPackage->sign = 0x11223344;
	pPackage->data = pData;
}

DATA_SIZE getPackageSize(TCP_PACKAGE *pPackage) {
	return pPackage->dataSize + TCP_HEADER_SIZE;
}

void hostToNet(uint8_t *bytes){

}

TCP_Status sendBytes(uint8_t *pData, uint16_t size) {
	HAL_StatusTypeDef tStatus = HAL_UART_Transmit(hUART, pData, size, SEND_TIMEOUT);
	if (tStatus == HAL_OK) {
		return TCP_OK;
	} else {
		return TCP_ERROR;
	}
}

TCP_Status sendPackage(TCP_PACKAGE *pPackage) {
	DATA_SIZE size = getPackageSize(pPackage);
	//выделяем буффер
	DATA buffer[size];
	DATA *buff=&buffer;
	//пакет в байты
	TCP_PACKAGE_BYTES pbt;
	pbt.package = *pPackage;
	uint8_t *bytes = pbt.bytes;

	//копируем заголовок пакета
	for (int i = 0; i < TCP_HEADER_SIZE; i++) {
		*buff++ = bytes[i];
	}
	//копируем данные из пакета
	DATA_SIZE dSize = size - TCP_HEADER_SIZE;
	DATA* data = pPackage->data;
	for (int i = 0; i < dSize; i++) {
		*buff++ = data[i];
	}

	return sendBytes(buffer, size);
}

void TCP_Init(UART_HandleTypeDef *UARTHandle) {
	hUART = UARTHandle;
}

TCP_Status TCP_Ping() {
	TCP_PACKAGE p;
	DATA pData[] = {'P', 'I', 'N', 'G'};
	fillPackage(&p, pData, sizeof (pData));
	return sendPackage(&p);
}

void TCP_Send(DATA *pData, DATA_SIZE dataSize) {




}

