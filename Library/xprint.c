// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include "xprint.h"
#include "stm32l1xx_hal.h"

void SWO_xfunc_out(unsigned char c) {
	ITM_SendChar(c);
}

unsigned char SWO_xfunc_in() {
	//	int32_t r = ITM_ReceiveChar();
	LOGERR("Not support in SWO!");
	return '0';
}

void xprint_init_SWO() {
	xdev_out(SWO_xfunc_out);
	xdev_in(SWO_xfunc_in);
}

void xprintln(const char* str) {
	xputs(str);
	xputc('\n');
}

void xprint(const void* buff, int begin, int len) {
	int i;
	const unsigned char *bp;
	bp = buff;
	if (begin < len) {
		for (i = begin; i < len; i++) /* ASCII dump */
			xputc((bp[i] >= ' ' && bp[i] <= '~') ? bp[i] : '.');
	}
}

void xprintbt(const void* buff, int len) {
	int i;
	const unsigned char *bp;
	bp = buff;
	for (i = 0; i < len; i++) /* Hexdecimal dump */
		xprintf(" %02X", bp[i]);
	xputc(' ');
	xprint(buff, 0, len);
	xputc('\n');
}

#if X_PRINT_UART
static UART_HandleTypeDef *hUart;
	#define UART_XFUNC_OUT_TIMEOUT 10000
	#define UART_XFUNC_IN_TIMEOUT UINT32_MAX

void UART_xfunc_out(unsigned char ch) {
	uint8_t c[1];
	c[0] = ch; // & 0x00FF;
	HAL_UART_Transmit(hUart, &*c, 1, UART_XFUNC_OUT_TIMEOUT);
}

unsigned char UART_xfunc_in() {
	uint8_t c[1];
	HAL_UART_Receive(hUart, c, 1, UINT32_MAX);
	unsigned char ch = c[0]; // & 0x00FF;
	return ch;
}

void xprint_init_UART(UART_HandleTypeDef *huart) {
	hUart = huart;
	xdev_out(UART_xfunc_out);
	xdev_in(UART_xfunc_in);
}
#endif
