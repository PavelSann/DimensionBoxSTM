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
CND_CONF=Release
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
	${OBJECTDIR}/_ext/8f63f4c/transceiver.o \
	${OBJECTDIR}/_ext/8f63f4c/xprint.o \
	${OBJECTDIR}/_ext/8f63f4c/xprintf.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o \
	${OBJECTDIR}/Src/main.o \
	${OBJECTDIR}/Src/stm32l1xx_hal_msp.o \
	${OBJECTDIR}/Src/stm32l1xx_it.o \
	${OBJECTDIR}/Src/system_stm32l1xx.o \
	${OBJECTDIR}/Src/tcp_connector.o \
	${OBJECTDIR}/startup/startup_stm32l152xe.o


# C Compiler Flags
CFLAGS=-mcpu=cortex-m3 -mthumb -mfloat-abi=soft -Os -g3 -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP

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
	arm-none-eabi-gcc -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/stm32l1 ${OBJECTFILES} ${LDLIBSOPTIONS} -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -specs=nosys.specs -specs=nano.specs -TSTM32L152RETx_FLASH.ld -Wl,-Map=output.map -Wl,--gc-sections -lm

${OBJECTDIR}/_ext/8f63f4c/package_queue.o: ../Library/package_queue.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/package_queue.o ../Library/package_queue.c

${OBJECTDIR}/_ext/8f63f4c/trans_package.o: ../Library/trans_package.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/trans_package.o ../Library/trans_package.c

${OBJECTDIR}/_ext/8f63f4c/transceiver.o: ../Library/transceiver.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/transceiver.o ../Library/transceiver.c

${OBJECTDIR}/_ext/8f63f4c/xprint.o: ../Library/xprint.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/xprint.o ../Library/xprint.c

${OBJECTDIR}/_ext/8f63f4c/xprintf.o: ../Library/xprintf.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/_ext/8f63f4c
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/8f63f4c/xprintf.o ../Library/xprintf.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.c

${OBJECTDIR}/Src/main.o: Src/main.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/main.o Src/main.c

${OBJECTDIR}/Src/stm32l1xx_hal_msp.o: Src/stm32l1xx_hal_msp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32l1xx_hal_msp.o Src/stm32l1xx_hal_msp.c

${OBJECTDIR}/Src/stm32l1xx_it.o: Src/stm32l1xx_it.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32l1xx_it.o Src/stm32l1xx_it.c

${OBJECTDIR}/Src/system_stm32l1xx.o: Src/system_stm32l1xx.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/system_stm32l1xx.o Src/system_stm32l1xx.c

${OBJECTDIR}/Src/tcp_connector.o: Src/tcp_connector.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -IInc -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -I../Library -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/tcp_connector.o Src/tcp_connector.c

${OBJECTDIR}/startup/startup_stm32l152xe.o: startup/startup_stm32l152xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/startup
	$(AS) $(ASFLAGS) -o ${OBJECTDIR}/startup/startup_stm32l152xe.o startup/startup_stm32l152xe.s

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
