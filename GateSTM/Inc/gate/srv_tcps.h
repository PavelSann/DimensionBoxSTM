
/* 
 * File:   ipcon.h
 * Author: PavelSann(ExIngus@gmail.com)
 *
 * Created on 20 декабря 2017 г., 8:24
 */

#ifndef SRV_TCPS_H
#define SRV_TCPS_H

#ifdef __cplusplus
extern "C" {
#endif
#include <stdint.h>
#include "netif.h"
#include "srv_packet.h"

  typedef enum {
    /** Operation in progress    */
    TCPS_ERR_INPROGRESS = 1,
    /** No error, everything OK. */
    TCPS_ERR_OK = 0,
    /** Out of memory error.     */
    TCPS_ERR_MEM = -1,
    /** Illegal operation     */
    TCPS_ERR_OPERATION = -1,
    /** not connect lan     */
    TCPS_ERR_NOT_LINK_UP = -2,
    /**not connect IP*/
    TCPS_ERR_DHCP_SUPPLIED_IP = -3,
  } TCPS_Error;

  //  typedef void (*TCPS_ConnectedCallbackFn)();
  //  typedef void (*TCPS_ReceivePacketCallbackFn)(SRV_PacketHeader * pHead,uint8_t *payload);
  //  typedef uint32_t (*TCPS_CalcCRCFn)(void *data, uint16_t len);

  typedef struct {
    struct netif *pNetif;
    //    TCPS_CalcCRCFn *pCalcCRCFn;


  } TCPS_InitStruct;



  void TCPS_Init(TCPS_InitStruct init);

  TCPS_Error TCPS_StartSession();

  void TCPS_Process();


#ifdef __cplusplus
}
#endif

#endif /* IPCON_H */

