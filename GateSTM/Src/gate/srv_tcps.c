// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include <assert.h>
#include <stdbool.h>
#include <string.h>
#include <locale.h>

#include "srv_tcps.h"
#include "xprint.h"
#include "lwip.h"
//#include "debug.h"
#include "netif.h"
#include "tcp.h"
#include "dns.h"


#if BYTE_ORDER != BIG_ENDIAN
/** Set an IP address given by the four byte-parts. Little-endian version that prevents the use of lwip_htonl. */
#define IP_ADDR(a,b,c,d) ((ip_addr_t){(((u32_t)((d) & 0xff) << 24) | ((u32_t)((c) & 0xff) << 16) | ((u32_t)((b) & 0xff) << 8)  | (u32_t)((a) & 0xff))})
#endif

#define IS_IP_ADDR_EMPTY(pIP) ((pIP)->addr==0)

#define LOGIP(msg,pIP) LOG((msg " IP:%d.%d.%d.%d"), ip4_addr1(pIP), ip4_addr2(pIP), ip4_addr3(pIP), ip4_addr4(pIP));

/**
 * Выполняет проверку типа enum, перед вызовом функции
 * работает с -Wall или -Wenum-compare
 * TYPE: тип enum
 * VAL: проверяемое значение
 * void enumFunction(ENUM val)
 * #define enumFunction(val) enumFunction(SAFE_ENUM(ENUM, val))
 * {...}
 */
#define SAFE_ENUM(TYPE, VAL) ((VAL) == (TYPE)0 ? (VAL) : (VAL))

#define TO_STR(val) #val

/*
 * Параметры подключения к серверу
 */
#define SRV_SERVER_RESERV_IP IP_ADDR(192, 168, 1, 10)
#define SRV_SERVER_PORT 8888
#define SRV_WATCHDOG_TIME (30*2)
#define USE_DNS_SERVER false
#define SRV_SERVER_NAME TO_STR(is.meterage72.ru)
#define SRV_DNS_SERVERS  IP_ADDR(8, 8, 8, 8) /*Google*/, IP_ADDR(77, 88, 8, 8)/*Yandex*/
#define SRV_GATE_ID ((uint32_t)42)
#define SRV_MAX_SESSION_KEY_LN 128
#define SRV_SECURITY_KEY {1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4}
//#define SRV_SECURITY_KEY {0}

/*
 * Состояния сессии связи
 */
typedef enum {
  STATE_NONE = 0,
  STATE_INIT,
  STATE_DNS_LOOKUP,
  STATE_CONNECTION_IP,
  STATE_HANDSHAKING,
  STATE_CONNECTED
} State;

/*
 * Статус подключения к DNS серверу
 */
typedef enum {
  DNS_STATE_NONE,
  DNS_STATE_INPROGRESS,
  DNS_STATE_LOOKUP_OK,
  DNS_STATE_ERROR
} DNSState;

struct netif *pNetif;

/* 
 * Сессия связи с сервером
 */
