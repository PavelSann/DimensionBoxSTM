#include "tcps_crypt.h"
#include "stm32f2xx.h"

uint32_t CRYPT_crc(const void *pData, uint16_t count, bool reset) {
#ifndef CRC
#error "Not define CRC"
#endif
  //в методе используется __RBIT для получения "стандартной" CRC32, у STM есть отличия в реализации

  uint32_t crc;
  uint32_t *pData32 = (uint32_t*) pData;
  uint16_t count32 = count >> 2;
  if (reset) {
    CRC->CR = CRC_CR_RESET;
  }

  while (count32--) {
    CRC->DR = __RBIT(*pData32++);
  }

  crc = __RBIT(CRC->DR);
  count = count % 4;
  if (count) {
    CRC->DR = __RBIT(crc);
    switch (count) {
      case 1:
        CRC->DR = __RBIT((*pData32 & 0x000000FF) ^ crc) >> 24;
        crc = (crc >> 8) ^ __RBIT(CRC->DR);
        break;
      case 2:
        CRC->DR = (__RBIT((*pData32 & 0x0000FFFF) ^ crc) >> 16);
        crc = (crc >> 16) ^ __RBIT(CRC->DR);
        break;
      case 3:
        CRC->DR = __RBIT((*pData32 & 0x00FFFFFF) ^ crc) >> 8;
        crc = (crc >> 24) ^ __RBIT(CRC->DR);
        break;
    }
  }

  return ~crc;
}

/*Симетричное шифрование, XOR*/
void CRYPT_xor(void *buf, uint16_t bufLen, const uint8_t *key, uint16_t keyLen) {
  //вероятно можно ускорить за счёт обработки по словам
  uint8_t *data = (uint8_t *) buf;
  for (int dI = 0, kI = 0; dI < bufLen; dI++, kI++) {
    if (kI == keyLen) {
      kI = 0;
    }
    data[dI] ^= key[kI];
  }
}