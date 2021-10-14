/*Это шаблон для поддержки передачи событий в FSM */



#ifndef MESSAGES_HELPER_H
#define MESSAGES_HELPER_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>


//#define MSG_OPT_MAX_MESSAGES 0
#ifndef MSG_OPT_MAX_MESSAGES
#error "Not set MSG_OPT_MAX_MESSAGES"
#endif

#ifndef MSG_OPT_SAFE_ENUM
#define MSG_OPT_SAFE_ENUM 0
#endif

#ifndef MSG_OPT_PARAM
#define MSG_OPT_PARAM 0
#endif

#ifndef MSG_OPT_MSG_TYPE
#define MSG_OPT_MSG_TYPE uint16_t
#endif

#ifndef MSG_OPT_ARRAY_NAME
#define MSG_OPT_ARRAY_NAME _messagesArray
#endif



#define _MSG_T MSG_OPT_MSG_TYPE
#define _MSG_ARR MSG_OPT_ARRAY_NAME
#define _MSG_COUNT MSG_OPT_MAX_MESSAGES
#define _MSG_ST_NONE 0
#define _MSG_ST_PROC 1
#define _MSG_ST_SEND 2

#if MSG_OPT_SAFE_ENUM
/**
 * Выполняет проверку типа enum, перед вызовом функции
 * работает с -Wall или -Wenum-compare
 * #define enumFunction(val) enumFunction(SAFE_ENUM(ENUM, val))
 */
#define _MSG_ENUM(TYPE, VAL) ((VAL) == (TYPE)0 ? (VAL) : (VAL))
#else
#define _MSG_ENUM(TYPE, VAL) VAL
#endif

static struct {
  uint8_t state;
#if MSG_OPT_PARAM
  uint32_t *pParam;
#endif
} _MSG_ARR[_MSG_COUNT];

static inline void SendMessage(_MSG_T msg)
#define SendMessage(msg) SendMessage(_MSG_ENUM(_MSG_T, msg))
{
  _MSG_ARR[msg].state = _MSG_ST_SEND;
#if MSG_OPT_PARAM
  _MSG_ARR[msg].pParam = NULL;
#endif
}

static inline bool IsMessage(_MSG_T msg)
#define IsMessage(msg) IsMessage(_MSG_ENUM(_MSG_T, msg))
{
  if (_MSG_ARR[msg].state == _MSG_ST_PROC) {
    return true;
  }
  return false;
}

static inline bool GetMessage(_MSG_T msg)
#define GetMessage(msg) GetMessage(_MSG_ENUM(_MSG_T, msg))
{
  if (_MSG_ARR[msg].state == _MSG_ST_PROC) {
    _MSG_ARR[msg].state = _MSG_ST_NONE;
    return true;
  }
  return false;
}

#if MSG_OPT_PARAM
static inline void SendMessageParam(_MSG_T msg, uint32_t *pParam)
#define SendMessageParam(msg,param) SendMessageParam(_MSG_ENUM(_MSG_T, msg),param)
{
  _MSG_ARR[msg].state = _MSG_ST_SEND;
  _MSG_ARR[msg].pParam = NULL;
}

static inline uint32_t GetMessageParam(_MSG_T msg)
#define GetMessageParam(msg) GetMessageParam(_MSG_ENUM(_MSG_T, msg))
{
  if (_MSG_ARR[msg].state == _MSG_ST_PROC) {
    _MSG_ARR[msg].state = _MSG_ST_NONE;
    return _MSG_ARR[msg].pParam;
  }
  return NULL;
}
#endif

static inline void ProcessMessages() {
  for (_MSG_T i = 0; i < _MSG_COUNT; i++) {
    if (_MSG_ARR[i].state > _MSG_ST_NONE) {
      _MSG_ARR[i].state--;
    }
  }
}
#endif // MESSAGES_HELPER_H

