#include "meters/electro_meter.h"
#include <string.h>
#include <stdlib.h>

/*Нужно ли писать пакеты в лог*/
#define TRACE_LOG 0

#define UART_TRANSMIT_TIMEOUT 100
#define UART_RECEIVE_TIMEOUT 500


/*STX Символ  начала  кадра  в  блоке  с  контрольным  символом (STX,  начало  текста,  код  02Н)*/
#define EM_stx 0x02
/*Символ конца в неполном блоке  (EOT,  конец блока текста,  код 04Н)*/
#define EM_eot 0x04
/*Символ конца блока (ЕТХ, конец текста,  код 03Н)*/
#define EM_etx 0x03
/*Символ подтверждения  (АСК, подтверждение,  код 06Н)*/
#define EM_ack 0x06
/*2 cимвол завершения  (LF,  перевод строки,  код ОАН) CRLF*/
#define EM_lf 0x0A
/*1 cимвол завершения  (CR, возврат каретки,  код ODH;) CRLF */
#define EM_cr 0x0D
/*Символ начала заголовка (SOH,  начало заголовка,  код 01Н)*/
#define EM_soh 0x01
/*Символ повторения запроса (NAK, отрицательное  подтверждение,  код  15Н)*/
#define EM_nak 0x15

/*Запрос к устройству или поиск устройств*/
static uint8_t cmdRequest[] = {'/', '?', '!', EM_cr, EM_lf};
#define cmdRequestLn sizeof(cmdRequest)
//static const uint8_t cmdRequest[] = {'/', '?', '1', '1', '1', '7', '5', '5', '0', '2', '3', '!', EM_cr, EM_lf};

/*Режим чтения данных*/
static uint8_t cmdReadData[] = {EM_ack, '0', '5', '0', EM_cr, EM_lf};
#define cmdReadDataLn sizeof(cmdReadData)

/*Режим программирования*/
static uint8_t cmdProgramMode[] = {EM_ack, '0', '5', '1', EM_cr, EM_lf};
#define cmdProgramModeLn sizeof(cmdProgramMode)
/*Режим программирования*/
static uint8_t cmdBreak[] = {EM_soh, 'B', '0', EM_etx, 'u'};
#define cmdBreakLn sizeof(cmdBreak)

static const char *password = "777777";


static UART_HandleTypeDef *hUART;
static GPIO_TypeDef* MAX484_RD_Port;
static uint16_t MAX484_RD_Pin;

static inline uint8_t calcLRC(uint8_t *data, uint16_t ln) {
	/**
	  Calculates one byte Longitudinal Redundancy Checksum (LRC). The LRC is an
	  exclusive-or calculation on all data bytes. The LRC is calculated from the
	  begining of data buffer to the termination character, including termination
	  character itself.

	  Returns: Longitudinal Redundancy Checksum (LRC).


			  +---+
			  |STX|  Start of Text [1 Byte]
		   /--+---+--
		   |  | D |  Data [N bytes]
		   L  | a |
		   R  | t |
		   C  | a |
			  +---+
		   s  |ETX|
		   u  |ETB|  Termination Character [1 Byte]
		   m  |EOT|
		   \--+---+--
			  |LRC|  Longitudinal Redundancy Checksum [1 Byte]
			  +---+
					 iCount = N+1 [byte]

	 */
	/*https://en.wikipedia.org/wiki/Longitudinal_redundancy_check */
	uint8_t lrc = 0;
	// skip first byte, STX
	++data;
	--ln;
	while (ln > 0) {
		//		lrc ^= *data++;
		lrc = (lrc + *data++) & 0xFF;
		--ln;
	}
	return lrc;
}


/*Размер заголовка команд, без учёта переменных значений addr и value*/
#define CMD_HEAD_SIZE 8

