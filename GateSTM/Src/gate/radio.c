#include "radio.h"
#include <stdint.h>
#include "xprint.h"
#include "MCU_Interface.h" //#include "MCU_Interface_template.h"
#include <stdbool.h>
#include "S2LP_Config.h"
#include "radio_opt.h"

typedef enum {
  MSG_RX_DATA,
  MSG_TX_DONE,
  MSG_TX_DATA_IN_BUFFER,
} Message;
#define MSG_OPT_MAX_MESSAGES 100
#define MSG_OPT_MSG_TYPE Message
#define MSG_OPT_SAFE_ENUM 1
#include "messages_helper.h"
#include "opt.h"

//#define SAFE_ENUM(TYPE,VAL) ((VAL)==(TYPE)0?VAL:VAL)

typedef enum {
  STATE_NONE,
  STATE_READY,
  STATE_TX,
} State;
static volatile State state = STATE_NONE;
#define IsState(s) ((s)==state)
#define SetState(s) (state=(s))

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

//static volatile int32_t rssidBm = -200;

#define S2LP_FIFO_SIZE 128
/** Максимальный размер 1 пакета*/
#define RX_PACKET_MAX_SIZE S2LP_FIFO_SIZE
/** Максимальное количество пакетов в  буфере*/
//#define RX_PACKET_MAX_COUNT 10
/**Количество буферов*/
//#define RX_BUF_COUNT 2
//static uint8_t rxDataBuf[RX_BUF_COUNT][RX_MAX_PACKET_COUNT][RX_MAX_BUF_SIZE];

/*Примерная задержка в микросекундах, одна итерация примерно 12 тактов, реальная задержка будет на 20-30% больше*/
#define DELAY_US(us)   {for (volatile uint32_t count=((SystemCoreClock/12000000)*(us)), i = 0; i < count; i++);}

static uint8_t rxDataBuf[RX_PACKET_MAX_SIZE];
static uint16_t rxDataLen;

static RADIO_InitStruct init;

static void printIrqs(const char* msg, S2LPIrqs *pxIrqs) {
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

static void AbortS2LP() {
  //  S2LPGpioIrqConfig(RX_DATA_DISC, S_DISABLE);
  S2LPCmdStrobeSabort();
  DELAY_US(5);
  //  S2LPGpioIrqClearStatus();
  //  S2LPGpioIrqConfig(RX_DATA_DISC, S_ENABLE);
}

static void StartTX() {
  if (IsState(STATE_READY)) {
    SetState(STATE_TX);
    /* send the TX command */
    S2LPCmdStrobeTx();
  } else {
    LOGERR("Bad state %d", state);
  }
}

static void StartRX() {
  if (IsState(STATE_READY)) {
    S2LPCmdStrobeRx();
  } else {
    LOGERR("Bad state %d", state);
  }
}

static void WriteTxFifi(uint8_t* pTxBuffer, uint8_t cBuffer) {
  S2LPPktBasicSetPayloadLength(cBuffer);
  /*Clean the TX FIFO*/
  S2LPCmdStrobeFlushTxFifo();
  S2LPSpiWriteFifo(cBuffer, pTxBuffer);
}

static RADIO_Result ReadRxFifo() {
  /* Get the RX FIFO size */
  rxDataLen = S2LPFifoReadNumberBytesRxFifo();

  if (rxDataLen > RX_PACKET_MAX_SIZE) {
    LOGERR("Unsupport RX data size %d", rxDataLen);
    S2LPCmdStrobeFlushRxFifo();
    return RADIO_ERR_MEM;
  }
  /* Read the RX FIFO */
  S2LPSpiReadFifo(rxDataLen, rxDataBuf);
  /* Clean the RX FIFO*/
  S2LPCmdStrobeFlushRxFifo();
  return RADIO_OK;
}

static inline S2LPIrqs *GetIRQStatus() {
  static S2LPIrqs irqStatus;
  /* Get the IRQ status */
  S2LPGpioIrqGetStatus(&irqStatus);
  return &irqStatus;
}

void RADIO_Init(RADIO_InitStruct *pInit) {
  init = *pInit;
  LOG("Init S2LP...");

  SdkEvalEnterShutdown();
  SdkEvalExitShutdown();
  DELAY_US(1000);

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
  //    S2LPPktBasicSetPayloadLength(128);

  /* IRQ registers blanking */
  S2LPGpioIrqClearStatus();

  /* RX timeout config */
  //	S2LPTimerSetRxTimerUs(700000);

//  S2LPRefreshStatus();
  LOG("S2LP Status: ON:%d STATE:%d", g_xStatus.XO_ON, g_xStatus.MC_STATE);

  SetState(STATE_READY);
  StartRX();
}

RADIO_Result RADIO_Transmit(void* pData, uint8_t dataLen) {
  while (IsState(STATE_TX)) {
  }

  if (IsState(STATE_READY)) {
    AbortS2LP();
    WriteTxFifi(pData, dataLen);
    StartTX();
    return RADIO_OK;
  } else {
    return RADIO_ERR_STATE;
  }
}

void RADIO_Process() {

  //  if (STATE_TX == state && GetMessage(MSG_TX_DONE)) {
  //
  //  }

  if (GetMessage(MSG_RX_DATA)) {
    if (ReadRxFifo() == RADIO_OK) {
      if (init.receiveCallbackFn != NULL) {
        RADIO_Result r = init.receiveCallbackFn(rxDataBuf, rxDataLen);
        if (r == RADIO_INPROGRESS) {
          GetMessage(MSG_RX_DATA);
        }
      }
    }
    StartRX();
  }

  ProcessMessages();
}

void RADIO_GPIOCallback(/**S2LPGpioPin pin*/) {
  if (state == STATE_NONE) {
    return;
  }
  S2LPIrqs *pIrqs = GetIRQStatus();
  //  printIrqs("GPIOCallback", pIrqs);
  //  if (pin == S2LP_GPIO_0) {

  if (pIrqs->IRQ_TX_DATA_SENT && IsState(STATE_TX)) {
    //данные отправлены
    SendMessage(MSG_TX_DONE);
    //
    SetState(STATE_READY);
    StartRX();
  }

  if (pIrqs->IRQ_RX_DATA_READY) {
    //приняты данные
    SendMessage(MSG_RX_DATA);
  }
  //  }
}