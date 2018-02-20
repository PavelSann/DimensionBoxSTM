// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include <assert.h>
#include <stdbool.h>
#include <string.h>

#include "tcps.h"
#include "xprint.h"
#include "lwip.h"
#include "netif.h"
#include "tcp.h"
#include "dns.h"
#include "tcps_packet_queue.h"
#include "tcps_crypt.h"


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
#define USE_DNS_SERVER false
#define SRV_SERVER_NAME "is.meterage72.ru"
#define SRV_DNS_SERVERS  IP_ADDR(8, 8, 8, 8) /*Google*/, IP_ADDR(77, 88, 8, 8)/*Yandex*/
#define SRV_GATE_ID ((uint32_t)42)
#define SRV_SECURITY_KEY {1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4}
//#define SRV_SECURITY_KEY {0}
#define SRV_WATCHDOG_TIME (30*2)
#define SRV_MAX_SESSION_KEY_LN 128
#define SRV_RESERVED_MEM_SIZE 1000  //заразервированно под структуры lwip
#define SRV_MAX_PQUEUE_ALLOC_SIZE LWIP_MEM_ALIGN_SIZE(MEM_SIZE)-(sizeof (Session) + SRV_RESERVED_MEM_SIZE);
#define SRV_MAX_PBUF_IN_PACKET PBUF_POOL_SIZE

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

/*Ethernet интерфейс*/
static struct netif *pNetif;

static TCPS_InitStruct init;

/* 
 * Сессия связи с сервером
 */
typedef struct {
  struct tcp_pcb *pcb;
  /*Состояние сессии*/
  State state;
  ip_addr_t ipAddr;
  uint16_t port;
  /*таймер, для аварийного закрытия соединения*/
  uint16_t watchdog;
  /*Имя сервера, для получения ip через dns*/
  char *serverName;
  /*Состояние получения IP по DNS*/
  DNSState dnsState;
  /*данные по ключу шифрования по TCP*/
  uint8_t *pCryptKey;
  uint16_t cryptKeyLen;
  /*указатель на первый сегмент текущего пакета*/
  struct pbuf *packetBuf;
  /*Буфер под собранный и расшифрованный пакет, приём данных*/
  uint8_t rxPacket[SRV_MAX_PACKET_SIZE];
  uint16_t rxLength;
  /*последний номер входящего пакета*/
  uint8_t rxSeqNumber;
  /*последний номер исходящего пакета*/
  uint8_t txSeqNumber;
  /*Количество отправленных байт*/
  uint32_t sentBytes;
  /*Количество подтверждённых байт*/
  uint32_t ackedBytes;

} Session;
/*Инициализация ВСЕХ полей структуры */
#define INIT_SESSION(pSes) {\
pSes->pcb = NULL;\
pSes->state = STATE_INIT;\
pSes->ipAddr.addr=0;\
pSes->port=SRV_SERVER_PORT;\
pSes->watchdog=SRV_WATCHDOG_TIME;\
pSes->serverName = NULL;\
pSes->dnsState = DNS_STATE_NONE;\
pSes->pCryptKey=NULL;\
pSes->cryptKeyLen=0;\
pSes->packetBuf=NULL;\
/*pSes->rxPacket;*/\
pSes->rxLength=0;\
pSes->rxSeqNumber=0;\
pSes->txSeqNumber=0;\
pSes->sentBytes=0;\
pSes->ackedBytes=0;\
}
/*Длинна заголовка*/
#define PACK_HEADER_LEN (sizeof(SRV_PacketHeader))
/*Возвращает указатель на заголовок пакета*/
#define PACK_HEADER(pPacket) ((SRV_PacketHeader *)(pPacket))
/*Указатель на данные в пакете, которые находятся после заголовка*/
#define PACK_PAYLOAD(pPacket) ((void *)((uint8_t *)(pPacket))+ PACK_HEADER_LEN)
/*Полный размер пакета, заголовок + данные */
#define PACK_FULL_LENGTH(pPacket) ( (PACK_HEADER(pPacket))->payloadLength + PACK_HEADER_LEN)

#define RESET_WATCHDOG(pSession) ((pSession)->watchdog=SRV_WATCHDOG_TIME)

