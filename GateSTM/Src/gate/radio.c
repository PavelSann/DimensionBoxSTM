// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
#include "radio.h"
#include <stdint.h>
#include "xprint.h"
#include "MCU_Interface.h" //#include "MCU_Interface_template.h"
#include <stdbool.h>
#include "S2LP_Config.h"
#include "radio_opt.h"


#define PACKET_STACK 0
#define PACKET_BASE !PACKET_STACK
#define RADIO_WATCHDOG_CYCLES 10000
#define WAIT_SWITH_RADIO_STATE 0
#define RADIO_WATCHDOG_ENABLED 0
#define S2LP_FIFO_SIZE 128
/** Максимальный размер 1 пакета*/
#define RX_PACKET_MAX_SIZE S2LP_FIFO_SIZE
// должен соотвестоввать RADIO_MAX_PACKET_SIZE

/*Примерная задержка в микросекундах, одна итерация примерно 12 тактов, реальная задержка будет на 20-30% больше*/
#define DELAY_US(us)   {for (volatile uint32_t count=((SystemCoreClock/12000000)*(us)), i = 0; i < count; i++);}
#define SAFE_ENUM(TYPE,VAL) ((VAL)==(TYPE)0?VAL:VAL)

typedef enum {
  MSG_RX_DATA,
  MSG_RX_DATA_DISC,
  MSG_TX_DONE,
  MSG_TX_DATA_IN_BUFFER,
} Message;
#define MSG_OPT_MAX_MESSAGES 4
#define MSG_OPT_MSG_TYPE Message
#define MSG_OPT_SAFE_ENUM 1
#include "messages_helper.h"
#include "gate_packet.h"

typedef enum {
  STATE_NONE,
  STATE_READY,
  STATE_RX,
  STATE_TX,
} State;
static volatile State state = STATE_NONE;
#define IsState(s) ((s)==state)
#define SetState(s) (state=(s))

static uint8_t rxDataBuf[RX_PACKET_MAX_SIZE];
static uint16_t rxDataLen;
static RADIO_InitStruct init;
extern volatile S2LPStatus g_xStatus;
#define radioStatus g_xStatus
#define IsRadioState(radioStatus,MC_STATE_VAL) ((radioStatus).MC_STATE==MC_STATE_VAL)

static void WriteReg(uint8_t regAddress, uint8_t bufLen, uint8_t *pBuf) {
  radioStatus = S2LPSpiWriteRegisters(regAddress, bufLen, pBuf);
}

static void ReadReg(uint8_t regAddress, uint8_t bufLen, uint8_t *pBuf) {
  radioStatus = S2LPSpiReadRegisters(regAddress, bufLen, pBuf);
}

static void SendCommant(uint8_t commandCode) {
  //  assert_param(IS_S2LP_CMD(commandCode));
  assert_param(commandCode >= CMD_TX && commandCode <= CMD_SEQUENCE_UPDATE); //0x60-0x70
  radioStatus = S2LPSpiCommandStrobes(commandCode);
}

void RefreshStatus(void) {
  uint8_t tempRegValue;
  do {
    radioStatus = S2LPSpiReadRegisters(MC_STATE0_ADDR, 1, &tempRegValue);
  } while ((((uint8_t*) & radioStatus)[0]) != tempRegValue);
}

S2LPState GetRadioState() {

  /* stateReg
   * 7:1 STATE: Current state.
   * 0 XO_ON: 1: XO is operating.
   */

  struct {
    uint8_t XO_ON : 1; /*0-1 XO is operating state */
    S2LPState MC_STATE : 7; /*1-7 S2LPState */

  } stateReg;
  radioStatus = S2LPSpiReadRegisters(MC_STATE0_ADDR, 1, (uint8_t*) & stateReg);
  return stateReg.MC_STATE;
}

