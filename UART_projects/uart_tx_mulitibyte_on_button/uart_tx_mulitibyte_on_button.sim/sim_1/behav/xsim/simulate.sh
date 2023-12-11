#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2023.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Fri Dec 08 10:19:53 IST 2023
# SW Build 3865809 on Sun May  7 15:04:56 MDT 2023
#
# IP Build 3864474 on Sun May  7 20:36:21 MDT 2023
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim tb_uart_tx_behav -key {Behavioral:sim_1:Functional:tb_uart_tx} -tclbatch tb_uart_tx.tcl -view /home/dhep/GitRepos/vhdl_learn2/UART_projects/uart_tx_mulitibyte_on_button/tb_uart_tx_behav1.wcfg -log simulate.log"
xsim tb_uart_tx_behav -key {Behavioral:sim_1:Functional:tb_uart_tx} -tclbatch tb_uart_tx.tcl -view /home/dhep/GitRepos/vhdl_learn2/UART_projects/uart_tx_mulitibyte_on_button/tb_uart_tx_behav1.wcfg -log simulate.log