typedef struct {
  struct tcp_pcb *pcb;
  State state;
  ip_addr_t ipAddr;
  uint16_t port; //8888
  /*таймер, для аварийного закрытия соединения*/
  uint16_t watchdog;
  /*Имя сервера, для получения ip через dns*/
  char *serverName;
  DNSState dnsState;
  /*данные по ключу шифрования по TCP*/
  uint8_t *key;
  uint16_t keyLn;
  /*указатель на первый сегмент текущего пакета*/
  struct pbuf *packetBuf;
  /*Буфер под собранный и расшифрованный пакет, приём данных*/
  uint8_t rxPacket[SRV_MAX_PACKET_SIZE];
  uint16_t rxLength;
  /*Буфер под с пакет, для отправки данных*/
  uint8_t txPacket[SRV_MAX_PACKET_SIZE];
  uint16_t txLength;
  /*последний номер пакета*/
  uint8_t lastSeqNumber;

} Session;
/*Инициализация ВСЕХ полей структуры */
#define INIT_SESSION(pSes) {\
pSes->pcb = NULL;\
pSes->state = STATE_NONE;\
pSes->ipAddr.addr=0;\
pSes->port=SRV_SERVER_PORT;\
pSes->watchdog=SRV_WATCHDOG_TIME;\
pSes->dnsState = DNS_STATE_NONE;\
pSes->serverName = NULL;\
pSes->key=NULL;\
pSes->keyLn=0;\
pSes->packetBuf=NULL;\
pSes->lastSeqNumber=0;\
}
#define RESET_WATCHDOG(pSession) ((pSession)->watchdog=SRV_WATCHDOG_TIME)
/*Возвращает указатель на заголовок пакета*/
#define PACK_HEADER_LEN (sizeof(SRV_PacketHeader))
#define PACK_HEADER(pPacket) ((SRV_PacketHeader *)(pPacket))
#define PACK_PAYLOAD(pPacket) ((void *)((uint8_t *)(pPacket))+ PACK_HEADER_LEN)
#define PACK_FULL_LENGTH(pPacket) ( (PACK_HEADER(pPacket))->payloadLength + PACK_HEADER_LEN)
/*Указатель на текущую сессию, при работе с одной сессией*/
Session *currentSession;


static void connectionIP(Session *session);

static void setState(Session *session, State newState)
#define setState(session,newState) setState(session,SAFE_ENUM(State, newState))
{
  State oldState = session->state;
  session->state = newState;
  LOG("Set state: %d->%d", oldState, newState);
}

static Session *newSession() {
  Session* session = mem_malloc(sizeof (Session));
  if (session != NULL) {
    INIT_SESSION(session);
#if USE_DNS_SERVER
    session->serverName = SRV_SERVER_NAME;
#endif
    currentSession = session;
  }
  return session;
}

static void freeSession(Session *session) {
  mem_free(session);
  currentSession = NULL;
}

static void dnsCallback(const char *name, const ip_addr_t *ipaddr, void *callback_arg) {
  Session *session = callback_arg;
  if (ipaddr == NULL) {
    session->dnsState = DNS_STATE_ERROR;
    return;
  }
  session->ipAddr = *ipaddr;
  session->dnsState = DNS_STATE_LOOKUP_OK;

  connectionIP(session);
}

static void connect(Session *session) {
  if (session->serverName != NULL) {
    setState(session, STATE_DNS_LOOKUP);
    err_t err = dns_gethostbyname(session->serverName, &(session->ipAddr), dnsCallback, session);
    if (err == ERR_INPROGRESS) {
      session->dnsState = DNS_STATE_INPROGRESS;
      //будем ждать вызова dnsCallback, выходим чтобы не вызвать connectionIP
      return;
    } else if (err == ERR_OK) {
      //ip адрес взять из кэша и записан в session->ipAddr
      session->dnsState = DNS_STATE_LOOKUP_OK;
    } else {
      //LOG("Dns error code:%d", err);
      session->dnsState = DNS_STATE_ERROR;
    }
  }

  if (IS_IP_ADDR_EMPTY(&(session->ipAddr))) {
    // если не заполнено serverName или ошибка dns
    session->ipAddr = SRV_SERVER_RESERV_IP;
  }
  // подключаемся к серверу по ip
  connectionIP(session);
}

static uint32_t calcCRC(Session *session, void *data, uint16_t len) {
  // crc((sessionKey|key)+data)
  return 0x0;
}

/*Симетричное шифрование, XOR*/
static void crypt(void *buf, uint16_t bufLen, const uint8_t *key, uint16_t keyLen) {
  //вероятно можно ускорить за счёт обработки по словам
  uint8_t *data = (uint8_t *) buf;
  for (int dI = 0, kI = 0; dI < bufLen; dI++, kI++) {
    if (kI == keyLen) {
      kI = 0;
    }
    data[dI] ^= key[kI];
  }
}

static void cryptSession(Session *session, void *buf, uint16_t bufLen) {
  if (session->key == NULL) {
    const uint8_t securityKey[] = SRV_SECURITY_KEY;
    crypt(buf, bufLen, securityKey, sizeof (securityKey));
  } else {
    crypt(buf, bufLen, session->key, session->keyLn);
  }
}

