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
#include "tcp.h"
#include "dns.h"
#include "srv_packet.h"


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
#define USE_DNS_SERVER false
#define SRV_SERVER_NAME TO_STR(is.meterage72.ru)
#define SRV_DNS_SERVERS  IP_ADDR(8, 8, 8, 8) /*Google*/, IP_ADDR(77, 88, 8, 8)/*Yandex*/
#define SRV_MAX_RECONNECTION 5
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

/* 
 * Сессия связи с сервером
 */
typedef struct {
  struct tcp_pcb *pcb;
  State state;
  ip_addr_t ipAddr;
  uint16_t port; //8888
  uint8_t reconnectCount;
  /*Имя сервера, для получения ip через dns*/
  char *serverName;
  DNSState dnsState;

  uint8_t *key;
  uint16_t keyLn;

} Session;
/*Инициализация ВСЕХ полей структуры */
#define INIT_SESSION(pSes) {\
pSes->pcb = NULL;\
pSes->state = STATE_NONE;\
pSes->ipAddr.addr=0;\
pSes->port=SRV_SERVER_PORT;\
pSes->reconnectCount=0;\
pSes->dnsState = DNS_STATE_NONE;\
pSes->serverName = NULL;\
pSes->key=NULL;\
pSes->keyLn=0;\
}
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

static void sendData(Session *session, const void *pData, uint16_t len, bool copyData) {
  uint8_t flags = copyData ? TCP_WRITE_FLAG_COPY : 0;
  tcp_write(session->pcb, pData, len, flags);
  tcp_output(session->pcb);
}

static void sendAsk(Session *session, uint8_t code) {
  uint8_t ask[] = {SRV_PACKET_TYPE_ASK, code};
  sendData(session, &ask, sizeof (ask), true);
}

static void sendStr(Session *session, const char *str) {
  size_t len = strlen(str);
  sendData(session, str, len, true);
}

/*Симетричное шифрование, XOR*/
static void crypt(void *buf, uint16_t bufLen, const uint8_t *key, uint16_t keyLen) {
  //вероятно можно ускорить за счёт обработки по словам
  uint8_t *data = (uint8_t *) buf;
  for (int dI = 0, kI = 0; dI < bufLen; dI++, kI++) {
    if (kI == keyLen) {
      kI = 0;
    }
    //    data[dI] = data[dI]^key[kI];
    data[dI] ^= key[kI];
  }
}

static err_t processHandshaking(Session *session, struct pbuf * p) {
  SRVPacketHeader *pack = p->payload;
  if (pack->type != SRV_PACKET_TYPE_HANDSHAKING) {
    return ERR_VAL;
  }
  uint16_t ln = pack->payloadLength;

  struct {
    SRVPacketHeader head;
    uint8_t key[ln];
  } *pHand = p->payload;
  session->key = mem_malloc(ln);
  if (session->key == NULL) {
    return ERR_MEM;
  }
  session->keyLn = ln;
  MEMCPY(session->key, pHand->key, ln);
  uint8_t securityKey[] = SRV_SECURITY_KEY;
  crypt(session->key, ln, securityKey, sizeof (securityKey));
  //всё ок, переходит в состояние CONNECTED
  setState(session, STATE_CONNECTED);
  return ERR_OK;

}

static void startHandshaking(Session *session) {
  setState(session, STATE_HANDSHAKING);
  //отправляем пакет с ID шлюза
  SRVHandshaking hh = {};
  INIT_SRVHandshaking(&hh, SRV_GATE_ID);
  sendData(session, &hh, sizeof (hh), true);
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



static struct pbuf *packet;
static uint16_t packetLen = 0;

static err_t processPacket(Session *session, struct pbuf * p) {
  if (packet == NULL) {
    //начало пакета, разбираем заголовок
    SRVHandshaking *pHeader = p->payload;
    packetLen = pHeader->head.payloadLength + sizeof (SRVPacketHeader);
    packet = p;
    if (packetLen > SRV_PACKET_MAX_PAYLOAD_SIZE) {
      LOG("Packet is long packetLen=%d ", packetLen);
      return ERR_MEM;
    }
  } else {
    pbuf_cat(packet, p);
  }

  if (packet->tot_len >= packetLen) {
    uint16_t countBuf = pbuf_clen(packet);
    if (packet->tot_len > packetLen) {
      LOG("Packet trash tot_len=%d packetLen=%d countBuf=%d", packet->tot_len, packetLen, countBuf);
    }

    //собираем пакет из TCP сегментов
    uint8_t fullPacket[packetLen];
    pbuf_copy_partial(packet, fullPacket, packetLen, 0);

    //указатель на содержимое пакета
    void *data = (char *) (fullPacket + sizeof (SRVPacketHeader));
    uint16_t dataLn = packetLen - sizeof (SRVPacketHeader);
    //расшифровываем пакет
    crypt(data, dataLn, session->key, session->keyLn);

    char *str = data;
    LOG("Packet: size:%d countBuf:%d  %s", packetLen, countBuf, str);
    // LOG("Packet recived : size:%d countBuf:%d", packetLen, countBuf);


    return ERR_OK;
  }


  return ERR_INPROGRESS;
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
  if (p->len < sizeof (SRVPacketHeader)) {
    LOGERR("TCP bad segment size %d", p->len);
    //    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    return ERR_OK;
  }

  //дальше запускаем обработчики пакетов
  bool freeBuf = true;
  err_t result = ERR_OK;
  State state = session->state;

  if (state == STATE_HANDSHAKING) {
    result = processHandshaking(session, p);
    tcp_recved(tpcb, p->tot_len);
  } else if (state == STATE_CONNECTED) {
    result = processPacket(session, p);
    if (result == ERR_INPROGRESS) {
      freeBuf = false;
    } else {
      //ошибка или пакет разобран
      tcp_recved(tpcb, packet->tot_len);
      packet = NULL;
      packetLen = 0;
      //      if (result != ERR_OK) {
      //        //closeConnection();
      //      }
    }
  } else {
    LOG("TCP receive in bad status %d", session->state);
  }



  if (freeBuf) {
    pbuf_free(p);
  }
  sendAsk(session, result);
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
  LWIP_UNUSED_ARG(session);
//тут надо ловить зависшие соединения, т.е. раз в несколько секунд опрашивать сервер или сервер должен оправшивать
// вообщем сторожевой таймер
  return ERR_OK;
}

static void errorCallback(void *arg, err_t err) {
  Session *session = arg;
  LOG("TCP connection error %d", err);
  if (ERR_IS_FATAL(err)) {
    LOG("TCP fatal error, close connection");
    if (session->reconnectCount < SRV_MAX_RECONNECTION) {
      session->reconnectCount++;
      connectionIP(session);
    } else {
      //количество попыток истекло
      closeConnection(session);
    }
  }
}

static err_t connectedCallback(void *arg, struct tcp_pcb *tpcb, err_t err) {
  LWIP_UNUSED_ARG(err); //An unused error code, always ERR_OK currently
  Session *session = arg;

  tcp_recv(session->pcb, receiveCallback);
  tcp_sent(session->pcb, sentCallback);
  tcp_poll(session->pcb, pollCallback, 1);
  tcp_err(session->pcb, errorCallback);
  session->reconnectCount = 0;

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

void TCPS_Init() {
  static const ip_addr_t dnsServers[DNS_MAX_SERVERS] = {SRV_DNS_SERVERS};
  //Инициализация списка DNS серверов
  for (int i = 0; i < DNS_MAX_SERVERS; i++) {
    dns_setserver(i, &dnsServers[i]);
  }
  dns_init();
}

TCPSError TCPS_StartSession() {
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