static inline uint16_t createCmd(char cmd, char cmdMod, const char *addr, const char *value, uint8_t *buff) {
	//{EM_soh, 'P', '1', EM_stx, '(', '7', '7', '7', '7', '7', '7', ')', EM_etx, '!'};
	//SOH<P|W|R|E|B><1-4|5-9>STX<ADDR>(<VALUE>)ETX<BCC>

	//TODO: проверить размер buffSize
	//	uint16_t ln=strlen(addr)+strlen(value);
	//	if(buffSize< ln)

	uint8_t *pb = buff;
	*pb++ = EM_soh; //SOH
	*pb++ = cmd; //<P|W|R|E|B>
	*pb++ = cmdMod; //<1-4|5-9>
	*pb++ = EM_stx; //STX
	while ((*pb++ = *addr++)); //copy address
	pb--; // clean \0
	*pb++ = '(';
	while ((*pb++ = *value++)); //copy value
	pb--; // clean \0
	*pb++ = ')';
	*pb++ = EM_etx;
	uint16_t size = pb - buff;
	*pb++ = calcLRC(buff, size);
	return size;
}

/*
void ElectroMeter_CMD() {
	xprintln("Enter command:");
	char command[102];
	xgets(command, 100);
	int ln = 0;
	for (ln = 0; command[ln] != 0 && ln < 100; ln++);
	command[ln++] = 0x0D;
	command[ln++] = 0x0A;

	for (int i = 0; i < ln; i++) {
		if (command[i] == '#') {
			command[i] = 0x06;
		}
	}

	xprintbt(command, ln);
	//	HAL_GPIO_TogglePin(LedGreen_GPIO_Port, LedGreen_Pin);
	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_SET); //вкл на передачу
	HAL_UART_Transmit(hUART, command, ln, 200);

	uint8_t result[100] = {0};
	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_RESET); //вкл на приём
	HAL_UART_Receive(hUART, result, 100, 1000);
	for (ln = 0; (result[ln] != 0) && ln < 100; ln++);
	xprintbt(result, ln);
	//	HAL_GPIO_TogglePin(LedGreen_GPIO_Port, LedGreen_Pin);
}
 */
static uint16_t send(uint8_t *command, uint16_t commandLn, uint8_t *result, uint16_t maxResultLn) {
	for (uint16_t i = 0; i < maxResultLn; i++) {
		result[i] = 0;
	}
#if TRACE_LOG
	LOG("->");
	LOGMEM(command, commandLn);
#endif
	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_SET); //вкл на передачу
	HAL_UART_Transmit(hUART, command, commandLn, UART_TRANSMIT_TIMEOUT);

	HAL_GPIO_WritePin(MAX484_RD_Port, MAX484_RD_Pin, GPIO_PIN_RESET); //вкл на приём
	HAL_UART_Receive(hUART, result, maxResultLn, UART_RECEIVE_TIMEOUT);
	uint16_t resultLn = maxResultLn;
	for (resultLn = 0; (result[resultLn] != 0) && resultLn < maxResultLn; resultLn++);
#if TRACE_LOG
	LOG("<-");
	LOGMEM(result, resultLn);
#endif
	return resultLn;
}

static uint16_t sendCmd(char cmd, char cmdMod, const char *addr, const char *value, uint8_t *result, uint16_t maxResultLn) {
	uint16_t buffLn = strlen(addr) + strlen(value) + CMD_HEAD_SIZE;
	uint8_t cmdBuff[buffLn];
	memset(cmdBuff, 0, buffLn);
	createCmd(cmd, cmdMod, addr, value, cmdBuff);
	return send(cmdBuff, buffLn, result, maxResultLn);
}

static void dumpData(uint8_t *result, uint16_t resultLn) {
	/*
Блок данных состоит из последовательности строк данных, отделяемых символами: CR, возврат
каретки,  код ASCII  ODH  и  LF,  перевод строки,  код  ОАН.  Строка данных  состоит из одного  или
нескольких наборов данных.  Набор данных содержит в общем случае идентификационный номер,
значение,  устройство  и  различные  граничные  символы.  Строка данных  не  должна  превышать  по
длине  78  символов,  включая  все  граничные,  разделительные и контрольные  символы.  Последова­
тельность наборов данных или  строк данных не фиксируется.
	 */
	//первый символ должен быть STX,
	if (result[0] != EM_stx) {
		xprintln("Not STX byte!");
	}

	int strBegin = 1;
	for (uint16_t i = 1; i < resultLn; i++) {
		if (result[i] == EM_lf && result[i - 1] == EM_cr) {
			xprint(result, strBegin, i - 1);
			xprintln("");
			strBegin = i + 1;
		}
	}
}

