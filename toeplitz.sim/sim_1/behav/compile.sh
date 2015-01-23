#!/bin/sh
# Vivado(TM)
# compile.sh: Vivado-generated Script for launching XSim application
# Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
# 
if [ -z "$PATH" ]; then
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:C:/Xlinx_2014.2/SDK/2014.2/bin;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/lib/nt64
else
  PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%:C:/Xlinx_2014.2/SDK/2014.2/bin;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/bin/nt64;C:/Xlinx_2014.2/Vivado/2014.2/ids_lite/ISE/lib/nt64:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=:
else
  LD_LIBRARY_PATH=::$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

#
# Setup env for Xilinx simulation libraries
#
XILINX_PLANAHEAD=C:/Xlinx_2014.2/Vivado/2014.2
export XILINX_PLANAHEAD
ExecStep()
{
   "$@"
   RETVAL=$?
   if [ $RETVAL -ne 0 ]
   then
       exit $RETVAL
   fi
}

ExecStep xelab -m64 --debug typical --relax -L xil_defaultlib -L blk_mem_gen_v8_2 -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_sum_row_behav --prj E:/Xilinx_Vivado_SDK_Win_2014.2_0612_1/vivado_projects/toeplitz/toeplitz.sim/sim_1/behav/tb_sum_row.prj   xil_defaultlib.tb_sum_row   xil_defaultlib.glbl
