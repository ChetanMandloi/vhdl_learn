vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../PLL.gen/sources_1/bd/pll_design/ipshared/30ef" \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -64 -93  \
"../../../bd/pll_design/sim/pll_design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