typedef struct {
	uint8_t *pBegin;
	uint8_t *pEnd;
	uint8_t *pNextRow;
	uint8_t *pEndRows;
	uint8_t lrc;
	uint8_t error;
} EM_Data;

typedef struct {
	uint8_t *pAddr;
	uint8_t *pValue;
} EM_DataRow;

static EM_Data parseData(uint8_t *buff, uint16_t ln) {
	/*02
	 * 45 54 30 50 45 28 30 2E 31 37 29 0D 0A
	 * 28 30 2E 31 32 29 0D 0A
	 * 28 30 2E 30 35 29 0D 0A
	 * 28 30 2E 30 30 29 0D 0A
	 * 28 30 2E 30 30 29 0D 0A
	 * 28 30 2E 30 30 29 0D 0A
	 * 03 55
	 * ET0PE(0.17)..
	 * (0.12)..
	 * (0.05)..
	 * (0.00)..
	 * (0.00)..
	 * (0.00)..
	 * .U
	 */
	EM_Data data;
	data.pBegin = buff;
	data.pEnd = (buff + ln);
	if (*buff == EM_stx) {
		uint8_t *pEndRows = data.pEnd - 2;
		if (*pEndRows == EM_etx) {
			data.lrc = *data.pEnd;
			data.pNextRow = buff + 1;
			data.pEndRows = pEndRows;
			data.error = 0;
		} else {
			data.error = 2;
		}
	} else {
		data.error = 1;
	}
	return data;
}

static EM_DataRow nextDataRow(EM_Data *pData) {
	EM_DataRow row;
	if (pData->error) {
		LOGERR("nextDataRow: error data %d \n", pData->error);
	} else if (pData->pNextRow == NULL) {
		LOGERR("nextDataRow: not next rows!");
		pData->error = 3;
	} else {
		uint8_t *tmp = pData->pNextRow;
		uint8_t *end = (pData->pEndRows);
		row.pAddr = pData->pNextRow;

		while (tmp < end) {
			if (*tmp == '(') {
				*tmp = '\0';
				row.pValue = tmp + 1;
			}

			if (*tmp == ')') {
				*tmp = '\0';
			}

			if (*tmp == EM_cr && *(tmp + 1) == EM_lf) {
				if (*(tmp + 2) == EM_etx) {//конец блока данных
					pData->pNextRow = NULL;
				} else {
					pData->pNextRow = tmp + 2;
				}
				break;
			}

			tmp++;
		}
	}
	return row;
}

static uint32_t strToInt(uint8_t *str) {
	uint32_t result = (*str++) - 0x30;
	uint8_t b;
	while ((b = *str++)) {
		if (b >= '0' && b <= '9') {
			result = result * 10 + (b - 0x30);
		} else {
			if (b != '.') {//пропускаем .
				break;
			}
		}
	}
	return result;

}

static ElectroMeterError getErrorCode(uint8_t *result, uint16_t resultLn) {
	uint8_t err = ElectroMeter_OK;
	//первый символ должен быть STX,
	if (result[0] != EM_stx) {
		LOGERR("getErrorCode: Not STX byte!");
		err = ElectroMeter_ERROR;
	}
	//<- 02 28 45 52 52 31 32 29 03 20 .(ERR12).
	if (resultLn >= 8) {
		if (result[1] == '(' && result[2] == 'E' && result[3] == 'R' && result[4] == 'R') {
			err = (result[5] - 0x30)*10 + (result[6] - 0x30);
		}
	} else {
		LOGERR("getErrorCode: Invalid resultLn=%d \n", resultLn);
	}
	return err;
}

void ElectroMeter_Init(UART_HandleTypeDef * huart, GPIO_TypeDef* GPIO_MAX484_RD_Port, uint16_t GPIO_MAX484_RD_Pin) {
	hUART = huart;
	MAX484_RD_Port = GPIO_MAX484_RD_Port;
	MAX484_RD_Pin = GPIO_MAX484_RD_Pin;
	//	huart->Init.BaudRate = 9600;
	LOG("ElectroMeter Init: UART:0x%x MAX484_Port:0x%x MAX484_Pin:0x%x", huart->Instance, *MAX484_RD_Port, MAX484_RD_Pin);
}

