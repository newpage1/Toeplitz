@echo off
rem  Vivado(TM)
rem  compile.bat: a Vivado-generated XSim simulation Script
rem  Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.

set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;C:/Xlinx_2014.2/SDK/2014.2/bin;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/lib/nt64;C:/Xlinx_2014.2/Vivado/2014.2/bin;%PATH%
set XILINX_PLANAHEAD=C:/Xlinx_2014.2/Vivado/2014.2

xelab -m64 --debug typical --relax -L xil_defaultlib -L blk_mem_gen_v8_2 -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_sum_row_behav --prj E:/Xilinx_Vivado_SDK_Win_2014.2_0612_1/vivado_projects/toeplitz/toeplitz.sim/sim_1/behav/tb_sum_row.prj   xil_defaultlib.tb_sum_row   xil_defaultlib.glbl
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
