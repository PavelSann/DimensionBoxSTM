#include <stdint.h>
#include "xprint.h"
#include "MCU_Interface_template.h"
#include <stdbool.h>
#include "S2LP_Config.h"
#include "s2pl_opt.h"

static volatile FlagStatus xTxDoneFlag = RESET;
static volatile FlagStatus isInitS2LP = RESET;

static SGpioInit xGpio0IRQ = {
  S2LP_GPIO_0,
  S2LP_GPIO_MODE_DIGITAL_OUTPUT_LP,
  S2LP_GPIO_DIG_OUT_IRQ
};

static SRadioInit xRadioInit = {
  BASE_FREQUENCY,
  MODULATION_SELECT,
  DATARATE,
  FREQ_DEVIATION,
  BANDWIDTH
};

static PktBasicInit xBasicInit = {
  PREAMBLE_LENGTH,
  SYNC_LENGTH,
  SYNC_WORD,
  VARIABLE_LENGTH,
  EXTENDED_LENGTH_FIELD,
  CRC_MODE,
  EN_ADDRESS,
  EN_FEC,
  EN_WHITENING
};

static S2LPIrqs xIrqStatus;
static volatile int32_t rssidBm = -200;

static uint8_t txBuff[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
#define TX_BUFF_SIZE sizeof(txBuff)
static uint8_t rxBuff[256] = {0};

void printIrqs(const char* msg, S2LPIrqs *pxIrqs) {
  LOG("S2LP IRQs: %s", msg);
  LOGMEM(pxIrqs, sizeof (S2LPIrqs));
  LOG("IRQ_RX_DATA_READY:%d", pxIrqs->IRQ_RX_DATA_READY); /*!< IRQ: RX data ready */
  LOG("IRQ_RX_DATA_DISC:%d", pxIrqs->IRQ_RX_DATA_DISC); /*!< IRQ: RX data discarded (upon filtering) */
  LOG("IRQ_TX_DATA_SENT:%d", pxIrqs->IRQ_TX_DATA_SENT); /*!< IRQ: TX data sent */
  LOG("IRQ_MAX_RE_TX_REACH:%d", pxIrqs->IRQ_MAX_RE_TX_REACH); /*!< IRQ: Max re-TX reached */
  LOG("IRQ_CRC_ERROR:%d", pxIrqs->IRQ_CRC_ERROR); /*!< IRQ: CRC error */
  LOG("IRQ_TX_FIFO_ERROR:%d", pxIrqs->IRQ_TX_FIFO_ERROR); /*!< IRQ: TX FIFO underflow/overflow error */
  LOG("IRQ_RX_FIFO_ERROR:%d", pxIrqs->IRQ_RX_FIFO_ERROR); /*!< IRQ: RX FIFO underflow/overflow error */
  LOG("IRQ_TX_FIFO_ALMOST_FULL:%d", pxIrqs->IRQ_TX_FIFO_ALMOST_FULL); /*!< IRQ: TX FIFO almost full */
  LOG("IRQ_TX_FIFO_ALMOST_EMPTY:%d", pxIrqs->IRQ_TX_FIFO_ALMOST_EMPTY); /*!< IRQ: TX FIFO almost empty */
  LOG("IRQ_RX_FIFO_ALMOST_FULL:%d", pxIrqs->IRQ_RX_FIFO_ALMOST_FULL); /*!< IRQ: RX FIFO almost full */
  LOG("IRQ_RX_FIFO_ALMOST_EMPTY:%d", pxIrqs->IRQ_RX_FIFO_ALMOST_EMPTY); /*!< IRQ: RX FIFO almost empty  */
  LOG("IRQ_MAX_BO_CCA_REACH:%d", pxIrqs->IRQ_MAX_BO_CCA_REACH); /*!< IRQ: Max number of back-off during CCA */
  LOG("IRQ_VALID_PREAMBLE:%d", pxIrqs->IRQ_VALID_PREAMBLE); /*!< IRQ: Valid preamble detected */
  LOG("IRQ_VALID_SYNC:%d", pxIrqs->IRQ_VALID_SYNC); /*!< IRQ: Sync word detected */
  LOG("IRQ_RSSI_ABOVE_TH:%d", pxIrqs->IRQ_RSSI_ABOVE_TH); /*!< IRQ: RSSI above threshold */
  LOG("IRQ_WKUP_TOUT_LDC:%d", pxIrqs->IRQ_WKUP_TOUT_LDC); /*!< IRQ: Wake-up timeout in LDC mode */
  LOG("IRQ_READY:%d", pxIrqs->IRQ_READY); /*!< IRQ: READY state */
  LOG("IRQ_STANDBY_DELAYED:%d", pxIrqs->IRQ_STANDBY_DELAYED); /*!< IRQ: STANDBY state after MCU_CK_CONF_CLOCK_TAIL_X clock cycles */
  LOG("IRQ_LOW_BATT_LVL:%d", pxIrqs->IRQ_LOW_BATT_LVL); /*!< IRQ: Battery level below threshold*/
  LOG("IRQ_POR:%d", pxIrqs->IRQ_POR); /*!< IRQ: Power On Reset */
  LOG("IRQ_BOR:%d", pxIrqs->IRQ_BOR); /*!< IRQ: Brown out event (both accurate and inaccurate)*/
  LOG("IRQ_LOCK:%d", pxIrqs->IRQ_LOCK); /*!< IRQ: LOCK state */
  LOG("IRQ_VCO_CALIBRATION_END:%d", pxIrqs->IRQ_VCO_CALIBRATION_END); /*!< IRQ: End of VCO calibration procedure */
  LOG("IRQ_PA_CALIBRATION_END:%d", pxIrqs->IRQ_PA_CALIBRATION_END); /*!< IRQ: End of PA calibration procedure */
  LOG("IRQ_PM_COUNT_EXPIRED:%d", pxIrqs->IRQ_PM_COUNT_EXPIRED); /*!< IRQ: only for debug; Power Management startup timer expiration (see reg PM_START_COUNTER, 0xB5) */
  LOG("IRQ_XO_COUNT_EXPIRED:%d", pxIrqs->IRQ_XO_COUNT_EXPIRED); /*!< IRQ: only for debug; Crystal oscillator settling time counter expired */
  LOG("IRQ_TX_START_TIME:%d", pxIrqs->IRQ_TX_START_TIME); /*!< IRQ: only for debug; TX circuitry startup time; see TX_START_COUNTER */
  LOG("IRQ_RX_START_TIME:%d", pxIrqs->IRQ_RX_START_TIME); /*!< IRQ: only for debug; RX circuitry startup time; see TX_START_COUNTER */
  LOG("IRQ_RX_TIMEOUT:%d", pxIrqs->IRQ_RX_TIMEOUT); /*!< IRQ: RX operation timeout */
  LOG("IRQ_RX_SNIFF_TIMEOUT:%d", pxIrqs->IRQ_RX_SNIFF_TIMEOUT); /*!< IRQ: RX sniff opeartion timeout */

}

void RADIO_Init(SPI_HandleTypeDef *pHSPI, GPIO_TypeDef* csnPort, uint16_t csnPin, GPIO_TypeDef* sdnPort, uint16_t sdnPin) {
  LOG("Init S2LP...");
  SdkEvalSpiInitEx(pHSPI, csnPort, csnPin);
  /* Puts high the GPIO connected to shutdown pin */
  HAL_GPIO_WritePin(sdnPort, sdnPin, GPIO_PIN_SET);
  /* Puts low the GPIO connected to shutdown pin */
  HAL_GPIO_WritePin(sdnPort, sdnPin, GPIO_PIN_RESET);
  /* Delay to allow the circuit POR, about 700 us */
  for (volatile uint32_t i = 0; i < 0x1E00; i++);

  HAL_Delay(100);

  /* S2LP IRQ config */
  S2LPGpioInit(&xGpio0IRQ);

  /* S2LP Radio config */
  S2LPRadioInit(&xRadioInit);

  /* S2LP Radio set power */
  S2LPRadioSetMaxPALevel(S_ENABLE); //выбираем максимальную мощность 14dBm
  //	S2LPRadioSetPALeveldBm(7, POWER_DBM);// задаём 7 уровень мощности
  //	S2LPRadioSetPALevelMaxIndex(7);// выбираем 7 уровень мощности
  S2LPRadioSetRssiThreshdBm(RSSI_THREHSOLD_DBM);

  /* S2LP Packet config */
  S2LPPktBasicInit(&xBasicInit);

  /* S2LP IRQs enable */
  S2LPIrqs irqInit = {0};
  irqInit.IRQ_TX_DATA_SENT = S_ENABLE;
  irqInit.IRQ_RX_DATA_READY = S_ENABLE;
  S2LPGpioIrqInit(&irqInit);

  //S2LPGpioIrqDeInit(NULL);
  //S2LPGpioIrqConfig(TX_DATA_SENT, S_ENABLE);
  //S2LPGpioIrqConfig(RX_DATA_READY, S_ENABLE);

  /* payload length config */
  S2LPPktBasicSetPayloadLength(TX_BUFF_SIZE);

  /* IRQ registers blanking */
  S2LPGpioIrqClearStatus();

  /* RX timeout config */
  //	S2LPTimerSetRxTimerUs(700000);

  isInitS2LP = SET;

  LOG("S2LP Status: ON:%d STATE:%d", g_xStatus.XO_ON, g_xStatus.MC_STATE);

  //  S2LPGpioSetLevel(S2LP_GPIO_0,HIGH);
  //  S2LPGpioSetLevel(S2LP_GPIO_1,HIGH);
  //  S2LPGpioSetLevel(S2LP_GPIO_2,HIGH);
  //  S2LPGpioSetLevel(S2LP_GPIO_3,HIGH);

  //    S2LPIrqs irqMask = {0};
  //    S2LPGpioIrqGetMask(&irqMask);
  //    printIrqs("mask", &irqMask);
  //  uint8_t tmp;
  //  S2LPSpiReadRegisters(S2LP_GPIO_0, 1, &tmp);
  //  LOG("S2LP_GPIO_0: %x",tmp);
  //  S2LPSpiReadRegisters(S2LP_GPIO_1, 1, &tmp);
  //  LOG("S2LP_GPIO_1: %x",tmp);
  //  S2LPSpiReadRegisters(S2LP_GPIO_2, 1, &tmp);
  //  LOG("S2LP_GPIO_2: %x",tmp);
  //  S2LPSpiReadRegisters(S2LP_GPIO_3, 1, &tmp);
  //  LOG("S2LP_GPIO_3: %x",tmp);

}

void RADIO_Transmit() {

  /* fit the TX FIFO */
  S2LPCmdStrobeFlushTxFifo();
  S2LPSpiWriteFifo(TX_BUFF_SIZE, txBuff);

  /* send the TX command */
  S2LPCmdStrobeTx();

  //	S2LPGpioIrqGetStatus(&xIrqStatus);
  /* wait for TX done */
  while (!xTxDoneFlag);
  xTxDoneFlag = RESET;
  //	LOG("Data transmit");


}

void RADIO_Receive() {
  /* RX command */
  S2LPCmdStrobeRx();
}

void abortS2LP() {
  S2LPGpioIrqConfig(RX_DATA_DISC, S_DISABLE);
  S2LPCmdStrobeSabort();
  for (uint32_t i = 0; i < 0xfff; i++);
  S2LPGpioIrqClearStatus();
  S2LPGpioIrqConfig(RX_DATA_DISC, S_ENABLE);
}

void RADIO_Test() {
//  txS2LP();
  //  S2LPGpioIrqGetStatus(&xIrqStatus);
  //  LOGMEM(&xIrqStatus, sizeof (S2LPIrqs));
}

void RADIO_GPIOCallback() {
  if (isInitS2LP /*&& GPIO_Pin == S2LP_Pin0_Pin*/) {
    /* Get the IRQ status */
    S2LPGpioIrqGetStatus(&xIrqStatus);
    //LOGMEM(&xIrqStatus, sizeof (S2LPIrqs));
    /* Check the SPIRIT TX_DATA_SENT IRQ flag */
    if (xIrqStatus.IRQ_TX_DATA_SENT) {
      xTxDoneFlag = SET;
      //			LOG("IRQ_TX_DATA_SENT");
    }

    if (xIrqStatus.IRQ_RX_DATA_READY) {
      /* Get the RX FIFO size */
      uint8_t rxDataSize = S2LPFifoReadNumberBytesRxFifo();
      /* Read the RX FIFO */
      S2LPSpiReadFifo(rxDataSize, rxBuff);
      rxBuff[rxDataSize++] = '\0';

      /* Flush the RX FIFO */
      S2LPCmdStrobeFlushRxFifo();

      /* RX command */
      S2LPCmdStrobeRx();
      rssidBm = S2LPRadioGetRssidBm();
      //HAL_GPIO_WritePin(LedErr_GPIO_Port, LedErr_Pin, GPIO_PIN_SET);
      LOG("Data receiver. RSSI: %d dBm", rssidBm);
      LOGMEM(rxBuff, rxDataSize);

    }
  }
}