// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include <assert.h>
#include <stdbool.h>
#include <string.h>
#include <locale.h>

#include "tcps.h"
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

#define TO_STR_(exp)   #exp
#define TO_STR(exp)    TO_STR_(exp)

/*
 * Параметры подключения к серверу
 */
#define SRV_SERVER_RESERV_IP IP_ADDR(192, 168, 1, 10)
#define SRV_SERVER_PORT 8888
#define SRV_WATCHDOG_TIME (30*2)
#define USE_DNS_SERVER false
#define SRV_SERVER_NAME "is.meterage72.ru"
#define SRV_DNS_SERVERS  IP_ADDR(8, 8, 8, 8) /*Google*/, IP_ADDR(77, 88, 8, 8)/*Yandex*/
#define SRV_GATE_ID ((uint32_t)42)
#define SRV_MAX_SESSION_KEY_LN 128
#define SRV_SECURITY_KEY {1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4}
//#define SRV_SECURITY_KEY {0}

/*
 * Состояния сессии связи
 */
typedef enum {
  STATE_INIT = 0,
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

/**
 *Пакеты предназначенные к отправке
 */
typedef struct PackNode {
  struct PackNode *prev;
  /*Указатель на сам пакет, сейчас используется для удобства*/
  SRV_PacketHeader *packet;
} PackNode;

/**Указатель на последний  пакет в списке пакетов, для отправки*/
PackNode *pSendPacketList;
/*Длинна заголовка PackNode*/
#define PACK_NODE_SIZE sizeof(PackNode)
/*Указатель на SRV_PacketHeader который идёт после SendPackHeader*/
#define PACK_NODE_PACKET_HEADER(sendPackHead) ((SRV_PacketHeader *) (((uint8_t *)(sendPackHead))+PACK_NODE_SIZE) )
/*Пакет уже отправленн, ждём ACK*/
#define SEND_PACK_IS_IN_PROGRESS(sendPackHead) ((sendPackHead)->packet->crc != 0)

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
  /*последний номер пакета*/
  uint8_t lastSeqNumber;
  /*Количество отправленных байт*/
  uint16_t sentBytes;
  /*Количество подтверждённых байт*/
  uint16_t ackedBytes;

} Session;
/*Инициализация ВСЕХ полей структуры */
#define INIT_SESSION(pSes) {\
pSes->pcb = NULL;\
pSes->state = STATE_INIT;\
pSes->ipAddr.addr=0;\
pSes->port=SRV_SERVER_PORT;\
pSes->watchdog=SRV_WATCHDOG_TIME;\
pSes->dnsState = DNS_STATE_NONE;\
pSes->serverName = NULL;\
pSes->key=NULL;\
pSes->keyLn=0;\
pSes->packetBuf=NULL;\
pSes->lastSeqNumber=0;\
pSes->sentBytes=0;\
pSes->ackedBytes=0;\
}
#define RESET_WATCHDOG(pSession) ((pSession)->watchdog=SRV_WATCHDOG_TIME)
/*Длинна заголовка*/
#define PACK_HEADER_LEN (sizeof(SRV_PacketHeader))
/*Возвращает указатель на заголовок пакета*/
#define PACK_HEADER(pPacket) ((SRV_PacketHeader *)(pPacket))
/*Указатель на данные в пакете, которые находятся после заголовка*/
#define PACK_PAYLOAD(pPacket) ((void *)((uint8_t *)(pPacket))+ PACK_HEADER_LEN)
/*Полный размер пакета, заголовок + данные */
#define PACK_FULL_LENGTH(pPacket) ( (PACK_HEADER(pPacket))->payloadLength + PACK_HEADER_LEN)
/*Указатель на текущую сессию, при работе с одной сессией*/
static Session *currentSession;
/*Ключ безопасности*/
static const uint8_t securityKey[] = SRV_SECURITY_KEY;


static void connectionIP(Session *session);

