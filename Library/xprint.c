#include "xprint.h"

void SWO_xfunc_out(unsigned char c) {
	ITM_SendChar(c);
}

unsigned char SWO_xfunc_in() {
	int32_t r = ITM_ReceiveChar();
	return r;
}

void xprint_init_SWO() {
	xdev_out(SWO_xfunc_out);
	xdev_in(SWO_xfunc_in);
}

void xprintln(const char* str) {
	xputs(str);
	xputc('\n');
}

void xprintbt(const void* buff, int len) {
	int i;
	const unsigned char *bp;
	bp = buff;
	for (i = 0; i < len; i++) /* Hexdecimal dump */
		xprintf(" %02X", bp[i]);
	xputc(' ');
	for (i = 0; i < len; i++) /* ASCII dump */
		xputc((bp[i] >= ' ' && bp[i] <= '~') ? bp[i] : '.');
	xputc('\n');
}

#if X_PRINT_UART
static UART_HandleTypeDef *hUart;

void UART_xfunc_out(unsigned char ch) {
	uint8_t c[1];
	c[0] = ch;// & 0x00FF;
	HAL_UART_Transmit(hUart, &*c, 1, 10);
}

unsigned char UART_xfunc_in() {
	uint8_t c[1];
	HAL_UART_Receive(hUart,c, 1, UINT32_MAX);
	unsigned char ch = c[0];// & 0x00FF;
	return ch;
}

void xprint_init_UART(UART_HandleTypeDef *huart) {
	hUart = huart;
	xdev_out(UART_xfunc_out);
	xdev_in(UART_xfunc_in);
}
#endif