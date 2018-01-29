// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

#include <assert.h>
#include <stdbool.h>
#include <string.h>
#include <locale.h>

#include "srv_tcps.h"
#include "lwip.h"
#include "debug.h"
#include "stats.h"
#include "tcp.h"
#include "xprint.h"
#include "dns.h"
#include "srv_packet.h"
#include "tcp_priv.h"

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
#define _NAME_VAL(name) [name] = #name

/*Переменные для FMS */
typedef enum {
  STATE_NONE = 0,
  STATE_INIT,
  STATE_DNS_LOOKUP,
  STATE_CONNECT_IP,
  STATE_CONNECT_HANDSHAKING,
  STATE_CONNECTED
} STATE;
static const char *state_names[] = {
  _NAME_VAL(STATE_NONE),
  _NAME_VAL(STATE_INIT),
  _NAME_VAL(STATE_DNS_LOOKUP),
  _NAME_VAL(STATE_CONNECT_IP),
  _NAME_VAL(STATE_CONNECT_HANDSHAKING),
  _NAME_VAL(STATE_CONNECTED),
};
static STATE state = STATE_NONE;

typedef enum {
  MSG_START_CONNECTION = 0,
  MSG_DNS_OK,
  MSG_DNS_ERR,

  MSG_CONNECT_ERROR_END_IP_LIST,
  MSG_CONNECT_ERROR,
  MSG_CONNECTED,

  MSG_DATA_SEND,
  MSG_DATA_RECEIVE

} MSG;
static const char *message_names[] = {
  _NAME_VAL(MSG_START_CONNECTION),
  _NAME_VAL(MSG_DNS_OK),
  _NAME_VAL(MSG_DNS_ERR),
  _NAME_VAL(MSG_CONNECT_ERROR_END_IP_LIST),
  _NAME_VAL(MSG_CONNECT_ERROR),
  _NAME_VAL(MSG_CONNECTED),
  _NAME_VAL(MSG_DATA_SEND),
  _NAME_VAL(MSG_DATA_RECEIVE),
};
#define MESSAGE_MAX 8
uint8_t messages[MESSAGE_MAX] = {0};

static void sendMessage(MSG msg)
#define sendMessage(msg) sendMessage(SAFE_ENUM(MSG, msg))
{
  messages[msg] = 2;
  LOG("Send message: %d:%s", msg, message_names[msg]);
}

static bool getMessage(MSG msg) {
  if (messages[msg] == 1) {
    messages[msg] = 0;
    return true;
  }
  return false;
}

static void processMessages() {
  for (int i = 0; i < MESSAGE_MAX; i++) {
    if (messages[i] > 0) {
      messages[i]--;
    }
  }
}

static inline void setState(STATE st)
#define setState(st) setState(SAFE_ENUM(STATE, st))
{
  STATE oldState = state;
  state = st;
  LOG("Set state: %d:%s->%d:%s", oldState, state_names[oldState], state, state_names[state]);

}


// IP DNS сервера  можно ещё использовать DNS_SERVER_ADDRESS
static ip_addr_t ipDnsServers[DNS_MAX_SERVERS] = {
  IP_ADDR(8, 8, 8, 8), //Google
  IP_ADDR(77, 88, 8, 8), //Yandex
};
static char *srvName = "meterage72.ru";


#define SRV_IP_LIST_COUNT (sizeof(srvIPList)/sizeof(ip_addr_t))
#define SRV_IP_LIST_POS_DNS 0
#define SRV_IP_LIST_POS_IP 1
static uint8_t srvIPListIndex = 0;
static ip_addr_t srvIPList[] = {
  IP_ADDR(0, 0, 0, 0), //место под ip полученный из dns SERVER_IP_LIST_POS_DNS
  IP_ADDR(192, 168, 1, 10)
};

static uint16_t srvPort = 8888;
static struct tcp_pcb *tcpPCB;
static err_t lastConnectError = ERR_OK;

void TCPS_Init() {
  //Инициализация DNS
  for (int i = 0; i < DNS_MAX_SERVERS; i++) {
    dns_setserver(i, &ipDnsServers[i]);
  }
  dns_init();
  setState(STATE_INIT);
}