static err_t sendData(Session *session, const void *pData, uint16_t len, bool copyData) {
  uint8_t flags = copyData ? TCP_WRITE_FLAG_COPY : 0;
  err_t err = tcp_write(session->pcb, pData, len, flags);
  if (err != ERR_OK) {
    return err;
  }
  return tcp_output(session->pcb);
}

static err_t sendPacket(Session *session, SRV_PacketType type, void *pData, uint16_t dataLen) {
  if (dataLen > SRV_MAX_PAYLOAD_SIZE) {
    return ERR_MEM;
  }
  uint8_t nextSeqNumber = session->lastSeqNumber;
  if (nextSeqNumber < 0xFF) {
    nextSeqNumber++;
  } else {
    nextSeqNumber = 0;
  }

  uint8_t *txPack = session->txPacket;
  SRV_PacketHeader *header = PACK_HEADER(txPack);
  header->crc = 0;
  header->type = type;
  header->sequenceNumber = nextSeqNumber;
  header->payloadLength = dataLen;
  void *txPayload = PACK_PAYLOAD(txPack);
  if (pData != NULL && dataLen > 0) {
    MEMCPY(txPayload, pData, dataLen);
    cryptSession(session, txPayload, dataLen);

  }
  uint16_t fullSize = dataLen + PACK_HEADER_LEN;
  session->txLength = fullSize;
  uint32_t crc = calcCRC(session, txPack, fullSize);
  header->crc = crc;

  err_t err = sendData(session, txPack, fullSize, false);
  if (err != ERR_OK) {
    return err;
  }

  session->lastSeqNumber = nextSeqNumber;
  return ERR_OK;
}

static void sendAsk(Session *session, uint8_t code) {
  uint8_t bufCode = code;
  sendPacket(session, SRV_PACKET_TYPE_ASK, &bufCode, 1);
}

static void closeConnection(Session *session) {
  tcp_recv(session->pcb, NULL);
  tcp_sent(session->pcb, NULL);
  tcp_poll(session->pcb, NULL, 0);
  tcp_err(session->pcb, NULL);

  tcp_close(session->pcb);
  freeSession(session);
  setState(session, STATE_INIT);
}

static void startHandshaking(Session *session) {
  setState(session, STATE_HANDSHAKING);
  //отправляем пакет с ID шлюза
  uint32_t gateId = SRV_GATE_ID;
  sendPacket(session, SRV_PACKET_TYPE_HANDSHAKING, &gateId, sizeof (gateId));
}

static err_t processHandshaking(Session *session, const SRV_PacketHeader *pHead, const uint8_t *payload) {
  //от сервера мы получили сессионный ключ шифрования
  uint16_t ln = pHead->payloadLength;
  uint8_t *key = mem_malloc(ln);
  if (key == NULL) {
    return ERR_MEM;
  }
  MEMCPY(key, payload, ln);
  session->key = key;
  session->keyLn = ln;
  setState(session, STATE_CONNECTED);
  return ERR_OK;
}

static err_t processPacket(Session *session) {
  uint8_t * pPack = session->rxPacket;
  SRV_PacketHeader * pHead = PACK_HEADER(pPack);
  SRV_PacketType type = pHead->type;
  uint8_t *payload = PACK_PAYLOAD(pPack);

  if (session->state == STATE_HANDSHAKING) {
    if (type == SRV_PACKET_TYPE_HANDSHAKING) {
      return processHandshaking(session, pHead, payload);
    } else {
      LOG("Handshaking: Invalid packet type %d", type);
      return ERR_ARG;
    }
  }

  err_t err = ERR_OK;
  switch (type) {
    case SRV_PACKET_TYPE_PING:
      //нечего не делаем, вернётся просто  ask
      break;

    case SRV_PACKET_TYPE_STR:
      //выводим строку из пакета

      LOG("Packet str: %s", payload);
      break;

    default:
      LOG("Unsupport packet type %n", type);
      err = ERR_ARG;
      break;

  }
  return err;
}