static void setState(Session *session, State newState)
#define setState(session,newState) setState(session,SAFE_ENUM(State, newState))
{
  State oldState = session->state;
  session->state = newState;
  LOG("Set state: %d->%d", oldState, newState);
}

static err_t cathError(err_t e, char *msg) {
  LOG("Error %d %s", e, msg);
  return e;
}
#define FILE __FILE__
#define ERR(e) cathError(e,FILE ":" TO_STR(__LINE__))

static Session *newSession() {
  Session* session = mem_malloc(sizeof (Session));
  if (session != NULL) {
    INIT_SESSION(session);
#if USE_DNS_SERVER
    session->serverName = SRV_SERVER_NAME;
#endif
  }
  return session;
}

static void freeSession(Session *session) {
  if (session->packetBuf != NULL) {
    mem_free(session->packetBuf);
    session->packetBuf = NULL;

  }

  mem_free(session);
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

static uint32_t calcCRC(const void *pData, uint16_t count, bool reset) {
#ifndef CRC
#error "Not define CRC"
#endif
  //в методе используется __RBIT для получения "стандартной" CRC32, у STM есть отличия в реализации

  uint32_t crc;
  uint32_t *pData32 = (uint32_t*) pData;
  uint16_t count32 = count >> 2;
  if (reset) {
    CRC->CR = CRC_CR_RESET;
  }

  while (count32--) {
    CRC->DR = __RBIT(*pData32++);
  }

  crc = __RBIT(CRC->DR);
  count = count % 4;
  if (count) {
    CRC->DR = __RBIT(crc);
    switch (count) {
      case 1:
        CRC->DR = __RBIT((*pData32 & 0x000000FF) ^ crc) >> 24;
        crc = (crc >> 8) ^ __RBIT(CRC->DR);
        break;
      case 2:
        CRC->DR = (__RBIT((*pData32 & 0x0000FFFF) ^ crc) >> 16);
        crc = (crc >> 16) ^ __RBIT(CRC->DR);
        break;
      case 3:
        CRC->DR = __RBIT((*pData32 & 0x00FFFFFF) ^ crc) >> 8;
        crc = (crc >> 24) ^ __RBIT(CRC->DR);
        break;
    }
  }

  return ~crc;
}

static uint32_t calcSessionCRC(const Session *session, const void *pData, uint16_t count) {
  calcCRC(securityKey, sizeof (securityKey), true);
  calcCRC(pData, count, false);
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
    crypt(buf, bufLen, securityKey, sizeof (securityKey));
  } else {
    crypt(buf, bufLen, session->key, session->keyLn);
  }
}

static err_t sendPacket(Session *session, SRV_PacketHeader *pPack, bool copy) {

  //генерируем новый номер пакета
  uint8_t nextSeqNumber = session->lastSeqNumber;
  if (nextSeqNumber < 0xFF) {
    nextSeqNumber++;
  } else {
    nextSeqNumber = 0;
  }

  // заполняем поля заголовка
  SRV_PacketHeader *header = pPack;
  header->crc = 0;
  header->sequenceNumber = nextSeqNumber;

  //рассчитываем CRC
  uint32_t fullPackLen = PACK_FULL_LENGTH(header);
  uint32_t crc = calcSessionCRC(session, header, fullPackLen);
  header->crc = crc;

  //шифруем содержимое пакета
  if (header->payloadLength > 0) {
    cryptSession(session, PACK_PAYLOAD(header), header->payloadLength);
  }

  //отправляем пакет
  uint8_t flag = copy ? TCP_WRITE_FLAG_COPY : 0;
  err_t err = tcp_write(session->pcb, header, fullPackLen, flag);
  if (err != ERR_OK) {
    return ERR(err);
  }
  err = tcp_output(session->pcb);
  if (err != ERR_OK) {
    return ERR(err);
  }
  session->sentBytes += fullPackLen;
  session->lastSeqNumber = nextSeqNumber;
  return ERR_OK;
}