static void dnsLookupCallback(const char *name, const ip_addr_t *ipaddr, void *callback_arg) {
  if (ipaddr == NULL) {
    LOG("Dns сallback error");
    sendMessage(MSG_DNS_ERR);
    return;
  }
  srvIPList[SRV_IP_LIST_POS_DNS] = *ipaddr;
  sendMessage(MSG_DNS_OK);
}

static void dnsLookup() {
  setState(STATE_DNS_LOOKUP);
  err_t result = dns_gethostbyname(srvName, &srvIPList[SRV_IP_LIST_POS_DNS], dnsLookupCallback, NULL);

  if (result == ERR_OK) {// ip взяты из кеша, и записан в serverIPList
    sendMessage(MSG_DNS_OK);
  } else if (result != ERR_INPROGRESS) {// ошибка
    LOG("Dns lookup error, code:%d", result);
    sendMessage(MSG_DNS_ERR);
  }
}

static void sendData(const void *pData, uint16_t len, bool copyData) {
  uint8_t flags = copyData ? TCP_WRITE_FLAG_COPY : 0;
  tcp_write(tcpPCB, pData, len, flags);
  tcp_output(tcpPCB);
}

static void sendAsk(uint8_t code) {
  uint8_t ask[] = {SRV_PACKET_TYPE_ASK, code};
  sendData(&ask, sizeof (ask), true);
}

static void sendStr(const char *str) {
  size_t len = strlen(str);
  sendData(str, len, true);
}

static void closeConnection() {
  //    tcp_recv(tpcb, NULL);
  //    tcp_sent(tpcb, NULL);
  //  if (ERR_IS_FATAL(err)) {
  err_t err = tcp_close(tcpPCB);
  tcpPCB = NULL;
}

static void errorCallback(void *arg, err_t err) {
  LOG("TCP connection error %d", err);
  sendMessage(MSG_CONNECT_ERROR);
  lastConnectError = err;
}

static err_t connectedCallback(void *arg, struct tcp_pcb *tpcb, err_t err) {
  if (err == ERR_OK) {
    sendMessage(MSG_CONNECTED);
    return ERR_OK;
  } else {
    sendMessage(MSG_CONNECT_ERROR);
    lastConnectError = err;
  }
  return err;
}

static struct pbuf *packet;
static uint16_t packetLen = 0;

static err_t processPacket(struct tcp_pcb *tpcb, struct pbuf *p) {
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


    //обрабатываем пакет
    uint8_t fullPacket[packetLen];
    pbuf_copy_partial(packet, fullPacket, packetLen, 0);
    char *str = (char *) (fullPacket + sizeof (SRVPacketHeader));
    LOG("Packet: size:%d countBuf:%d  %s", packetLen, countBuf, str);
    // LOG("Packet recived : size:%d countBuf:%d", packetLen, countBuf);


    sendAsk(0);


    return ERR_OK;
  }


  return ERR_INPROGRESS;
}

static err_t receiveCallback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err) {
  if (p == NULL) {
    //пустой фрейм с сервера
    return err;
  }

  if (err != ERR_OK) {
    // произошла ошибка, освобождаем буфер
    tcp_recved(tpcb, p->tot_len);
    pbuf_free(p);
    return err;
  }

  //  if (state == STATE_CONNECT_HANDSHAKING) {
  //    if (p->len >= sizeof (SRVHandshakingHeader)) {
  //      SRVHandshakingHeader *pHeader = p->payload;
  //      //     pHeader->head.payloadLength-SRV_HEADER_PLEN(SRVHandshakingHeader);
  //      void* packet = malloc(pHeader->head.payloadLength + sizeof (SRVPacketHeader));
  //
  //      free(packet);
  //    }
  //  }

  if (state == STATE_CONNECTED) {
    sendMessage(MSG_DATA_RECEIVE);

    if (p->len < sizeof (SRVPacketHeader)) {
      LOGERR("bad segment size %d", p->len);
      pbuf_free(p);
      return ERR_BUF;
    }

    err_t result = processPacket(tpcb, p);
    if (result != ERR_INPROGRESS) {
      //ошибка или пакет разобран
      tcp_recved(tpcb, packet->tot_len);
      pbuf_free(packet);
      packet = NULL;
      packetLen = 0;
      if (result != ERR_OK) {
//        closeConnection();
      }
    }

    //    sendAsk(0);
    //    tcp_recved(tpcb, p->tot_len);
    //    pbuf_free(p);




    //    uint16_t buffSize = (p->len) + 1;
    //    char buffer[buffSize];
    //    MEMCPY(buffer, p->payload, p->len);
    //    buffer[buffSize - 1] = 0;
    //    LOG("Recive data %s", buffer);

    /* return memory allocation error */
    //return ERR_MEM; mem.c
    //    char *str = "!Привет!";
    //    tcp_write(tpcb, str, sizeof (str), TCP_WRITE_FLAG_COPY);
    //    tcp_output(tpcb);

  } else {
    pbuf_free(p);
  }

  return err;

}