/**
 * Обрабатываем TCP сегмент, если пакет состоит из нескольких сигментов, то собираем пакет
 * @param session
 * @param p
 * @return 
 */
static err_t processSegment(Session *session, struct pbuf *p) {
  if (session->packetBuf == NULL) {
    //в обработке нет пакета, значит это первый сигмент пакета
    SRV_PacketHeader *header = p->payload;
    SRV_PacketType type = header->type;
    uint8_t nextSeqNum = (session->lastSeqNumber) + 1;
    if (header->sequenceNumber != nextSeqNum) {
      LOG("Illegal sequence number, header:%d session:%d ", header->sequenceNumber, session->lastSeqNumber);
      return ERR_ARG;
    }
    //    if(type){
    //      //сделать проверку корректности типа пакета
    //    }
    //если длинна пакета превышает норму, обрабатывать не будем
    if (header->payloadLength > SRV_MAX_PAYLOAD_SIZE) {
      LOG("Packet is long payloadLength=%d ", header->payloadLength);
      return ERR_MEM;
    }
    session->packetBuf = p;
  } else {
    //если уже идёт приём пакета, то присоединяем сегмент к нему
    pbuf_cat(session->packetBuf, p);
  }

  {
    struct pbuf * const packBuf = session->packetBuf;
    //общее количество байт, которое нужно принять значение payloadLength из заголовка пакета + длинна заголовка
    uint16_t fullLength = PACK_FULL_LENGTH(packBuf->payload);

    if (packBuf->tot_len < fullLength) {
      //если получили ещё не весь пакет, будем ждать следующий сегмент
      return ERR_INPROGRESS;
    }


    if (packBuf->tot_len > fullLength) {
      //принято больше байт чем длина пакета, значит отправитель склеил TCP пакеты
      //такого не должно быть, пакет будет обрезан, данные потеряны
      uint16_t countBuf = pbuf_clen(packBuf);
      LOG("Packet trash tot_len=%d packetLen=%d countBuf=%d", packBuf->tot_len, fullLength, countBuf);
    }

    //собираем пакет из TCP сегментов в один буфер
    pbuf_copy_partial(packBuf, session->rxPacket, fullLength, 0);
    session->rxLength = fullLength;
  }

  uint8_t * const pPack = session->rxPacket;
  SRV_PacketHeader * const pHead = PACK_HEADER(pPack);
  uint8_t * const payload = PACK_PAYLOAD(pPack);

  //расшифровываем содержимое пакета
  cryptSession(session, payload, pHead->payloadLength);

  //рассчитываем и проверяем CRC
  uint32_t crc = calcCRC(session, session->rxPacket, session->rxLength);
  if (crc != pHead->crc) {
    LOG("Invalid CRC: head:%x calc:%x", pHead->crc, crc);
    return ERR_ARG;
  }

  session->lastSeqNumber = pHead->sequenceNumber;
  LOG("Process packet type=%d sequenceNumber=%d fullLength=%d", pHead->type, pHead->sequenceNumber, session->rxLength);
  return processPacket(session);
}

/**
 * Function  tcp receive callback functions.
 * Called when data has been received.
 *
 * @param arg Additional argument to pass to the callback function (@see tcp_arg())
 * @param tpcb The connection pcb which received data
 * @param p The received data (or NULL when the connection has been closed!)
 * @param err An error code if there has been an error receiving
 *            Only return ERR_ABRT if you have called tcp_abort from within the
 *            callback function!
 */
static err_t receiveCallback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err) {
  Session *session = arg;
  if (p == NULL) {
    //соединение было закрыто, возможно нужно вызвать closeConnection()
    return err;
  }
  if (err != ERR_OK) {
    LOG("TCP receive error %d", err);
    // произошла ошибка, освобождаем буфер
    //    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    return err;
  }

  if (session->state == STATE_HANDSHAKING || session->state == STATE_CONNECTED) {
    //сбрасываем сторожевой таймер сессии
    RESET_WATCHDOG(session);

    //дальше запускаем обработчики пакетов
    err_t result = processSegment(session, p);
    if (result != ERR_INPROGRESS) {
      tcp_recved(tpcb, session->packetBuf->tot_len);
      pbuf_free(session->packetBuf);
      session->packetBuf = NULL;
      sendAsk(session, result);
    }
  }

  return ERR_OK;
}