static inline void createPacket(void *packBuff, SRV_PacketType type, void *pData, uint16_t dataLen) {
  //далее формируем заголовок пакета, копируем данные в буфер
  SRV_PacketHeader *header = packBuff;
  header->type = type;
  header->crc = 0;
  header->sequenceNumber = 0;
  header->payloadLength = dataLen;
  void *txPayload = PACK_PAYLOAD(header);
  if (pData != NULL && dataLen > 0) {
    MEMCPY(txPayload, pData, dataLen);
  }
}

static err_t sendPacketNow(Session *session, SRV_PacketType type, void *pData, uint16_t dataLen) {
  if (dataLen > SRV_MAX_PAYLOAD_SIZE) {
    return ERR(ERR_MEM);
  }
  uint32_t buffSize = PACK_HEADER_LEN + dataLen;
  uint8_t buff[buffSize];
  createPacket(&buff, type, pData, dataLen);
  sendPacket(session, (SRV_PacketHeader *) buff, true);
  return ERR_OK;
}

static err_t sendNextPacket(Session *session) {

  //проверяем есть ли пакеты в списке
  if (NULL == pSendPacketList) {
    return ERR_OK;
  }

  if (SEND_PACK_IS_IN_PROGRESS(pSendPacketList)) {
    //значит уже идёт отправка пакета, повторно не отправляем
    return ERR_INPROGRESS;
  }

  //берём первый пакет из очереди, он в конце связного списка
  PackNode *pSendPackHead = pSendPacketList;
  while (pSendPackHead->prev != NULL) {
    pSendPackHead = pSendPackHead->prev;
  }
  // заполняем поля заголовка
  SRV_PacketHeader *pPack = pSendPackHead->packet;

  return sendPacket(session, pPack, false);
}

static void deliveredPacket(Session *session, uint16_t ackLen) {

  session->ackedBytes += ackLen;

  if (session->ackedBytes < session->sentBytes) {
    //подтверждено меньше байт чем отправлено, ждём ACK пакетов от сервера
    return;
  }

  //подтверждено столько же  байт сколько отправлено
  if (session->ackedBytes > session->sentBytes) {
    //или больше, но это ии бага в коде или ошибка сети
    LOGERR("acknowledged bytes(%d) more than sent bytes(%d)", session->ackedBytes, session->sentBytes);
  }
  session->ackedBytes = 0;
  session->sentBytes = 0;

  //если списко пуст, значит нечего не отправляли
  if (NULL == pSendPacketList) {
    return;
  }

  //берём первый пакет из очереди, его мы отправляли, он в конце связного списка
  PackNode *pPrevSendPackHead = NULL;
  PackNode *pDeliveredHead = pSendPacketList;
  while (pDeliveredHead->prev != NULL) {
    pPrevSendPackHead = pDeliveredHead;
    pDeliveredHead = pDeliveredHead->prev;
  }

  //проверяем, был ли пакет отправлен
  if (!SEND_PACK_IS_IN_PROGRESS(pSendPacketList)) {
    return;
  }

  //удаляем доставленный пакет из списка
  if (pPrevSendPackHead != NULL) {
    pPrevSendPackHead->prev = NULL;
  } else {
    pSendPacketList = NULL;
  }

  //освобождаем память
  mem_free(pDeliveredHead);
}

