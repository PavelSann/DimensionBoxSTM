
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

  typedef enum {
    /** Operation in progress    */
    TCPS_ERR_INPROGRESS = 1,
    /** No error, everything OK. */
    TCPS_ERR_OK = 0,
    /** Out of memory error.     */
    TCPS_ERR_MEM = -1,
    /** Illegal operation     */
    TCPS_ERR_OPERATION = -1,



  } TCPSError;


  void TCPS_Init();

  TCPSError TCPS_StartSession();

  void TCPS_Process();


#ifdef __cplusplus
}
#endif

#endif /* IPCON_H */