#define NEXT_SEQ_NUMBER(sn) ((sn)<0xFF?((sn)+1):0)

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
#define ERR(e) cathError((e),FILE ":" TO_STR(__LINE__))

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
    pbuf_free(session->packetBuf);
    session->packetBuf = NULL;
  }

  if (session->pCryptKey) {
    mem_free(session->pCryptKey);
    session->pCryptKey = NULL;
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

static uint32_t calcSessionCRC(const Session *session, const void *pData, uint16_t count) {
  CRYPT_crc(securityKey, sizeof (securityKey), true);
  return CRYPT_crc(pData, count, false);
}

static void encryptPacket(Session *session, SRV_PacketHeader *pPacket) {
  void *payload = PACK_PAYLOAD(pPacket);
  uint16_t bufLen = pPacket->payloadLength;
  if (session->pCryptKey == NULL) {
    CRYPT_xor(payload, bufLen, securityKey, sizeof (securityKey));
  } else {
    CRYPT_xor(payload, bufLen, session->pCryptKey, session->cryptKeyLen);
  }
}
//так как используется XOR decryptPacket==encryptPacket
#define decryptPacket(session, pPacket) encryptPacket(session,pPacket)

static err_t sendPacket(Session *session, SRV_PacketHeader *pPack, bool copy) {
  //генерируем новый номер пакета
  uint8_t nextSeqNumber = NEXT_SEQ_NUMBER(session->txSeqNumber);

  // заполняем поля заголовка
  pPack->crc = 0;
  pPack->sequenceNumber = nextSeqNumber;

  //рассчитываем CRC
  uint32_t fullPackLen = PACK_FULL_LENGTH(pPack);
  uint32_t crc = calcSessionCRC(session, pPack, fullPackLen);
  pPack->crc = crc;

  //шифруем содержимое пакета
  if (pPack->payloadLength > 0) {
    encryptPacket(session, pPack);
  }

  //отправляем пакет
  uint8_t flag = copy ? TCP_WRITE_FLAG_COPY : 0;
  err_t err = tcp_write(session->pcb, pPack, fullPackLen, flag);
  if (err != ERR_OK) {
    return ERR(err);
  }
  err = tcp_output(session->pcb);
  if (err != ERR_OK) {
    return ERR(err);
  }
  session->sentBytes += fullPackLen;
  session->txSeqNumber = nextSeqNumber;
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

static err_t trySendNextPacket(Session *session) {
  //отправляем только если соединение установлено
  if (STATE_CONNECTED == session->state) {
    //берём первый пакет из очереди, он в конце связного списка
    PQueueNode *pNode = PQueue_GetFirst();
    if (pNode) {
      if (pNode->sent) {
        //пакет уже отправлен и ожидает подтверждения приёма
        return ERR_INPROGRESS;
      } else {
        // заполняем поля заголовка
        SRV_PacketHeader *pPack = pNode->packet;

        pNode->sent = true;
        err_t err = sendPacket(session, pPack, false);
        if (ERR_OK != err) {
          pNode->sent = false;
          ERR(err);
        }
        return err;
      }
    }
  }
  //очередь пуста
  return ERR_OK;
}

static void deliveredPacket(Session *session, uint16_t ackLen) {

  session->ackedBytes += ackLen;
  //  LOG("deliveredPacket sent:%d ack:%d", session->sentBytes, session->ackedBytes);

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

  //берём первый пакет из очереди
  PQueueNode* pNode = PQueue_GetFirst();
  if (pNode) {
    //очередь не пустая
    if (pNode->sent) {
      //первый пакет был  отправлен
      //удаляем пакет из очереди, освобождает память
      PQueue_RemoveFirst();
    }
    //пробуем отправить следующий пакет
    trySendNextPacket(session);
  }
}
#if LWIP_STATS_DISPLAY
extern struct stats_ lwip_stats;

void printStats() {
  s16_t i;
  //  LINK_STATS_DISPLAY();
  //  ETHARP_STATS_DISPLAY();
  //  IPFRAG_STATS_DISPLAY();
  //  IP6_FRAG_STATS_DISPLAY();
  //  IP_STATS_DISPLAY();
  //  ND6_STATS_DISPLAY();
  //  IP6_STATS_DISPLAY();
  //  IGMP_STATS_DISPLAY();
  //  MLD6_STATS_DISPLAY();
  //  ICMP_STATS_DISPLAY();
  //  ICMP6_STATS_DISPLAY();
  //  UDP_STATS_DISPLAY();
  //  TCP_STATS_DISPLAY();
  //  MEM_STATS_DISPLAY();
  //  for (i = 0; i < MEMP_MAX; i++) {
  //    MEMP_STATS_DISPLAY(i);
  //  }
  //  SYS_STATS_DISPLAY();
  LOG("MEM %d/%d QUEUE:%d", lwip_stats.mem.used, lwip_stats.mem.avail, PQueue_Count());
}
#else
#define printStats()
#endif

static err_t addSendPacket(Session *session, SRV_PacketType type, void *pData, uint16_t dataLen) {
  if (dataLen > SRV_MAX_PAYLOAD_SIZE) {
    return ERR(ERR_MEM);
  }

  //выделяем память под пакет
  PQueueNode *pNode = PQueue_Alloc(PACK_HEADER_LEN + dataLen);
  if (pNode) {
    //далее формируем заголовок пакета, копируем данные в буфер
    createPacket(pNode->packet, type, pData, dataLen);
    //добавляем пакет в очередь
    PQueue_Add(pNode);

    if (PQueue_Count() == 1) {
      //если очередь была пустой, пробуем отправить следующий пакет
      trySendNextPacket(session);
    }
    return ERR_OK;
  } else {
    LOGERR("PQueue not alloc node. Used:%d byte Count:%d", PQueue_AllocSize(), PQueue_Count());
    return ERR(ERR_MEM);
  }
}

static void sendAsk(Session *session, uint8_t code) {
  SRV_PacketACK ask;
  ask.code = code;
  ask.sequenceNumber = session->rxSeqNumber;
  sendPacketNow(session, SRV_PACKET_TYPE_ACK, &ask, sizeof (SRV_PacketACK));
}

static void closeConnection(Session *session) {

  //если в очереди есть отправленный пакет, нужно его расшифровать, и сбросить флаг отправки
  PQueueNode* pNode = PQueue_GetFirst();
  if (pNode && pNode->sent) {
    SRV_PacketHeader* pPack = pNode->packet;
    decryptPacket(session, pPack);
    pPack->crc = 0;
    pPack->sequenceNumber = 0;
  }


  tcp_recv(session->pcb, NULL);
  tcp_sent(session->pcb, NULL);
  tcp_poll(session->pcb, NULL, 0);
  tcp_err(session->pcb, NULL);
  tcp_arg(session->pcb, NULL);
  setState(session, STATE_INIT);

  freeSession(session);
  currentSession = NULL;
  tcp_close(session->pcb);
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
  if (key) {
    MEMCPY(key, payload, ln);
    session->pCryptKey = key;
    session->cryptKeyLen = ln;
    setState(session, STATE_CONNECTED);
    return ERR_OK;
  } else {
    return ERR(ERR_MEM);
  }
}

static err_t processPacket(Session *session) {
  SRV_PacketHeader * pPack = PACK_HEADER(session->rxPacket);
  SRV_PacketType type = pPack->type;
  uint8_t *payload = PACK_PAYLOAD(pPack);

  if (session->state == STATE_HANDSHAKING) {
    if (type == SRV_PACKET_TYPE_HANDSHAKING) {
      return processHandshaking(session, pPack, payload);
    } else {
      LOG("Handshaking: Invalid packet type %d", type);
      return ERR(ERR_ARG);
    }
  }

  //    LOG("Process packet type=%d sequenceNumber=%d fullLength=%d", pPack->type, pPack->sequenceNumber, session->rxLength);
  err_t err = ERR_OK;
  switch (type) {
    case SRV_PACKET_TYPE_PING:
      //нечего не делаем, вернётся просто  ask
      break;

    case SRV_PACKET_TYPE_STR:
      //выводим строку из пакета
      LOG("Packet str: %s", payload);
      break;
    case SRV_PACKET_TYPE_RADIO_PACKET:
      //выводим строку из пакета
      if (init.receiveCallback) {
        init.receiveCallback(pPack, payload);
      }
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
    //в обработке нет пакета, значит это первый сегмент пакета
    SRV_PacketHeader *header = p->payload;
    //    SRV_PacketType type = header->type;
    uint8_t nextSeqNum = NEXT_SEQ_NUMBER(session->rxSeqNumber);

    if (header->sequenceNumber != nextSeqNum) {
      LOGERR("Illegal sequence number, header:%d expected:%d ", header->sequenceNumber, nextSeqNum);
      return ERR(ERR_ARG);
    }
    //    if(type){
    //      //сделать проверку корректности типа пакета
    //    }
    //если длинна пакета превышает норму, обрабатывать не будем
    if (header->payloadLength > SRV_MAX_PAYLOAD_SIZE) {
      LOGERR("Packet is long payloadLength=%d ", header->payloadLength);
      return ERR(ERR_MEM);
    }
    session->packetBuf = p;
  }
  else {
    //если уже идёт приём пакета, то присоединяем сегмент к нему
    pbuf_cat(session->packetBuf, p);
  }

  {
    struct pbuf * const packBuf = session->packetBuf;
    uint16_t countBuf = pbuf_clen(packBuf);
    if (countBuf >= SRV_MAX_PBUF_IN_PACKET) {
      LOGERR("The package consists of %d(MAX:%d) segments.", countBuf, SRV_MAX_PBUF_IN_PACKET);
      return ERR(ERR_MEM);
    }

    //общее количество байт, которое нужно принять значение payloadLength из заголовка пакета + длинна заголовка
    uint16_t fullLength = PACK_FULL_LENGTH(packBuf->payload);

    if (packBuf->tot_len < fullLength) {
      //если получили ещё не весь пакет, будем ждать следующий сегмент
      return ERR_INPROGRESS;
    }


    if (packBuf->tot_len > fullLength) {
      //принято больше байт чем длина пакета, значит отправитель склеил TCP пакеты
      //такого не должно быть, пакет будет обрезан, данные потеряны

      LOG("Packet trash tot_len=%d packetLen=%d countBuf=%d", packBuf->tot_len, fullLength, countBuf);
    }

    //собираем пакет из TCP сегментов в один буфер
    pbuf_copy_partial(packBuf, session->rxPacket, fullLength, 0);
    session->rxLength = fullLength;
  }

  SRV_PacketHeader * const pPack = PACK_HEADER(session->rxPacket);

  //расшифровываем содержимое пакета
  decryptPacket(session, pPack);

  //рассчитываем и проверяем CRC
  uint32_t headCrc = pPack->crc;
  pPack->crc = 0;
  uint32_t crc = calcSessionCRC(session, session->rxPacket, session->rxLength);
  if (crc != headCrc) {
    LOG("Invalid CRC: head:%x calc:%x", headCrc, crc);
    return ERR(ERR_ARG);
  }

  session->rxSeqNumber = pPack->sequenceNumber;
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
      //если ERR_INPROGRESS значит идёт сборка пакета из нескольких сегментов и память пока освобождать нельзя
      struct pbuf *freePBuf = p;
      if (session->packetBuf != NULL) {
        //если session->packetBuf заполнен, то p должен быть в него включён, и освобождать будем его
        freePBuf = session->packetBuf;
        session->packetBuf = NULL;
      }
      tcp_recved(tpcb, freePBuf->tot_len);
      pbuf_free(freePBuf);
      sendAsk(session, result);
    }
  }

  return ERR_OK;
}

