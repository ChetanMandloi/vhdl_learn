transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {/home/dhep/vivado_proj/PLL/PLL.cache/compile_simlib/riviera}
vlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../PLL.gen/sources_1/bd/pll_design/ipshared/30ef" -l xil_defaultlib \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/pll_design/ip/pll_design_clk_wiz_0_0/pll_design_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/pll_design/sim/pll_design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

