// This is an independent project of an individual developer. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/**
 * @file    S2LP_Types.c
 * @author  LowPower RF BU - AMG
 * @version 1.3.0
 * @date    10-July-2017
 * @brief   This file provides functions to manage S2-LP debug.
 * @details
 *
 * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
 * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
 * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
 * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
 * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
 * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
 *
 * THIS SOURCE CODE IS PROTECTED BY A LICENSE.
 * FOR MORE INFORMATION PLEASE CAREFULLY READ THE LICENSE AGREEMENT FILE LOCATED
 * IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
 *
 * <h2><center>&copy; COPYRIGHT 2016 STMicroelectronics</center></h2>
 *
 */

/* Includes ------------------------------------------------------------------*/
#include "S2LP_Types.h"
#include "S2LP_Regs.h"
#include "MCU_Interface.h"


/** @addtogroup S2LP_Libraries
 * @{
 */


/** @addtogroup S2LP_Types
 * @{
 */


/** @defgroup Types_Private_TypesDefinitions    Types Private Types Definitions
 * @{
 */


/**
 * @}
 */



/** @defgroup Types_Private_Defines             Types Private Defines
 * @{
 */


/**
 * @}
 */



/** @defgroup Types_Private_Macros               Types Private Macros
 * @{
 */


/**
 * @}
 */



/** @defgroup Types_Private_Variables             Types Private Variables
 * @{
 */

/**
 * @brief  S2LP Status global variable.
 *         This global variable of @ref S2LPStatus type is updated on every SPI transaction
 *         to maintain memory of S2LP Status.
 */
volatile S2LPStatus g_xStatus;

/**
 * @}
 */



/** @defgroup Types_Private_FunctionPrototypes       Types Private FunctionPrototypes
 * @{
 */



/**
 * @}
 */



/** @defgroup Types_Private_Functions                 Types Private Functions
 * @{
 */

#ifdef  S2LP_USE_FULL_ASSERT

/**
 * @brief  Reports the name of the source file and the source line number
 *         where the assert_param error has occurred.
 * @param file  pointer to the source file name
 * @param line  assert_param error line source number
 * @retval : None
 */
void s_assert_failed(uint8_t* file, uint32_t line) {
  /* User can add his own implementation to report the file name and line number */
  printf("Wrong parameters value: file %s on line %d\r\n", file, line);

  /* Infinite loop */
  while (1) {
  }
}
#endif

/**
 * @brief  Updates the gState (the global variable used to maintain memory of S2LP Status)
 *         reading the MC_STATE register of S2LP.
 * @param  None
 * @retval None
 */
void S2LPRefreshStatus(void) {
  uint8_t tmp;
  uint8_t tempRegValue[2];
  /* Read the status both from register and from SPI header and exit when they match.
      This will protect against possible transition state changes */
  do {
    /* Reads the MC_STATUS register to update the g_xStatus */
    g_xStatus = S2LPSpiReadRegisters(MC_STATE1_ADDR, 2, tempRegValue);
    tmp = tempRegValue[0];
    tempRegValue[0] = tempRegValue[1];
    tempRegValue[1] = tmp;

  } while (!((((uint8_t*) & g_xStatus)[0]) == tempRegValue[0] &&(((uint8_t*) & g_xStatus)[1]&0x07) == tempRegValue[1]));

}


/**
 * @}
 */



/**
 * @}
 */



/**
 * @}
 */



/******************* (C) COPYRIGHT 2016 STMicroelectronics *****END OF FILE****/