static void AbortRXTX() {
  S2LPGpioIrqConfig(RX_DATA_DISC, S_DISABLE);
  SendCommant(CMD_SABORT);
#if WAIT_SWITH_RADIO_STATE
  while (GetRadioState() != MC_STATE_READY) {
  }
#endif
  S2LPGpioIrqClearStatus();
  S2LPGpioIrqConfig(RX_DATA_DISC, S_ENABLE);
  SetState(STATE_READY);
}

static void StartTX() {
  if (IsState(STATE_READY)) {
    SetState(STATE_TX);
    SendCommant(CMD_TX);
#if WAIT_SWITH_RADIO_STATE
    while (GetRadioState() != MC_STATE_TX) {
    }
#endif
  } else {

    LOGERR("Bad state %d", state);
  }
}

static void StartRX() {

  if (IsState(STATE_READY)) {
    SetState(STATE_RX);
    SendCommant(CMD_RX);
#if WAIT_SWITH_RADIO_STATE
    while (GetRadioState() != MC_STATE_RX) {
    }
#endif
  } else {

    LOGERR("Bad state %d", state);
  }
}

static void PrintIrqs(const char* msg, S2LPIrqs *pxIrqs) {

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

static void PrintStatus(const char* msg) {

  RefreshStatus();
  LOG("%s", msg);
  LOG("STATUS "
      " XO_ON=0x%x\n"
      " MC_STATE=0x%x\n"
      " TX_FIFO_FULL=0x%x\n"
      " RX_FIFO_EMPTY=0x%x\n"
      " RCCAL_OK=0x%x\n"
      " ERROR_LOCK=0x%x\n"
      " ANT_SELECT=0x%x\n"
      " state=0x%x\n"
      ,
      radioStatus.XO_ON,
      radioStatus.MC_STATE,
      radioStatus.RX_FIFO_EMPTY,
      radioStatus.TX_FIFO_FULL,
      radioStatus.RCCAL_OK,
      radioStatus.ERROR_LOCK,
      radioStatus.ANT_SELECT,
      state
      );
}

static void WriteTxFifi(uint8_t* pTxBuffer, uint8_t cBuffer) {

  S2LPPktBasicSetPayloadLength(cBuffer);
  /*Clean the TX FIFO*/
  SendCommant(CMD_FLUSHTXFIFO);
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
  SendCommant(CMD_FLUSHRXFIFO);

  return RADIO_OK;
}

static inline void GetIRQStatus(S2LPIrqs *irqStatus) {

  /* Get the IRQ status */
  S2LPGpioIrqGetStatus(irqStatus);
}
#if PACKET_BASE

void InitPacket() {

  PktBasicInit basicInit = {
    .xPreambleLength = PREAMBLE_LENGTH,
    .xSyncLength = SYNC_LENGTH,
    .lSyncWords = SYNC_WORD,
    .xFixVarLength = VARIABLE_LENGTH,
    .cExtendedPktLenField = EXTENDED_LENGTH_FIELD,
    .xCrcMode = CRC_MODE,
    .xAddressField = EN_ADDRESS,
    .xFec = EN_FEC,
    .xDataWhitening = EN_WHITENING
  };
  S2LPPktBasicInit(&basicInit);
  /* Дальше настраиваем работу с адресом. S2LPPktBasicAddressesInit не работает, делаем вручную.
   * При отправке пакета, в поле адрес пишется значение RX_SOURCE_ADDR регистра PCKT_FLT_GOALS3_ADDR
   * При получении пакета, значение из поля адреса сравнивается со значением TX_SOURCE_ADDR из регитсра PCKT_FLT_GOALS0_ADDR
   * В регистре PCKT_FLT_OPTIONS_ADDR нужно поднять флаг DEST_VS_SOURCE_ADDR чтобы модуль фильтровал пакеты по адресу
   */
  uint8_t tmp;
  //включаем фильтр по адресу
  ReadReg(PCKT_FLT_OPTIONS_ADDR, 1, &tmp);
  tmp |= DEST_VS_SOURCE_ADDR_REGMASK;
  WriteReg(PCKT_FLT_OPTIONS_ADDR, 1, &tmp);
  //устанавливаем свой адрес в PCKT_FLT_GOALS0_ADDR(TX_SOURCE_ADDR)
  tmp = RADIO_ADDRESS(init.devID);
  WriteReg(PCKT_FLT_GOALS0_ADDR, 1, &tmp);
}
#endif
#if PACKET_STACK

void InitPacket() {

}
#endif

static void SetDestAddress(uint8_t address) {

  S2LPSetRxSourceReferenceAddress(address);
}

static void SendRadioPacket(DeviceID destAddr, void* pData, uint8_t dataLen, bool addHeader) {
  if( (dataLen+(addHeader?RADIO_PACKET_HEADER_SIZE:0))>RX_PACKET_MAX_SIZE ){
    LOGERR("Data size is larger than the buffer size");
    return;
  }

  //очищаем буфер
  SendCommant(CMD_FLUSHTXFIFO);
  uint16_t payloadLen = dataLen;
  if (addHeader) {

    RADIO_PacketHeader header = {
      .src = init.devID,
      .dest = destAddr
    };
    //пишем в буфер заголовок пакета
    S2LPSpiWriteFifo(RADIO_PACKET_HEADER_SIZE, (uint8_t *) & header);
    payloadLen += RADIO_PACKET_HEADER_SIZE;
  }

  // и тело пакета
  S2LPSpiWriteFifo(dataLen, pData);

  //устанавливаем параметры пакета S2LP
  S2LPPktBasicSetPayloadLength(payloadLen);
  SetDestAddress(RADIO_ADDRESS(destAddr));
  //прерываем приём и запускаем передачу
  AbortRXTX();
  StartTX();
}

static inline void WaitTX() {
  while (IsState(STATE_TX)) {
  }
}

static void RadioWatchdog() {
#if RADIO_WATCHDOG_ENABLED
  static uint32_t cucles = 0;
  cucles++;
  if (cucles > RADIO_WATCHDOG_CYCLES) {
    cucles = 0;
    /*
     * ловим ситуацию, когда по какой то причине радио модуль вышел из режима приёма,
     * и не вызвал прерывание, которое мы обрабатываем
     */
    if (IsState(STATE_RX)) {
      S2LPState radioState = GetRadioState();
      if (IsState(STATE_RX) && radioState != MC_STATE_RX) {
        //если по какой то причине прекратился приём данных, запускаем снова

        LOGERR("Bad states. Radio not RX state. sate:0x%x radioState:0x%x", state, radioStatus.MC_STATE);
        SetState(STATE_READY);
        StartRX();
      }
    }

  }
#endif
}

void RADIO_Init(RADIO_InitStruct *pInit) {

  init = *pInit;
  LOG("Init S2LP...");

  SdkEvalEnterShutdown();
  SdkEvalExitShutdown();
  DELAY_US(1000);

  SGpioInit gpio0IRQ = {
    S2LP_GPIO_0,
    S2LP_GPIO_MODE_DIGITAL_OUTPUT_LP,
    S2LP_GPIO_DIG_OUT_IRQ
  };
  /* S2LP IRQ config */
  S2LPGpioInit(&gpio0IRQ);

  SRadioInit radioInit = {
    BASE_FREQUENCY,
    MODULATION_SELECT,
    DATARATE,
    FREQ_DEVIATION,
    BANDWIDTH
  };
  /* S2LP Radio config */
  S2LPRadioInit(&radioInit);

  /* S2LP Radio set power */
  S2LPRadioSetMaxPALevel(S_ENABLE); //выбираем максимальную мощность 14dBm
  //S2LPRadioSetPALeveldBm(7, POWER_DBM);// задаём 7 уровень мощности
  //S2LPRadioSetPALevelMaxIndex(7);// выбираем 7 уровень мощности
  S2LPRadioSetRssiThreshdBm(RSSI_THREHSOLD_DBM);

  InitPacket();

  /* S2LP IRQs enable */
  S2LPIrqs irqInit = {0};
  irqInit.IRQ_TX_DATA_SENT = S_SET;
  irqInit.IRQ_RX_DATA_READY = S_SET;
  irqInit.IRQ_RX_DATA_DISC = S_SET;

  //  irqInit.IRQ_READY = S_ENABLE;
  //  irqInit.IRQ_RX_FIFO_ERROR = S_ENABLE;
  //  irqInit.IRQ_TX_FIFO_ERROR = S_ENABLE;
  //  irqInit.IRQ_CRC_ERROR= S_ENABLE;
  S2LPGpioIrqInit(&irqInit);


  /* IRQ registers blanking */
  S2LPGpioIrqClearStatus();
  //  S2LPRefreshStatus();
  LOG("S2LP Status: ON:%d STATE:%d", radioStatus.XO_ON, radioStatus.MC_STATE);

  SetState(STATE_READY);
  StartRX();
}

RADIO_Result RADIO_Transmit(DeviceID destID, void* pData, uint8_t dataLen) {
  WaitTX();

  if (IsState(STATE_READY) || IsState(STATE_RX)) {
    SendRadioPacket(destID, pData, dataLen, true);

    return RADIO_OK;
  } else {

    return RADIO_ERR_STATE;
  }
}

RADIO_Result RADIO_TransmitPacket(RADIO_PacketHeader *pRHead, uint8_t packetLen) {
  WaitTX();

  if (IsState(STATE_READY) || IsState(STATE_RX)) {
    SendRadioPacket(pRHead->dest, pRHead, packetLen, false);
    return RADIO_OK;
  } else {

    return RADIO_ERR_STATE;
  }
}

bool RADIO_IsReceive() {

  return IsState(STATE_RX);
}

bool RADIO_IsTransmit() {

  return IsState(STATE_TX);
}

void RADIO_Process() {

  if (IsState(STATE_READY)) {

    if (GetMessage(MSG_RX_DATA)) {
      if (ReadRxFifo() == RADIO_OK) {
        //входящий пакет прочитан, обрабатываем заголовок
        RADIO_PacketHeader *header = (RADIO_PacketHeader *) rxDataBuf;
        if (header->dest == init.devID) {
          if (init.receiveCallbackFn != NULL) {
            void *pData = (rxDataBuf + RADIO_PACKET_HEADER_SIZE);
            uint16_t dataLen = rxDataLen - RADIO_PACKET_HEADER_SIZE;
            init.receiveCallbackFn(header, pData, dataLen);
            //если в калбеке вызвали Transmit придётся подождать
            WaitTX();
          }
        } else {
          LOG("Bad packet destination address %x", header->dest);
        }
      }
      StartRX();
    }

    if (GetMessage(MSG_TX_DONE)) {
      //пакет был отправлен, запускаем приём
      StartRX();
    }

    if (GetMessage(MSG_RX_DATA_DISC)) {
      //пакет был отфильтрован, модуль прекратил приём, запускаем приём

      StartRX();
    }

  }

  RadioWatchdog();
  ProcessMessages();
}

void RADIO_IRQCallback() {
  if (IsState(STATE_NONE)) {
    return;
  }
  S2LPIrqs pIrqs;
  GetIRQStatus(&pIrqs);
  //    printIrqs("GPIOCallback", pIrqs);

  if (pIrqs.IRQ_RX_DATA_READY) {
    //приняты данные
    if (!IsState(STATE_RX)) {
      LOGERR("Bad state 0x%x", state);
    }
    SendMessage(MSG_RX_DATA);
    SetState(STATE_READY);
  }

  if (pIrqs.IRQ_TX_DATA_SENT) {
    //данные отправлены
    if (!IsState(STATE_TX)) {
      LOGERR("Bad state 0x%x", state);
    }
    SendMessage(MSG_TX_DONE);
    SetState(STATE_READY);
  }

  if (pIrqs.IRQ_RX_DATA_DISC) {
    //пакет был отфильтрован
    SetState(STATE_READY);
    SendMessage(MSG_RX_DATA_DISC);
  }
}