static err_t sentCallback(void *arg, struct tcp_pcb *tpcb, u16_t len) {
  Session *session = arg;
  LWIP_UNUSED_ARG(session);
  //данные были отправлены, можно отправлять следующие данные
  //  sendMessage(MSG_DATA_SEND);
  return ERR_OK;
}

static err_t pollCallback(void *arg, struct tcp_pcb *tpcb) {
  Session *session = arg;

  //Сторожевой таймер соединения
  session->watchdog--;
  if (session->watchdog <= 0) {
    LOG("Session watchdog: close connection");
    closeConnection(session);
  }

  //ещё нужно мониторить свободную память в mem_ и незаконченный разбор пакета
  return ERR_OK;
}

static void errorCallback(void *arg, err_t err) {
  Session *session = arg;
  LWIP_UNUSED_ARG(session);
  LOG("TCP connection error %d", err);
  if (ERR_IS_FATAL(err)) {
    //
    LOG("TCP fatal error, close connection");
    closeConnection(session);
  }
}

static err_t connectedCallback(void *arg, struct tcp_pcb *tpcb, err_t err) {
  LWIP_UNUSED_ARG(err); //An unused error code, always ERR_OK currently
  Session *session = arg;

  tcp_recv(session->pcb, receiveCallback);
  tcp_sent(session->pcb, sentCallback);
  tcp_poll(session->pcb, pollCallback, 1);
  tcp_err(session->pcb, errorCallback);

  //запускаем рукопожатие с сервером
  startHandshaking(session);

  return ERR_OK;
}

/**
 * Ошибка при ПОДКЛЮЧЕНИИ к серверу
 * Ошибки в уже установленном соединении обрабатывает другая функция
 */
static void connectionErrorCallback(void *arg, err_t err) {
  Session *session = arg;
  LWIP_UNUSED_ARG(session);

  LOG("TCP connection error %d", err);
  //не удалось подключится к серверу, можно попробовать другой IP или закрыть соединение
  closeConnection(session);
}

static void connectionIP(Session *session) {
  setState(session, STATE_CONNECTION_IP);

  if (session->pcb != NULL) {
    //повторное подключение, например при обрыве связи
    tcp_close(session->pcb);
  }

  struct tcp_pcb *pcb = tcp_new();
  session->pcb = pcb;

  tcp_err(pcb, connectionErrorCallback);
  tcp_arg(pcb, session);
  LOGIP("TCP connect ", &(session->ipAddr));

  err_t err = tcp_connect(pcb, &(session->ipAddr), session->port, connectedCallback);
  if (err != ERR_OK) {
    connectionErrorCallback(session, err);
  }

}

void TCPS_Init(struct netif *pNetIf) {
  static const ip_addr_t dnsServers[DNS_MAX_SERVERS] = {SRV_DNS_SERVERS};
  //Инициализация списка DNS серверов
  for (int i = 0; i < DNS_MAX_SERVERS; i++) {
    dns_setserver(i, &dnsServers[i]);
  }
  dns_init();
  pNetif = pNetIf;
}

TCPSError TCPS_StartSession() {
  if (!netif_is_link_up(pNetif)) {
    return TCPS_ERR_NOT_LINK_UP;
  }
  if (!dhcp_supplied_address(pNetif)) {
    return TCPS_ERR_DHCP_SUPPLIED_IP;
  }
  //  if (netif_is_up(pNetif)) {
  //    return TCPS_ERR_NOT_UP;
  //  }

  //нужно ещё проверять прошла ли регистрация в сети
  if (currentSession == NULL) {
    Session *session = newSession();
    if (session == NULL) {
      return TCPS_ERR_MEM;
    }
    connect(session);
    return TCPS_ERR_INPROGRESS;
  } else {
    return TCPS_ERR_OPERATION;
  }
}

void TCPS_Process() {
  MX_LWIP_Process();
}






