#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2023.1/bin
else
  PATH=/tools/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2023.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/dhep/GitRepos/vhdl_learn/UART_projects/uart_tx_mulitibyte_on_button/uart_tx_mulitibyte_on_button.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .write_bitstream.begin.rst
EAStep vivado -log uart_tx.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source uart_tx.tcl -notrace

