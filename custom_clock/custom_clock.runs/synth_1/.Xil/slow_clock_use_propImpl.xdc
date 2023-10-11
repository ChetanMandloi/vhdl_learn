set_property SRC_FILE_INFO {cfile:/home/dhep/vivado_proj/custom_clock/custom_clock.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc rfile:../../../custom_clock.srcs/constrs_1/imports/digilent-xdc-master/Nexys-A7-100T-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { CLK100MHZ }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}];
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { led }]; #IO_L18P_T2_A24_15 Sch=led[0]
