#include <string.h>

#include "transceiver.h"
#include "xprint.h"
#include "assert.h"

#define SEND_TIMEOUT 500
#define TRANS_PACKAGE_MAGIC 0xCAFE
#define TRANS_PACKAGE_SIGN 0xBABEDEFE
#define ST1ML_PAYLOAD_SIZE 48
#define ST1ML_PAYLOAD_SIZE_STR "48"
static_assert(sizeof (TRANS_PACKAGE) < 96, "Max PAYLOAD_SIZE ST1ML 96");
static_assert(sizeof (TRANS_PACKAGE) == ST1ML_PAYLOAD_SIZE, "sizeof(TRANS_PACKAGE) != ST1ML_PAYLOAD_SIZE");


static UART_HandleTypeDef *hUART;
static uint8_t packageReceive[TRANS_PACKAGE_SIZE];

static TRANS_PACKAGE newPackage(SOURCE_ADDRESS sourceAddress, TARGET_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	TRANS_PACKAGE package = {0};
	package.magicMark = TRANS_PACKAGE_MAGIC;
	package.sign = TRANS_PACKAGE_SIGN;
	package.sourceAddress = sourceAddress;
	package.targetAddress = targetAddress;
	package.type = type;
	package.end = 0xFF;
	return package;
}

static void sendBytes(uint8_t *bytes, int len) {
	HAL_StatusTypeDef status = HAL_UART_Transmit(hUART, bytes, len, SEND_TIMEOUT);
	if (status != HAL_OK) {
		LOGERR("Not transmit bytes. status=0x%x", status);
	}
}

static void sendPackage(TRANS_PACKAGE *pPackage) {
	TRANS_PACKAGE_BYTES bytes;
	bytes.data.package = pPackage;
	//	uint8_t *bytes = (uint8_t *) pPackage;
	//	offsetof
	LOGMEM(bytes.data.bytes, TRANS_PACKAGE_SIZE);
	sendBytes(bytes.data.bytes, TRANS_PACKAGE_SIZE);
}

static TRANS_PACKAGE_BYTES readPackage(uint8_t *bytes) {
	TRANS_PACKAGE_BYTES p2bytes;
	p2bytes.data.bytes = bytes;
	LOGMEM(p2bytes.data.bytes, TRANS_PACKAGE_SIZE);

	if (p2bytes.data.package->magicMark == TRANS_PACKAGE_MAGIC
			&& p2bytes.data.package->sign == TRANS_PACKAGE_SIGN) {
		p2bytes.error = 0;
	} else {
		p2bytes.error = 1;
	}
	return p2bytes;
}


#define CONFIG_ARR_SIZE 9
static char *(config[CONFIG_ARR_SIZE]) = {
	"+++",
	"ATR\r\n",
	"ATS02=1000\r\n",
	"ATS14=1\r\n",
	"ATS19=1\r\n",
	"ATS28=" ST1ML_PAYLOAD_SIZE_STR "\r\n", //PAYLOAD_SIZE
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
	HAL_UART_Receive_IT(hUART, buff, 1024);
	for (int i = 0; i < CONFIG_ARR_SIZE; i++) {
		uint8_t *conf = (uint8_t*) config[i];
		size_t ln = strlen(config[i]);
		LOG(" %s ...", conf);
		HAL_UART_Transmit(hUART, conf, ln, SEND_TIMEOUT);
		HAL_Delay(500);
	}
	HAL_Delay(1000);
	LOG("Response: %s", buff);
	//останавливаем HAL_UART_Receive_IT
	stopReceiveIT(hUART);
}

void TRANS_Init(UART_HandleTypeDef *UARTHandle) {
	hUART = UARTHandle;

	config_SP1ML();

	//	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if (status != HAL_OK) {
		LOGERR("Not start HAL_UART_Receive_IT status:%d", status);
	}

	LOG("Transceiver init UART:0x%x TRANS_PACKAGE_SIZE:%d", hUART->Instance, TRANS_PACKAGE_SIZE);
}

void TRANS_MeterSend(TRANS_DATA_METERS *dataMeters) {
	TRANS_PACKAGE p = newPackage(1, 2, TRANS_TYPE_METERS);
	p.data.meters = *dataMeters;
	sendPackage(&p);
}

__weak void TRANS_OnReceivePackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

void TRANS_UART_TxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != hUART->Instance) {
		return;
	}
	LOG("Receive data size:%d", huart->RxXferSize);
	TRANS_PACKAGE_BYTES pBytes = readPackage(packageReceive);
	if (pBytes.error) {
		LOG("Receive data error");
	} else {
		TRANS_PACKAGE *pPackage = pBytes.data.package;
		TRANS_OnReceivePackage(pPackage);
	}


	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if(status!=HAL_OK){
		LOGERR("Not start Receive_IT status:%d",status);
	}
}