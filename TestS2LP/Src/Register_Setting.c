#include <stdint.h>

/**

The SPI interface is platform dependent, this means that it should be implemented according to the used hardware.

The function S2LPSpiWriteRegisters(uint8_t address, uint8_t n_regs, uint8_t* buffer) must be implemented.

An example of implementation (for the SDK_EVAL motherboards of the S2-LP kit) can be found into the file: Projects/Drivers/BSP/SDK_Eval_STM32L/Src/SDK_EVAL_Spi_Driver.c
It is advisable to implement also the read registers, the command strobe and the 2 FIFO functions to read and write (no reference in this template code but needed in applications using the FIFO of the S2-LP).


**/

/* list of the command codes of S2-LP */
#define	COMMAND_TX                                          ((uint8_t)(0x60)) /*!< Start to transmit; valid only from READY */
#define	COMMAND_RX                                          ((uint8_t)(0x61)) /*!< Start to receive; valid only from READY */
#define	COMMAND_READY                                       ((uint8_t)(0x62)) /*!< Go to READY; valid only from STANDBY or SLEEP or LOCK */
#define	COMMAND_STANDBY                                     ((uint8_t)(0x63)) /*!< Go to STANDBY; valid only from READY */
#define	COMMAND_SLEEP                                       ((uint8_t)(0x64)) /*!< Go to SLEEP; valid only from READY */
#define	COMMAND_LOCKRX                                      ((uint8_t)(0x65)) /*!< Go to LOCK state by using the RX configuration of the synth; valid only from READY */
#define	COMMAND_LOCKTX                                      ((uint8_t)(0x66)) /*!< Go to LOCK state by using the TX configuration of the synth; valid only from READY */
#define	COMMAND_SABORT                                      ((uint8_t)(0x67)) /*!< Force exit form TX or RX states and go to READY state; valid only from TX or RX */
#define	COMMAND_SRES                                        ((uint8_t)(0x70)) /*!< Reset of all digital part, except SPI registers */
#define	COMMAND_FLUSHRXFIFO                                 ((uint8_t)(0x71)) /*!< Clean the RX FIFO; valid from all states */
#define	COMMAND_FLUSHTXFIFO                                 ((uint8_t)(0x72)) /*!< Clean the TX FIFO; valid from all states */


/* This is the function that initializes the S2-LP with the configuration 
that the user has exported using the GUI */
void SpiritBaseConfiguration(void)
{
  uint8_t tmp[6];

  tmp[0] = 0xA3; /* reg. GPIO3_CONF (0x03) */
  S2LPSpiWriteRegisters(0x03, 1, tmp);
  tmp[0] = 0x62; /* reg. SYNT3 (0x05) */
  tmp[1] = 0x2B; /* reg. SYNT2 (0x06) */
  tmp[2] = 0x85; /* reg. SYNT1 (0x07) */
  tmp[3] = 0x28; /* reg. SYNT0 (0x08) */
  tmp[4] = 0x2F; /* reg. IF_OFFSET_ANA (0x09) */
  tmp[5] = 0xC2; /* reg. IF_OFFSET_DIG (0x0A) */
  S2LPSpiWriteRegisters(0x05, 6, tmp);
  tmp[0] = 0x92; /* reg. MOD4 (0x0E) */
  tmp[1] = 0xA7; /* reg. MOD3 (0x0F) */
  tmp[2] = 0x27; /* reg. MOD2 (0x10) */
  S2LPSpiWriteRegisters(0x0E, 3, tmp);
  tmp[0] = 0xA3; /* reg. MOD0 (0x12) */
  tmp[1] = 0x13; /* reg. CHFLT (0x13) */
  S2LPSpiWriteRegisters(0x12, 2, tmp);
  tmp[0] = 0x10; /* reg. RSSI_TH (0x18) */
  S2LPSpiWriteRegisters(0x18, 1, tmp);
  tmp[0] = 0x55; /* reg. ANT_SELECT_CONF (0x1F) */
  S2LPSpiWriteRegisters(0x1F, 1, tmp);
  tmp[0] = 0x00; /* reg. PCKTCTRL3 (0x2E) */
  tmp[1] = 0x01; /* reg. PCKTCTRL2 (0x2F) */
  tmp[2] = 0x30; /* reg. PCKTCTRL1 (0x30) */
  S2LPSpiWriteRegisters(0x2E, 3, tmp);
  tmp[0] = 0x12; /* reg. PCKTLEN0 (0x32) */
  S2LPSpiWriteRegisters(0x32, 1, tmp);
  tmp[0] = 0x44; /* reg. PROTOCOL2 (0x39) */
  tmp[1] = 0x01; /* reg. PROTOCOL1 (0x3A) */
  S2LPSpiWriteRegisters(0x39, 2, tmp);
  tmp[0] = 0x40; /* reg. FIFO_CONFIG3 (0x3C) */
  tmp[1] = 0x40; /* reg. FIFO_CONFIG2 (0x3D) */
  tmp[2] = 0x40; /* reg. FIFO_CONFIG1 (0x3E) */
  tmp[3] = 0x40; /* reg. FIFO_CONFIG0 (0x3F) */
  tmp[4] = 0x41; /* reg. PCKT_FLT_OPTIONS (0x40) */
  S2LPSpiWriteRegisters(0x3C, 5, tmp);
  tmp[0] = 0xCE; /* reg. TIMERS5 (0x46) */
  tmp[1] = 0x09; /* reg. TIMERS4 (0x47) */
  S2LPSpiWriteRegisters(0x46, 2, tmp);
  tmp[0] = 0x1D; /* reg. PA_POWER8 (0x5A) */
  S2LPSpiWriteRegisters(0x5A, 1, tmp);
  tmp[0] = 0x07; /* reg. PA_POWER0 (0x62) */
  tmp[1] = 0x01; /* reg. PA_CONFIG1 (0x63) */
  S2LPSpiWriteRegisters(0x62, 2, tmp);
  tmp[0] = 0x87; /* reg. PM_CONF3 (0x76) */
  tmp[1] = 0xFC; /* reg. PM_CONF2 (0x77) */
  S2LPSpiWriteRegisters(0x76, 2, tmp);
}
