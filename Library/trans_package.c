#include "trans_package.h"
#include "stm32l1xx_hal_conf.h"
#include <assert.h>

/**Маркер начала пакета*/
#define TRANS_PACKAGE_MAGIC 0xCAFE
/**Первый байт маркера*/
#define TRANS_PACKAGE_MAGIC_FIRST_BYTE 0xFE
/**второй байт маркера*/
#define TRANS_PACKAGE_MAGIC_SECOND_BYTE 0xCA
/**Маркер окончания данных в пакета, так же байт выравнивания*/
#define TRANS_PACKAGE_END_BYTE 0xFF
/**Длина поля с подписью или контрольной суммой*/
#define TRANS_PACKAGE_CRC_SIZE 4
/**Рзмер блока, для которого считается CRC*/
#define TRANS_PACKAGE_CALC_CRC_DWORD_SIZE ((TRANS_PACKAGE_SIZE-TRANS_PACKAGE_CRC_SIZE)/4)
#define TRANS_PACKAGE_CRC_DEFAULT 0xFFFFFFFF

//Проверим что поле  TRANS_PACKAGE.type занимает 1 байт, для протокола это важно
static_assert((offsetof(TRANSPackage, data) - offsetof(TRANSPackage, type)) == 1, "Size field TRANS_PACKAGE.type NOT 1 byte");
static_assert((TRANS_PACKAGE_SIZE % 4) == 0, "Size TRANS_PACKAGE not multiple of 4");
static_assert(((TRANS_PACKAGE_SIZE - TRANS_PACKAGE_CRC_SIZE) % 4) == 0, "Size TRANS_PACKAGE_SIGNNED_BYTES_SIZE not multiple of 4");
static_assert((offsetof(TRANSPackage, sourceAddress) - offsetof(TRANSPackage, magicMark)) == TRANS_PACKAGE_MARK_SIZE, "Invalid size field TRANS_PACKAGE.mark ");
static_assert((TRANS_PACKAGE_SIZE - offsetof(TRANSPackage, crc)) == TRANS_PACKAGE_CRC_SIZE, "Invalid size field TRANS_PACKAGE.crc ");

/*Струтура для преобразования TRANS_PACKAGE в байты и обратно	*/
typedef union {
	/*Данные в виде пакета TRANS_PACKAGE*/
	TRANSPackage *package;
	/*Данные в виде массива байт*/
	uint8_t *bytes;
} TRANS_PACKAGE_BYTES;

static CRC_HandleTypeDef *hCRC = NULL;

void PACK_Init(CRC_HandleTypeDef *hcrc) {
	assert_param(hcrc != NULL);
	hCRC = hcrc;
}

static inline uint32_t CRC_Calculate(uint32_t pBuffer[], uint32_t BufferLength) {
	/* Change CRC peripheral state */
	hCRC->State = HAL_CRC_STATE_BUSY;
	/* Reset CRC Calculation Unit */
	__HAL_CRC_DR_RESET(hCRC);
	/* Enter Data to the CRC calculator */
	for (uint32_t index = 0; index < BufferLength; index++) {
		//__RBIT реверс бит в значении, чтобы получить нормальную crc32
		hCRC->Instance->DR = __RBIT(pBuffer[index]);
	}
	/* Change CRC peripheral state */
	hCRC->State = HAL_CRC_STATE_READY;
	/* Return the CRC computed value */
	//__RBIT реверс бит в результате и инверсия бит, чтобы получить нормальную crc32
	return ~__RBIT(hCRC->Instance->DR);
}

static inline uint32_t calcCRC(TRANS_PACKAGE_BYTES *pb) {
	uint8_t* bytes = pb->bytes;
	return CRC_Calculate((uint32_t *) bytes, TRANS_PACKAGE_CALC_CRC_DWORD_SIZE);
}

inline TRANSPackage PACK_NewPackage(TRANSAddress sourceAddress, TRANSAddress targetAddress, TRANSPackageType type) {
	TRANSPackage package = {
		.magicMark = TRANS_PACKAGE_MAGIC,
		.sourceAddress = sourceAddress,
		.targetAddress = targetAddress,
		.type = type,
		.end = TRANS_PACKAGE_END_BYTE,
		.crc = TRANS_PACKAGE_CRC_DEFAULT
	};
	return package;
}

PACKError PACK_ByteToPackage(uint8_t *bytes, TRANSPackage **pPackage) {
	TRANS_PACKAGE_BYTES p2bytes;
	p2bytes.bytes = bytes;
	PACKError error = PACK_ERR_NONE;
	TRANSPackage* pack = p2bytes.package;

	if (pack->magicMark != TRANS_PACKAGE_MAGIC) {
		error = PACK_ERR_BAD_MARK;
	} else if (pack->end != TRANS_PACKAGE_END_BYTE) {
		error = PACK_ERR_BAD_END_BYTE;
	} else {
		uint32_t crcPack = calcCRC(&p2bytes);
		if (pack->crc != crcPack) {
			error = PACK_ERR_BAD_CRC;
		}
	}

	*pPackage = p2bytes.package;
	return error;
}

uint8_t * PACK_PackageToByte(TRANSPackage * pPackage) {
	TRANS_PACKAGE_BYTES pb;
	pb.package = pPackage;
	uint32_t crcPack = calcCRC(&pb);
	pPackage->crc = crcPack;
	return pb.bytes;
}

bool inline PACK_IsMarkBeginPackage(uint8_t byteFirst, uint8_t byteSecond) {
	return byteFirst == TRANS_PACKAGE_MAGIC_FIRST_BYTE && byteSecond == TRANS_PACKAGE_MAGIC_SECOND_BYTE;
}

//void PACK_SetPackageCRC(TRANS_PACKAGE *package) {
//	TRANS_PACKAGE_BYTES pb;
//	pb.package = package;
//	uint32_t crcPack = calcCRC(&pb);
//	package->sign = crcPack;
//}
