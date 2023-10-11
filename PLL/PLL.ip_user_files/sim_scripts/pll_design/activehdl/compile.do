transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {}
vlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../PLL.gen/sources_1/bd/pll_design/ipshared/30ef" -l xil_defaultlib \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/pll_design/sim/pll_design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