static err_t addSendPacket(Session *session, SRV_PacketType type, void *pData, uint16_t dataLen) {
  if (dataLen > SRV_MAX_PAYLOAD_SIZE) {
    return ERR(ERR_MEM);
  }

  //выделяем память под пакет, для списка отправляемых пакетов
  PackNode *pPackNode = mem_malloc(PACK_HEADER_LEN + PACK_NODE_SIZE + dataLen);
  if (NULL == pPackNode) {
    return ERR(ERR_MEM);
  }
  //пакет будет расположен сразу после PackNode, в том же блоке памяти
  //указатель на часть буфера, в которой хранится сам пакет
  pPackNode->packet = ((SRV_PacketHeader *) (((uint8_t *) (pPackNode)) + PACK_NODE_SIZE));

  //далее формируем заголовок пакета, копируем данные в буфер
  createPacket(pPackNode->packet, type, pData, dataLen);

  //добавляем к конец очереди
  PackNode *priv = NULL;
  bool sent = false;
  if (NULL == pSendPacketList) {
    priv = pSendPacketList;
    sent = true;
  }
  pPackNode->prev = priv;
  pSendPacketList = pPackNode;

  if (sent && STATE_CONNECTED == session->state) {
    //если очередь была пуста,и соединение установлено запускаем отправку пакетов
    sendNextPacket(session);
  }

  return ERR_OK;
}

static void sendAsk(Session *session, uint8_t code) {
  SRV_PacketACK ask;
  ask.code = code;
  ask.sequenceNumber = session->lastSeqNumber;
  sendPacketNow(session, SRV_PACKET_TYPE_ACK, &ask, sizeof (SRV_PacketACK));
}

static void closeConnection(Session *session) {
  tcp_recv(session->pcb, NULL);
  tcp_sent(session->pcb, NULL);
  tcp_poll(session->pcb, NULL, 0);
  tcp_err(session->pcb, NULL);

  tcp_close(session->pcb);
  currentSession = NULL;
  freeSession(session);
  setState(session, STATE_INIT);
}

static void startHandshaking(Session *session) {
  setState(session, STATE_HANDSHAKING);
  //отправляем пакет с ID шлюза
  SRV_PacketID packID;
  packID.id = SRV_GATE_ID;
  sendPacketNow(session, SRV_PACKET_TYPE_HANDSHAKING, &packID, sizeof (SRV_PacketID));
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
 * Обрабатываем TCP сегмент, если пакет состоит из нескольких сегментов, то собираем пакет
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
  uint32_t headCrc = pHead->crc;
  pHead->crc = 0;
  uint32_t crc = calcSessionCRC(session, session->rxPacket, session->rxLength);
  if (crc != headCrc) {
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
  LOG("sentCallback %d", len);

  //  if (STATE_CONNECTED == session->state) {
  RESET_WATCHDOG(session);
  deliveredPacket(session, len);
  //  }
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

  if (STATE_CONNECTED == session->state) {
    sendNextPacket(session);
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

void TCPS_Init(TCPS_InitStruct init) {
  pNetif = init.pNetif;

  static const ip_addr_t dnsServers[DNS_MAX_SERVERS] = {SRV_DNS_SERVERS};
  //Инициализация списка DNS серверов
  for (int i = 0; i < DNS_MAX_SERVERS; i++) {
    dns_setserver(i, &dnsServers[i]);
  }
  dns_init();
}

TCPS_Error TCPS_StartSession() {
  if (!netif_is_link_up(pNetif)) {
    return TCPS_ERR_NOT_LINK_UP;
  }
  if (!dhcp_supplied_address(pNetif)) {
    return TCPS_ERR_DHCP_SUPPLIED_IP;
  }
  //  if (netif_is_up(pNetif)) {
  //    return TCPS_ERR_NOT_UP;
  //  }

  if (currentSession == NULL) {
    currentSession = newSession();
    if (currentSession == NULL) {
      return TCPS_ERR_MEM;
    }

    connect(currentSession);
    return TCPS_ERR_INPROGRESS;
  } else {
    return TCPS_ERR_OPERATION;
  }
}

TCPS_Error TCPS_SendPacket(SRV_PacketType type, void *pData, uint16_t dataLen) {

  if (currentSession == NULL) {
    TCPS_StartSession();
  }

  addSendPacket(currentSession, type, pData, dataLen);

  return TCPS_ERR_OK;
}

void TCPS_Process() {
  MX_LWIP_Process();
}






