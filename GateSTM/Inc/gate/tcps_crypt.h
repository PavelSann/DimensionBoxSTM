#pragma once

#include <stdint.h>
#include <stdbool.h>
/**
 * Расчёт CRC32 с использованием встроенного в МК модуля.
 * Приводит результат к "нормальной"  CRC-32 (Ethernet) polynomial: 0x4C11DB7
 * @param pData
 * @param count
 * @param reset
 * @return
 */
uint32_t CRYPT_crc(const void *pData, uint16_t count, bool reset);
/**
 * Шифрование блока, по байтово, операцией XOR.
 * Если ключ короче блока данных, он повторяется
 * @param buf
 * @param bufLen
 * @param key
 * @param keyLen
 */
void CRYPT_xor(void *buf, uint16_t bufLen, const uint8_t *key, uint16_t keyLen);