static err_t sentCallback(void *arg, struct tcp_pcb *tpcb, u16_t len) {
  //данные были отправлены, можно отправлять следующие данные
  sendMessage(MSG_DATA_SEND);
  return ERR_OK;
}

static void connectIP(bool next) {
  setState(STATE_CONNECT_IP);

  if (next || IS_IP_ADDR_EMPTY(&srvIPList[srvIPListIndex])) {//пропустим пустой IP, если он есть в списке
    srvIPListIndex++;
  }

  if (srvIPListIndex < SRV_IP_LIST_COUNT) {

    if (tcpPCB != NULL) {
      closeConnection();
    }

    tcpPCB = tcp_new();
    tcp_recv(tcpPCB, receiveCallback);
    tcp_sent(tcpPCB, sentCallback);
    tcp_err(tcpPCB, errorCallback);

    LOGIP("TCP connect ", &srvIPList[srvIPListIndex]);

    err_t err = tcp_connect(tcpPCB, &srvIPList[srvIPListIndex], srvPort, connectedCallback);
    if (err != ERR_OK) {
      LOG("TCP connect error %d", err);
      sendMessage(MSG_CONNECT_ERROR);
      lastConnectError = err;
    }
  } else {
    sendMessage(MSG_CONNECT_ERROR_END_IP_LIST);
    srvIPListIndex = 0;
  }

}

static void startHandshaking() {
  setState(STATE_CONNECT_HANDSHAKING);
  SRVHandshaking hh = SRV_NEW_Handshaking(1234);
  sendData(&hh, sizeof (hh), true);
}

void TCPS_StartSession() {
  sendMessage(MSG_START_CONNECTION);
}

void TCPS_Process() {
  MX_LWIP_Process();

  switch (state) {
    case STATE_INIT:
      if (getMessage(MSG_START_CONNECTION)) {//запускам поиск IP сервера по DNS
        dnsLookup();
      }
      break;

    case STATE_DNS_LOOKUP:
      if (getMessage(MSG_DNS_ERR)) {//IP по DNS не нашли
        connectIP(false);
      }
      if (getMessage(MSG_DNS_OK)) {//IP по DNS нашли
        connectIP(false);
      }
      break;

    case STATE_CONNECT_IP:
      if (getMessage(MSG_CONNECT_ERROR)) {//ошибка связи, нужно переподключится
        closeConnection();
        connectIP(true);
      }
      if (getMessage(MSG_CONNECT_ERROR_END_IP_LIST)) {//списков серверов кончился, не к одному не удалось подключится
        // нужно бросить сообщение на уровень выше
        closeConnection();
        setState(STATE_INIT);
      }
      if (getMessage(MSG_CONNECTED)) {//установлено TCP соединение
        //
        setState(STATE_CONNECTED);


      }
      break;

    case STATE_CONNECT_HANDSHAKING:


      break;
    case STATE_CONNECTED:
      if (getMessage(MSG_DATA_RECEIVE)) {
      }

      if (getMessage(MSG_CONNECT_ERROR)) {
        connectIP(false);
      }


      break;

    default:
      break;

  }




  processMessages(); //обязательно в конце, после обработки всех событий
}






