#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=arm-none-eabi-gcc
CCC=arm-none-eabi-c++
CXX=arm-none-eabi-c++
FC=gfortran
AS=arm-none-eabi-as

# Macros
CND_PLATFORM=GNUToolsARMEmbedded-Windows
CND_DLIB_EXT=dll
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/8f63f4c/package_queue.o \
	${OBJECTDIR}/_ext/8f63f4c/trans_package.o \
	${OBJECTDIR}/_ext/8f63f4c/xprint.o \
	${OBJECTDIR}/_ext/8f63f4c/xprintf.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_cortex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_crc.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_eth.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_gpio.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim_ex.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_uart.o \
	${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_ll_usb.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_lib.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_msg.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/err.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netbuf.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netdb.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netifapi.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/sockets.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/tcpip.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/def.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/dns.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/inet_chksum.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/init.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ip.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/mem.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/memp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/netif.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/pbuf.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/raw.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/stats.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/sys.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_in.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_out.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/timeouts.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/udp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ethernet.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/lowpan6.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/demand.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eap.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/arc4.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/des.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md4.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md5.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/sha1.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/upap.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/utils.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o \
	${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/slipif.o \
	${OBJECTDIR}/Src/ethernetif.o \
	${OBJECTDIR}/Src/lwip.o \
	${OBJECTDIR}/Src/main.o \
	${OBJECTDIR}/Src/stm32f2xx_hal_msp.o \
	${OBJECTDIR}/Src/stm32f2xx_it.o \
	${OBJECTDIR}/Src/system_stm32f2xx.o \
	${OBJECTDIR}/startup/startup_stm32f207xx.o


# C Compiler Flags
CFLAGS=-Og -ggdb3 -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -ffunction-sections -c -MMD -MP

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stm32l1.exe

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stm32l1.exe: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	arm-none-eabi-gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stm32l1 ${OBJECTFILES} ${LDLIBSOPTIONS} -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -specs=nosys.specs -specs=nano.specs -TSTM32F207ZGTx_FLASH.ld -Wl,-Map=output.map -Wl,--gc-sections -lm

${OBJECTDIR}/_ext/8f63f4c/package_queue.o: ../Library/package_queue.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/package_queue.o ../Library/package_queue.c

${OBJECTDIR}/_ext/8f63f4c/trans_package.o: ../Library/trans_package.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/trans_package.o ../Library/trans_package.c

${OBJECTDIR}/_ext/8f63f4c/xprint.o: ../Library/xprint.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/xprint.o ../Library/xprint.c

${OBJECTDIR}/_ext/8f63f4c/xprintf.o: ../Library/xprintf.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/xprintf.o ../Library/xprintf.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_cortex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_cortex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_cortex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_cortex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_crc.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_crc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_crc.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_crc.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_dma_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_eth.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_eth.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_eth.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_eth.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_flash_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_gpio.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_gpio.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_gpio.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pcd_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_pwr_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_rcc_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim_ex.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim_ex.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_tim_ex.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_uart.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_uart.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_uart.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_hal_uart.c

${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_ll_usb.o: Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_ll_usb.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_ll_usb.o Drivers/STM32F2xx_HAL_Driver/Src/stm32f2xx_ll_usb.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_lib.o: Middlewares/Third_Party/LwIP/src/api/api_lib.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_lib.o Middlewares/Third_Party/LwIP/src/api/api_lib.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_msg.o: Middlewares/Third_Party/LwIP/src/api/api_msg.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/api_msg.o Middlewares/Third_Party/LwIP/src/api/api_msg.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/err.o: Middlewares/Third_Party/LwIP/src/api/err.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/err.o Middlewares/Third_Party/LwIP/src/api/err.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netbuf.o: Middlewares/Third_Party/LwIP/src/api/netbuf.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netbuf.o Middlewares/Third_Party/LwIP/src/api/netbuf.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netdb.o: Middlewares/Third_Party/LwIP/src/api/netdb.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netdb.o Middlewares/Third_Party/LwIP/src/api/netdb.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netifapi.o: Middlewares/Third_Party/LwIP/src/api/netifapi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/netifapi.o Middlewares/Third_Party/LwIP/src/api/netifapi.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/sockets.o: Middlewares/Third_Party/LwIP/src/api/sockets.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/sockets.o Middlewares/Third_Party/LwIP/src/api/sockets.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/tcpip.o: Middlewares/Third_Party/LwIP/src/api/tcpip.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/api/tcpip.o Middlewares/Third_Party/LwIP/src/api/tcpip.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/def.o: Middlewares/Third_Party/LwIP/src/core/def.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/def.o Middlewares/Third_Party/LwIP/src/core/def.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/dns.o: Middlewares/Third_Party/LwIP/src/core/dns.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/dns.o Middlewares/Third_Party/LwIP/src/core/dns.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/inet_chksum.o: Middlewares/Third_Party/LwIP/src/core/inet_chksum.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/inet_chksum.o Middlewares/Third_Party/LwIP/src/core/inet_chksum.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/init.o: Middlewares/Third_Party/LwIP/src/core/init.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/init.o Middlewares/Third_Party/LwIP/src/core/init.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ip.o: Middlewares/Third_Party/LwIP/src/core/ip.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ip.o Middlewares/Third_Party/LwIP/src/core/ip.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o: Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.o Middlewares/Third_Party/LwIP/src/core/ipv4/autoip.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.o: Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.o Middlewares/Third_Party/LwIP/src/core/ipv4/dhcp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.o: Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.o Middlewares/Third_Party/LwIP/src/core/ipv4/etharp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o: Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.o Middlewares/Third_Party/LwIP/src/core/ipv4/icmp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o: Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.o Middlewares/Third_Party/LwIP/src/core/ipv4/igmp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.o: Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.o Middlewares/Third_Party/LwIP/src/core/ipv4/ip4.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.o: Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.o Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_addr.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.o: Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.o Middlewares/Third_Party/LwIP/src/core/ipv4/ip4_frag.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.o Middlewares/Third_Party/LwIP/src/core/ipv6/dhcp6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.o Middlewares/Third_Party/LwIP/src/core/ipv6/ethip6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.o Middlewares/Third_Party/LwIP/src/core/ipv6/icmp6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.o Middlewares/Third_Party/LwIP/src/core/ipv6/inet6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.o Middlewares/Third_Party/LwIP/src/core/ipv6/ip6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.o: Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.o Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_addr.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.o: Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.o Middlewares/Third_Party/LwIP/src/core/ipv6/ip6_frag.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.o Middlewares/Third_Party/LwIP/src/core/ipv6/mld6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.o: Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.o Middlewares/Third_Party/LwIP/src/core/ipv6/nd6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/mem.o: Middlewares/Third_Party/LwIP/src/core/mem.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/mem.o Middlewares/Third_Party/LwIP/src/core/mem.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/memp.o: Middlewares/Third_Party/LwIP/src/core/memp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/memp.o Middlewares/Third_Party/LwIP/src/core/memp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/netif.o: Middlewares/Third_Party/LwIP/src/core/netif.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/netif.o Middlewares/Third_Party/LwIP/src/core/netif.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/pbuf.o: Middlewares/Third_Party/LwIP/src/core/pbuf.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/pbuf.o Middlewares/Third_Party/LwIP/src/core/pbuf.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/raw.o: Middlewares/Third_Party/LwIP/src/core/raw.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/raw.o Middlewares/Third_Party/LwIP/src/core/raw.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/stats.o: Middlewares/Third_Party/LwIP/src/core/stats.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/stats.o Middlewares/Third_Party/LwIP/src/core/stats.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/sys.o: Middlewares/Third_Party/LwIP/src/core/sys.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/sys.o Middlewares/Third_Party/LwIP/src/core/sys.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp.o: Middlewares/Third_Party/LwIP/src/core/tcp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp.o Middlewares/Third_Party/LwIP/src/core/tcp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_in.o: Middlewares/Third_Party/LwIP/src/core/tcp_in.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_in.o Middlewares/Third_Party/LwIP/src/core/tcp_in.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_out.o: Middlewares/Third_Party/LwIP/src/core/tcp_out.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/tcp_out.o Middlewares/Third_Party/LwIP/src/core/tcp_out.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/timeouts.o: Middlewares/Third_Party/LwIP/src/core/timeouts.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/timeouts.o Middlewares/Third_Party/LwIP/src/core/timeouts.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/udp.o: Middlewares/Third_Party/LwIP/src/core/udp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/core/udp.o Middlewares/Third_Party/LwIP/src/core/udp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ethernet.o: Middlewares/Third_Party/LwIP/src/netif/ethernet.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ethernet.o Middlewares/Third_Party/LwIP/src/netif/ethernet.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/lowpan6.o: Middlewares/Third_Party/LwIP/src/netif/lowpan6.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/lowpan6.o Middlewares/Third_Party/LwIP/src/netif/lowpan6.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o: Middlewares/Third_Party/LwIP/src/netif/ppp/auth.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/auth.o Middlewares/Third_Party/LwIP/src/netif/ppp/auth.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.o Middlewares/Third_Party/LwIP/src/netif/ppp/ccp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.o: Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.o Middlewares/Third_Party/LwIP/src/netif/ppp/chap-md5.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.o: Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.o Middlewares/Third_Party/LwIP/src/netif/ppp/chap-new.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.o: Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.o Middlewares/Third_Party/LwIP/src/netif/ppp/chap_ms.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/demand.o: Middlewares/Third_Party/LwIP/src/netif/ppp/demand.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/demand.o Middlewares/Third_Party/LwIP/src/netif/ppp/demand.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eap.o: Middlewares/Third_Party/LwIP/src/netif/ppp/eap.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eap.o Middlewares/Third_Party/LwIP/src/netif/ppp/eap.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.o Middlewares/Third_Party/LwIP/src/netif/ppp/ecp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.o: Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.o Middlewares/Third_Party/LwIP/src/netif/ppp/eui64.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o: Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.o Middlewares/Third_Party/LwIP/src/netif/ppp/fsm.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.o Middlewares/Third_Party/LwIP/src/netif/ppp/ipcp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.o Middlewares/Third_Party/LwIP/src/netif/ppp/ipv6cp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.o Middlewares/Third_Party/LwIP/src/netif/ppp/lcp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o: Middlewares/Third_Party/LwIP/src/netif/ppp/magic.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/magic.o Middlewares/Third_Party/LwIP/src/netif/ppp/magic.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.o: Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.o Middlewares/Third_Party/LwIP/src/netif/ppp/mppe.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.o: Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.o Middlewares/Third_Party/LwIP/src/netif/ppp/multilink.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/arc4.o: Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/arc4.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/arc4.o Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/arc4.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/des.o: Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/des.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/des.o Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/des.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md4.o: Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md4.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md4.o Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md4.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md5.o: Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md5.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md5.o Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/md5.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/sha1.o: Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/sha1.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/sha1.o Middlewares/Third_Party/LwIP/src/netif/ppp/polarssl/sha1.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.o Middlewares/Third_Party/LwIP/src/netif/ppp/ppp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.o: Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.o Middlewares/Third_Party/LwIP/src/netif/ppp/pppapi.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.o: Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.o Middlewares/Third_Party/LwIP/src/netif/ppp/pppcrypt.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.o: Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.o Middlewares/Third_Party/LwIP/src/netif/ppp/pppoe.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.o: Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.o Middlewares/Third_Party/LwIP/src/netif/ppp/pppol2tp.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.o: Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.o Middlewares/Third_Party/LwIP/src/netif/ppp/pppos.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/upap.o: Middlewares/Third_Party/LwIP/src/netif/ppp/upap.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/upap.o Middlewares/Third_Party/LwIP/src/netif/ppp/upap.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/utils.o: Middlewares/Third_Party/LwIP/src/netif/ppp/utils.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/utils.o Middlewares/Third_Party/LwIP/src/netif/ppp/utils.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o: Middlewares/Third_Party/LwIP/src/netif/ppp/vj.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/ppp/vj.o Middlewares/Third_Party/LwIP/src/netif/ppp/vj.c

${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/slipif.o: Middlewares/Third_Party/LwIP/src/netif/slipif.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Middlewares/Third_Party/LwIP/src/netif/slipif.o Middlewares/Third_Party/LwIP/src/netif/slipif.c

${OBJECTDIR}/Src/ethernetif.o: Src/ethernetif.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/ethernetif.o Src/ethernetif.c

${OBJECTDIR}/Src/lwip.o: Src/lwip.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/lwip.o Src/lwip.c

${OBJECTDIR}/Src/main.o: Src/main.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/main.o Src/main.c

${OBJECTDIR}/Src/stm32f2xx_hal_msp.o: Src/stm32f2xx_hal_msp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32f2xx_hal_msp.o Src/stm32f2xx_hal_msp.c

${OBJECTDIR}/Src/stm32f2xx_it.o: Src/stm32f2xx_it.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32f2xx_it.o Src/stm32f2xx_it.c

${OBJECTDIR}/Src/system_stm32f2xx.o: Src/system_stm32f2xx.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32F207xx -DUSE_FULL_ASSERT -DUSE_HAL_DRIVER -IInc -IDrivers/STM32F2xx_HAL_Driver/Inc -IDrivers/STM32F2xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F2xx/Include -IDrivers/CMSIS/Include -I../Library -IMiddlewares/Third_Party/LwIP/src/include -IMiddlewares/Third_Party/LwIP/system -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/system_stm32f2xx.o Src/system_stm32f2xx.c

${OBJECTDIR}/startup/startup_stm32f207xx.o: startup/startup_stm32f207xx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/startup
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/startup/startup_stm32f207xx.o startup/startup_stm32f207xx.s

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
