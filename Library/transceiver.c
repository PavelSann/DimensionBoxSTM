#include <string.h>

#include "transceiver.h"
#include "xprint.h"
#include "assert.h"

#define LOG_PACKAGE 0
#define CONFIG_SP1ML 0

#define SEND_TIMEOUT 500
#define TRANS_PACKAGE_MAGIC 0xCAFE
#define TRANS_PACKAGE_SIGN 0xBABEDEFE
#define TRANS_PACKAGE_END 0xFF
#define ST1ML_PAYLOAD_SIZE 48
#define ST1ML_PAYLOAD_SIZE_STR "48"
static_assert(sizeof (TRANS_PACKAGE) < 96, "Max PAYLOAD_SIZE ST1ML 96");
static_assert(sizeof (TRANS_PACKAGE) == ST1ML_PAYLOAD_SIZE, "sizeof(TRANS_PACKAGE) != ST1ML_PAYLOAD_SIZE");

/*Струтура для преобразования TRANS_PACKAGE в байты и обратно	*/
typedef struct {

	/*Данные в разном представлении*/
	union {
		/*Данные в виде пакета TRANS_PACKAGE*/
		TRANS_PACKAGE *package;
		/*Данные в виде массива байт*/
		uint8_t *bytes;
	} data;
	/*Код ошибки, если не 0, значит данные кривые*/
	uint8_t error;
} TRANS_PACKAGE_BYTES;


static UART_HandleTypeDef *hUART;
static uint8_t packageReceive[TRANS_PACKAGE_SIZE];
static TRANS_ADDRESS localAddress;

static void sendBytes(uint8_t *bytes, int len) {
#if LOG_PACKAGE
	LOG("TRANS: sendBytes:");
	LOGMEM(bytes, TRANS_PACKAGE_SIZE);
#endif
	HAL_StatusTypeDef status = HAL_UART_Transmit(hUART, bytes, len, SEND_TIMEOUT);
	if (status != HAL_OK) {
		LOGERR("Not transmit bytes. status=0x%x", status);
	}
}

#if CONFIG_SP1ML
	#define CONFIG_ARR_SIZE 9
static char *(config[CONFIG_ARR_SIZE]) = {
	"+++",
	"ATR\r\n",
//	"ATS02=1000\r\n",
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
#endif

void TRANS_Init(UART_HandleTypeDef *UARTHandle, TRANS_ADDRESS address) {
	hUART = UARTHandle;
	localAddress = address;
#if CONFIG_SP1ML
	config_SP1ML();
#endif

	//	HAL_UART_Receive_IT(hUART, packageReceive, PACKAGE_SIZE);
	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if (status != HAL_OK) {
		LOGERR("Not start HAL_UART_Receive_IT status:%d", status);
	}

	LOG("Transceiver init UART:0x%x TRANS_PACKAGE_SIZE:%d", hUART->Instance, TRANS_PACKAGE_SIZE);
}

static TRANS_PACKAGE newPackage(TRANS_ADDRESS sourceAddress, TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	TRANS_PACKAGE package = {0};
	package.magicMark = TRANS_PACKAGE_MAGIC;
	package.sign = TRANS_PACKAGE_SIGN;
	package.sourceAddress = sourceAddress;
	package.targetAddress = targetAddress;
	package.type = type;
	package.end = 0xFF;
	return package;
}

TRANS_PACKAGE TRANS_newPackage(TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	return newPackage(localAddress, targetAddress, type);
}

uint8_t TRANS_toPackage(uint8_t *bytes, TRANS_PACKAGE **pPackage) {
	TRANS_PACKAGE_BYTES p2bytes;
	p2bytes.data.bytes = bytes;
	uint8_t error = 0;

	if (p2bytes.data.package->magicMark != TRANS_PACKAGE_MAGIC) {
		error = 1;
	} else if (p2bytes.data.package->sign != TRANS_PACKAGE_SIGN) {
		error = 2;
	} else if (p2bytes.data.package->end != TRANS_PACKAGE_END) {
		error = 3;
	}

	*pPackage = p2bytes.data.package;
	return error;
}

uint8_t *TRANS_toByte(TRANS_PACKAGE *pPackage) {
	TRANS_PACKAGE_BYTES bytes;
	bytes.data.package = pPackage;
	return bytes.data.bytes;
}

void TRANS_SendPackage(TRANS_PACKAGE *pPackage) {
	uint8_t *bytes = TRANS_toByte(pPackage);
	sendBytes(bytes, TRANS_PACKAGE_SIZE);
}

void TRANS_SendDataMeters(TRANS_ADDRESS targetAddress, TRANS_DATA_METERS *dataMeters) {
	TRANS_PACKAGE p = TRANS_newPackage(targetAddress, TRANS_TYPE_METERS);
	p.data.meters = *dataMeters;
	TRANS_SendPackage(&p);
}

__weak void TRANS_OnReceivePackage(TRANS_PACKAGE *pPackage) {
	UNUSED(pPackage);
}

void TRANS_UART_TxCpltCallback(UART_HandleTypeDef* huart) {
	if (huart->Instance != hUART->Instance) {
		return;
	}

	TRANS_PACKAGE *pPackage = NULL;
	uint8_t error = TRANS_toPackage(packageReceive, &pPackage);
	if (error) {
		LOGERR("TRANS: Receive data error %d", error);
		LOGMEM(packageReceive, TRANS_PACKAGE_SIZE);
	} else {
#if LOG_PACKAGE
		LOG("TRANS: ReceivePackage");
		LOGMEM(pPackage, TRANS_PACKAGE_SIZE);
#endif
		if (pPackage->targetAddress == localAddress) {
			TRANS_OnReceivePackage(pPackage);
		} else {
			LOG("Skip package. LocalAddress:0x%x TargetAddress:0x%x ", localAddress, pPackage->targetAddress);
		}
	}


	HAL_StatusTypeDef status = HAL_UART_Receive_IT(hUART, packageReceive, TRANS_PACKAGE_SIZE);
	if (status != HAL_OK) {
		LOGERR("Not start Receive_IT status:%d", status);
	}
}
