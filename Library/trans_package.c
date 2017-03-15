#include "trans_package.h"

#define TRANS_PACKAGE_MAGIC 0xCAFE
#define TRANS_PACKAGE_SIGN 0xBABEDEFE
#define TRANS_PACKAGE_END 0xFF

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

TRANS_PACKAGE TRANS_newPackage(TRANS_ADDRESS sourceAddress, TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	TRANS_PACKAGE package = {0};
	package.magicMark = TRANS_PACKAGE_MAGIC;
	package.sign = TRANS_PACKAGE_SIGN;
	package.sourceAddress = sourceAddress;
	package.targetAddress = targetAddress;
	package.type = type;
	package.end = 0xFF;
	return package;
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