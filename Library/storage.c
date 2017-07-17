// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include "storage.h"
#include <assert.h>

//static_assert((STORAGE_STRUCT_SIZE % 4) == 0, "Size STORAGE_STRUCT_SIZE not multiple of 4");

#define ADDR_EEPROM_BANK_1 ((uint32_t)0x08080000U) //0x08080000 - 0x08081FFF 8 Kbytes
#define ADDR_EEPROM_BANK_2 0x08082000U //0x08082000 - 0x08083FFF 8 Kbytes
#define INIT_MARKER (0xFADEFACE) //0xFADEFACE 0xCAFECAFE 0xDEADCAFE
#define INIT_MARKER_SIZE 1
#define WORD_SIZE 4

#define ADDR_BEGIN_BANK ((uint32_t)ADDR_EEPROM_BANK_1)
#define POINTER_BEGIN_BANK_WORD ((__IO uint32_t *)ADDR_BEGIN_BANK)
#define POINTER_REGEON_ADDR (POINTER_BEGIN_BANK_WORD+1)
//extern FLASH_ProcessTypeDef pFlash;
static void *pRegion = NULL;
#define REGION_ADDR(offset)  (((uintptr_t)pRegion)+offset)
#define REGION_POINTER(offset,type)  ((type *)(pRegion+offset))

/*
 TODO: доработка storage
 Сделать регионы с идентификаторами
 В начале области памяти таблица регионов

 Regeon root=GetRegeon("ROOT");
 if(root==NULL){
 root=CreateRegeon("ROOT",32);
 }

 смещать регион в памяти после N циклов перезаписи
 ИМХО лучше делать 1 ячейку как указатель адреса на ячейку для сохранения переменной... через 100 000 меняем адрес на след.
 Количество гарантированых перезаписей увеличивается.
 я делал так: в первой ячейке хранится адрес ячейки с данными. Туда производится запись, далее чтение и проверка на совпадение, если нет, 
 то в первой ячейке увеличиваем адрес и пишем в следующую ячейку, а предыдущую бросаем.
 И так до конца EEPROM, а дальше...
 */

void STORAGE_Init(size_t regionSize) {

	if (*POINTER_BEGIN_BANK_WORD != INIT_MARKER) {
		HAL_FLASHEx_DATAEEPROM_Unlock();

		uint32_t addr = ADDR_BEGIN_BANK;
		HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, addr, INIT_MARKER);
		addr += WORD_SIZE;
		HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, addr, addr + WORD_SIZE);
		addr += WORD_SIZE;

		size_t count = (regionSize / WORD_SIZE) + 1;
		while (count--) {
			HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, addr, 0);
			addr += WORD_SIZE;
		}

		HAL_FLASHEx_DATAEEPROM_Lock();
	}

	pRegion = (void *) *POINTER_REGEON_ADDR;

}

HAL_StatusTypeDef STORAGE_WriteWord(uint32_t offset, uint32_t value) {
	HAL_FLASHEx_DATAEEPROM_Unlock();
	HAL_StatusTypeDef status = HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, REGION_ADDR(offset), value);
	HAL_FLASHEx_DATAEEPROM_Lock();
	return status;
}

uint32_t inline STORAGE_ReadWord(uint32_t offset) {
	uint32_t value = *REGION_POINTER(offset, uint32_t);
	return value;
}


//HAL_StatusTypeDef STORAGE_WriteStruct(STORAGE_STRUCT *pStruct) {
//	//	sizeof
//	//	offsetof
//	HAL_StatusTypeDef status = HAL_ERROR;
//	HAL_FLASHEx_DATAEEPROM_Unlock();
//
//	size_t count = (STORAGE_STRUCT_SIZE / 4);
//	uint32_t pROM = POINTER_EEPROM_WORD + INIT_MARKER_SIZE;
//	uint32_t *pStr = (uint32_t *) pStruct;
//	while (count--) {
//		HAL_FLASHEx_DATAEEPROM_Program(FLASH_TYPEPROGRAMDATA_WORD, (uint32_t) pROM++, *pStr++);
//	}
//
//	HAL_FLASHEx_DATAEEPROM_Lock();
//
//
//	return status;
//}
