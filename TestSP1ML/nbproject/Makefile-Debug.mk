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
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Aes.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Calibration.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Commands.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Csma.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_DirectRF.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_General.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Gpio.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Irq.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_LinearFifo.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Management.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktBasic.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktCommon.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktMbus.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktStack.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Qi.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Radio.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Timer.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Types.o \
	${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src/SPIRIT1_Util.o \
	${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_gpio.o \
	${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_shield_config.o \
	${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_spi.o \
	${OBJECTDIR}/Drivers/BSP/SP1ML/Src/sp1ml.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f64.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f64.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_float.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_float.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q7.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_float.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_bitreversal.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix8_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_f32.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q15.o \
	${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q31.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xb.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xba.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xc.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xca.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xd.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xdx.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xe.o \
	${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/system_stm32l1xx.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_comp.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_crc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2s.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_irda.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_iwdg.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_lcd.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_msp_template.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_nor.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sd.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_smartcard.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sram.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_usart.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_wwdg.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_fsmc.o \
	${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_sdmmc.o \
	${OBJECTDIR}/Src/gpio.o \
	${OBJECTDIR}/Src/i2c.o \
	${OBJECTDIR}/Src/main.o \
	${OBJECTDIR}/Src/rtc.o \
	${OBJECTDIR}/Src/spi.o \
	${OBJECTDIR}/Src/spirit1_appli.o \
	${OBJECTDIR}/Src/stm32l1xx_hal_msp.o \
	${OBJECTDIR}/Src/stm32l1xx_it.o \
	${OBJECTDIR}/Src/usart.o


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
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sp1ml.exe

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sp1ml.exe: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/sp1ml ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Aes.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Aes.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Aes.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Aes.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Calibration.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Calibration.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Calibration.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Calibration.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Commands.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Commands.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Commands.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Commands.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Csma.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Csma.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Csma.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Csma.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_DirectRF.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_DirectRF.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_DirectRF.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_DirectRF.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_General.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_General.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_General.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_General.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Gpio.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Gpio.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Gpio.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Irq.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Irq.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Irq.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Irq.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_LinearFifo.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_LinearFifo.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_LinearFifo.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_LinearFifo.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Management.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Management.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Management.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Management.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktBasic.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktBasic.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktBasic.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktBasic.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktCommon.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktCommon.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktCommon.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktCommon.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktMbus.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktMbus.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktMbus.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktMbus.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktStack.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktStack.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktStack.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_PktStack.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Qi.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Qi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Qi.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Qi.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Radio.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Radio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Radio.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Radio.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Timer.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Timer.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Timer.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Timer.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Types.o: Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Types.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Types.o Drivers/BSP/Components/spirit1/SPIRIT1_Library/Src/SPIRIT_Types.c

${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src/SPIRIT1_Util.o: Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src/SPIRIT1_Util.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src/SPIRIT1_Util.o Drivers/BSP/Components/spirit1/SPIRIT1_Util/Src/SPIRIT1_Util.c

${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_gpio.o: Drivers/BSP/SP1ML-RADIO/Src/radio_gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_gpio.o Drivers/BSP/SP1ML-RADIO/Src/radio_gpio.c

${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_shield_config.o: Drivers/BSP/SP1ML-RADIO/Src/radio_shield_config.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_shield_config.o Drivers/BSP/SP1ML-RADIO/Src/radio_shield_config.c

${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_spi.o: Drivers/BSP/SP1ML-RADIO/Src/radio_spi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/SP1ML-RADIO/Src/radio_spi.o Drivers/BSP/SP1ML-RADIO/Src/radio_spi.c

${OBJECTDIR}/Drivers/BSP/SP1ML/Src/sp1ml.o: Drivers/BSP/SP1ML/Src/sp1ml.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/BSP/SP1ML/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/BSP/SP1ML/Src/sp1ml.o Drivers/BSP/SP1ML/Src/sp1ml.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_abs_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_add_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_dot_prod_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_mult_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_negate_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_offset_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_scale_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_shift_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_f32.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_f32.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q15.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q15.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q31.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q31.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q7.o: Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q7.o Drivers/CMSIS/DSP_Lib/Source/BasicMathFunctions/arm_sub_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.o: Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.o Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.o: Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.o Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_const_structs.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_conj_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_dot_prod_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mag_squared_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_cmplx_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.o: Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.o Drivers/CMSIS/DSP_Lib/Source/ComplexMathFunctions/arm_cmplx_mult_real_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_f32.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q15.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q31.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_f32.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_f32.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q15.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q15.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q31.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q31.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_pid_reset_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_f32.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_f32.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_q31.o: Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_q31.o Drivers/CMSIS/DSP_Lib/Source/ControllerFunctions/arm_sin_cos_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q15.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q15.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q31.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q31.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q15.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q15.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q31.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q31.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q15.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q31.o: Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q31.o Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sqrt_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_32x64_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df1_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f64.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f64.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f64.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_f64.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_df2T_init_f64.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_biquad_cascade_stereo_df2T_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_opt_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_opt_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_partial_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_conv_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_opt_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_correlate_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_decimate_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_init_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_interpolate_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_lattice_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_init_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q7.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q7.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_fir_sparse_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_iir_lattice_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_f32.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_norm_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q15.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q15.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q31.o: Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q31.o Drivers/CMSIS/DSP_Lib/Source/FilteringFunctions/arm_lms_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_add_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_cmplx_mult_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f64.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f64.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f64.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_inverse_f64.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_fast_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_mult_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_scale_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_sub_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_f32.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_f32.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q15.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q15.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q31.o: Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q31.o Drivers/CMSIS/DSP_Lib/Source/MatrixFunctions/arm_mat_trans_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q7.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q7.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_max_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q7.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q7.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_mean_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q7.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q7.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_min_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q7.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q7.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_power_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_rms_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_std_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_f32.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_f32.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q15.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q15.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q31.o: Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q31.o Drivers/CMSIS/DSP_Lib/Source/StatisticsFunctions/arm_var_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_f32.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_f32.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q15.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q15.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q31.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q31.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q7.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q7.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_copy_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_f32.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_f32.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q15.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q15.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q31.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q31.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q7.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q7.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_fill_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q15.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q15.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q31.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q31.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q7.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q7.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_float_to_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_float.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_float.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_float.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_float.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q31.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q31.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q7.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q7.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q15_to_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_float.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_float.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_float.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_float.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q15.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q15.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q7.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q7.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q7.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q31_to_q7.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_float.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_float.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_float.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_float.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q15.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q15.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q31.o: Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q31.o Drivers/CMSIS/DSP_Lib/Source/SupportFunctions/arm_q7_to_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_bitreversal.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_bitreversal.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_bitreversal.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_bitreversal.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix2_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix4_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix8_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix8_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix8_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_cfft_radix8_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_dct4_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_init_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_fast_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_f32.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_f32.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_f32.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_f32.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_init_q31.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q15.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q15.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q15.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q15.c

${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q31.o: Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q31.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q31.o Drivers/CMSIS/DSP_Lib/Source/TransformFunctions/arm_rfft_q31.c

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l100xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l151xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l152xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/arm/startup_stm32l162xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l100xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l151xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l152xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/gcc/startup_stm32l162xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l100xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l151xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xb.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xb.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xb.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xb.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xba.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xba.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xba.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xba.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l152xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xc.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xc.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xc.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xc.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xca.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xca.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xca.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xca.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xd.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xd.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xd.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xd.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xdx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xdx.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xdx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xdx.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xe.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xe.s nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar
	$(AS) $(ASFLAGS) -g -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xe.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/iar/startup_stm32l162xe.s

${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/system_stm32l1xx.o: Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/system_stm32l1xx.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/system_stm32l1xx.o Drivers/CMSIS/Device/ST/STM32L1xx/Source/Templates/system_stm32l1xx.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_adc_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_comp.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_comp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_comp.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_comp.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cortex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_crc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_crc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_crc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_crc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_cryp_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dac_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_dma.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_flash_ramfunc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_gpio.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2c.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2s.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2s.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2s.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_i2s.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_irda.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_irda.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_irda.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_irda.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_iwdg.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_iwdg.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_iwdg.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_iwdg.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_lcd.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_lcd.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_lcd.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_lcd.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_msp_template.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_msp_template.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_msp_template.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_msp_template.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_nor.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_nor.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_nor.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_nor.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_opamp_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pcd_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_pwr_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rcc_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_rtc_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sd.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sd.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sd.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sd.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_smartcard.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_smartcard.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_smartcard.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_smartcard.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_spi_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sram.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sram.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sram.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_sram.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_tim_ex.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_uart.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_usart.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_usart.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_usart.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_usart.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_wwdg.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_wwdg.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_wwdg.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_hal_wwdg.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_fsmc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_fsmc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_fsmc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_fsmc.c

${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_sdmmc.o: Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_sdmmc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_sdmmc.o Drivers/STM32L1xx_HAL_Driver/Src/stm32l1xx_ll_sdmmc.c

${OBJECTDIR}/Src/gpio.o: Src/gpio.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/gpio.o Src/gpio.c

${OBJECTDIR}/Src/i2c.o: Src/i2c.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/i2c.o Src/i2c.c

${OBJECTDIR}/Src/main.o: Src/main.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/main.o Src/main.c

${OBJECTDIR}/Src/rtc.o: Src/rtc.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/rtc.o Src/rtc.c

${OBJECTDIR}/Src/spi.o: Src/spi.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/spi.o Src/spi.c

${OBJECTDIR}/Src/spirit1_appli.o: Src/spirit1_appli.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/spirit1_appli.o Src/spirit1_appli.c

${OBJECTDIR}/Src/stm32l1xx_hal_msp.o: Src/stm32l1xx_hal_msp.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32l1xx_hal_msp.o Src/stm32l1xx_hal_msp.c

${OBJECTDIR}/Src/stm32l1xx_it.o: Src/stm32l1xx_it.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/stm32l1xx_it.o Src/stm32l1xx_it.c

${OBJECTDIR}/Src/usart.o: Src/usart.c nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} -p ${OBJECTDIR}/Src
	${RM} "$@.d"
	$(COMPILE.c) -g -Wall -DARM_MATH_CM3 -DSTM32L152xE -DUSE_HAL_DRIVER -DUSE_SP1ML -IDrivers/BSP/Components/spirit1/SPIRIT1_Library/Inc -IDrivers/BSP/Components/spirit1/SPIRIT1_Util/Inc -IDrivers/BSP/SP1ML/Inc -IDrivers/BSP/SP1ML-RADIO/Inc -IDrivers/CMSIS/Device/ST/STM32L1xx/Include -IDrivers/CMSIS/Include -IDrivers/CMSIS/RTOS/Template -IDrivers/STM32L1xx_HAL_Driver/Inc -IDrivers/STM32L1xx_HAL_Driver/Inc/Legacy -IInc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Src/usart.o Src/usart.c

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
