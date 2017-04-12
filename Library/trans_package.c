#include "trans_package.h"
#include <assert.h>

#define TRANS_PACKAGE_MAGIC 0xCAFE
#define TRANS_PACKAGE_MAGIC_FIRST_BYTE 0xFE
#define TRANS_PACKAGE_MAGIC_SECOND_BYTE 0xCA
#define TRANS_PACKAGE_END_BYTE 0xFF
#define TRANS_PACKAGE_SIGN 0xBABEDEFE

//Проверим что поле  TRANS_PACKAGE.type занимает 1 байт, для протокола это важно
static_assert((offsetof(TRANS_PACKAGE, data) - offsetof(TRANS_PACKAGE, type)) == 1, "Size field TRANS_PACKAGE.type NOT 1 byte");

/*Струтура для преобразования TRANS_PACKAGE в байты и обратно	*/
typedef union {
	/*Данные в виде пакета TRANS_PACKAGE*/
	TRANS_PACKAGE *package;
	/*Данные в виде массива байт*/
	uint8_t *bytes;
} TRANS_PACKAGE_BYTES;

inline TRANS_PACKAGE TRANS_NewPackage(TRANS_ADDRESS sourceAddress, TRANS_ADDRESS targetAddress, TRANS_PACKAGE_TYPE type) {
	TRANS_PACKAGE package = {
		.magicMark = TRANS_PACKAGE_MAGIC,
		.sign = TRANS_PACKAGE_SIGN,
		.sourceAddress = sourceAddress,
		.targetAddress = targetAddress,
		.type = type,
		.end = 0xFF
	};
	return package;
}

uint8_t TRANS_ByteToPackage(uint8_t *bytes, TRANS_PACKAGE **pPackage) {
	TRANS_PACKAGE_BYTES p2bytes;
	p2bytes.bytes = bytes;
	uint8_t error = 0;

	if (p2bytes.package->magicMark != TRANS_PACKAGE_MAGIC) {
		error = 1;
	} else if (p2bytes.package->sign != TRANS_PACKAGE_SIGN) {
		error = 2;
	} else if (p2bytes.package->end != TRANS_PACKAGE_END_BYTE) {
		error = 3;
	}

	*pPackage = p2bytes.package;
	return error;
}

uint8_t *TRANS_PackageToByte(TRANS_PACKAGE *pPackage) {
	TRANS_PACKAGE_BYTES bytes;
	bytes.package = pPackage;
	return bytes.bytes;
}

bool inline TRANS_IsMarkBeginPackage(uint8_t byteFirst, uint8_t byteSecond) {
	return byteFirst == TRANS_PACKAGE_MAGIC_FIRST_BYTE && byteSecond == TRANS_PACKAGE_MAGIC_SECOND_BYTE;
}