ElectroMeterValues ElectroMeter_GetValues() {
	uint16_t buffLn = 256;
	uint8_t buff[buffLn];
	memset(buff, 0, buffLn);

	uint16_t ln = 0;
	ElectroMeterValues values = {0};
	values.error = ElectroMeter_ERROR;
	//первичный запрос, в ответ должен придти ID устройства
	ln = send(cmdRequest, cmdRequestLn, buff, buffLn);
	if (ln > 0) {
		//переход в режим программирования
		ln = send(cmdProgramMode, cmdProgramModeLn, buff, buffLn);
		//в ответ должна придти контрольная строка

		//отправляем пароль
		ln = sendCmd('P', '1', "", password, buff, buffLn);
		if (ln == 1 && buff[0] == EM_ack) { //в ответ должен придти один байт EM_ack
			//запрос на чтение ET0PE
			//запрос показаний энергии, учётной нарастающим итогом по всем регистрам счётного механизма
			ln = sendCmd('R', '1', "ET0PE", "", buff, buffLn);
			// в ответ блок данных
			// блок данных может содержать код ошибки
			ElectroMeterError err = getErrorCode(buff, buffLn);
			if (err) {
				LOG("error code %d\n", err);
				values.error = err;
			} else {
				values.error = ElectroMeter_OK;

				EM_Data data = parseData(buff, ln);
				/*
				 * ET0PE(0.17) сумма
				 * (0.12) Т1
				 * (0.05) Т2
				 * (0.00) Т3
				 * (0.00) Т4
				 * (0.00) ??
				 */
				//				EM_DataRow sSumm = nextDataRow(&data);
				nextDataRow(&data); // первая строка, сумма
				EM_DataRow pT1 = nextDataRow(&data);
				EM_DataRow pT2 = nextDataRow(&data);
				EM_DataRow pT3 = nextDataRow(&data);
				EM_DataRow pT4 = nextDataRow(&data);
				//double test = atof(pT1.pValue);
				values.tariff1 = strToInt(pT1.pValue);
				values.tariff2 = strToInt(pT2.pValue);
				values.tariff3 = strToInt(pT3.pValue);
				values.tariff4 = strToInt(pT4.pValue);

				send(cmdBreak, cmdBreakLn, buff, buffLn);

			}
		} else {
			values.error = ElectroMeter_ERR_NOT_ASK;
			LOGERR("Meter not response АСК");
		}

	} else {
		values.error = ElectroMeter_ERR_NOT_RESPONSE;
		LOGERR("Meter not response");
	}

	return values;
}

ElectroMeterData ElectroMeter_ReadData() {
	uint16_t buffLn = 1024;
	uint8_t buff[buffLn];
	memset(buff, 0, buffLn);
	uint16_t ln = 0;
	ElectroMeterData result;
	result.error = ElectroMeter_ERROR;
	//первичный запрос, в ответ должен придти ID устройства
	ln = send(cmdRequest, cmdRequestLn, buff, buffLn);
	if (ln > 0) {
		//запрос на чтение основных данных
		ln = send(cmdReadData, cmdReadDataLn, buff, buffLn);
		if (ln > 0) {
			//получили блок данных
			EM_Data data = parseData(buff, ln);
			while (!data.error && data.pNextRow) {
				EM_DataRow row = nextDataRow(&data);

				if (strcmp("STAT_",(const char*) row.pAddr)==0) {
					result.stat = strToInt(row.pValue);
				} else if (strcmp("VOLTA",(const char*) row.pAddr)==0) {
					result.volta = strToInt(row.pValue);
				}
#if TRACE_LOG
				LOG("%s:%s", row.pAddr, row.pValue);
#endif
			}
		} else {
			result.error = ElectroMeter_ERROR;
			LOGERR("Empty data");
		}

	} else {
		result.error = ElectroMeter_ERR_NOT_RESPONSE;
		LOGERR("Meter not response");
	}
	return result;
}
