transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {/home/dhep/vivado_proj/async_d_ff_Cloking/async_d_ff_Cloking.cache/compile_simlib/riviera}
vlib riviera/xpm
vlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../async_d_ff_Cloking.gen/sources_1/bd/design_1/ipshared/30ef" -l xpm -l xil_defaultlib \
"/tools/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"/tools/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/sim/design_1.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