static err_t sentCallback(void *arg, struct tcp_pcb *tpcb, u16_t len) {
  Session *session = arg;
  //  LOG("sentCallback %d", len);

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

  //пробуем отправить следующий пакет
  trySendNextPacket(session);

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

TCPS_Error wrapErr(err_t err) {
  switch (err) {
    case ERR_OK: return TCPS_ERR_OK;
    case ERR_INPROGRESS: return TCPS_ERR_INPROGRESS;
    case ERR_MEM: return TCPS_ERR_MEM;

    default:
      return TCPS_ERR;
  }
}

void TCPS_Init(TCPS_InitStruct initStruct) {
  pNetif = initStruct.pNetif;
  init = initStruct;
  static const ip_addr_t dnsServers[DNS_MAX_SERVERS] = {SRV_DNS_SERVERS};
  //Инициализация списка DNS серверов
  for (int i = 0; i < DNS_MAX_SERVERS; i++) {
    dns_setserver(i, &dnsServers[i]);
  }
  dns_init();
  uint32_t qMem = SRV_MAX_PQUEUE_ALLOC_SIZE;
  PQueue_SetMaxAllocSize(qMem);
}

TCPS_Error TCPS_StartSession() {

  if (!currentSession) {
    //если сессии нет, то создаём
    currentSession = newSession();
    if (currentSession == NULL) {
      return TCPS_ERR_MEM;
    }
  }

  if (STATE_INIT == currentSession->state) {
    //если соединение не установлено
    //netif_is_up(pNetif)
    if (!netif_is_link_up(pNetif)) {
      //провод не подключён
      return TCPS_ERR_NOT_LINK_UP;
    }
    if (!dhcp_supplied_address(pNetif)) {
      //IP не получен
      return TCPS_ERR_DHCP_SUPPLIED_IP;
    }
    //пробуем подключится к серверу
    connect(currentSession);
    return TCPS_ERR_INPROGRESS;
  }

  return TCPS_ERR_OK;
}

TCPS_Error TCPS_SendPacket(SRV_PacketType type, void *pData, uint16_t dataLen) {
  TCPS_Error ssErr = TCPS_StartSession();
  if (currentSession) {
    return wrapErr(addSendPacket(currentSession, type, pData, dataLen));
  } else {
    return ssErr;
  }
}

void TCPS_Process() {
  //сделать ешё один сторож, который на сосновании ошибок памяти из lwip_stats.memp будет делать сброс
  MX_LWIP_Process();

  if (PQueue_GetFirst()) {
    //если в очереди есть пакеты, то запускаем соединение
    TCPS_StartSession();
  }
}






