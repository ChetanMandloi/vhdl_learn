// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Fri Sep 29 09:47:12 2023
// Host        : dhep-sipm running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/dhep/vivado_proj/project_1_wave_gen/project_1_wave_gen.gen/sources_1/ip/char_fifo/char_fifo_sim_netlist.v
// Design      : char_fifo
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "char_fifo,fifo_generator_v13_2_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_8,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module char_fifo
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  char_fifo_fifo_generator_v13_2_8 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module char_fifo_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module char_fifo_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module char_fifo_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module char_fifo_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module char_fifo_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module char_fifo_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 118576)
`pragma protect data_block
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
CaKkvHeOoLo0ki9aCvRXOAS4LywHjlyU633NS57SkoxWV/JCmbKuJVfSJzlaNtxCvu0kwNCuMV8P
qVw1im/limL+23je6egrENsPpU1Q8TU/Jyz5K6VTCcWLJy7h82oKSLTmIddDn+a1uIWW7kqJVz6L
TGdmr74Eut5MfRnHJEX6CZ3uPFeh/tdcFl8z5S9x3bB40CRrYg9fP9RI+zXHAuYFpNJv/SomK7AL
QNUMUmJQ0Q7YLjc5H5ibYmuFSF1wWTYJnqjdgp0wa2J3aNJkXFZIy0ddrEcmCjAOGP7grOlqP2W/
lpnPnwwuOYL4OdjNSHTelrRFlGVXh6AEHQf1Dgl/p/S0bqJUCw8GyCfr8Tp7ETWHKFQZB4FGsvXH
BGy/B8kibCzqR2hvQp9E8jlRJVSv5/qECzmLKJtmX/rsLCnFZZ1PXcv3v/rNJGogTyjXNc1wG8hB
xREu6Yb6QKG9zs+HCWXz2gRQMVprbSzIiMxOvNHKXAqlNHIzdnFGJAbBHqc/9HMlud4SDQNIm3pd
l3jIJ/9Sx+v/by6sV7v21Gkf6EQpvunKqM3jg+LUDbpmWCCm6xkt1pIbg+MfVhfGLMCVjk8Ud0uH
dpllkiBcAKiDfsg4FaI09ob06sgGltee6b3d7unB0eoOKKniw3IRDBdKR9xpjIu0frw3y8ukaY/V
PVAZnf0zVZeuGCutlWWsVQNMd1ZR2MtOsVmgPf1kf0QVJ2hvs/XfVf++ewPRbhFYo483dIqybfqc
zG6U6DcXShazaSd/QHX8LlVV9Nnple2QjvnS9cmqroCSdSkpz6UwyKagsvV2y+HBq8qz6rJJiPz7
2FGM5hQVT0LytXgEn89GP8u/NAdN2pA4OPsTRyTRbuF15A3pyXz34luQcQwzX5biEaaQOLUg6yYi
CEnUw1+WP9IK0q1djxYY9sLfp/NMoR2rYyJovUnDrKooVJJONQSmjJK1AkPGS4sx7ZOCJFqNMynK
tTflwmqntYEt9+IZ0vN74vu8NPPIoehqmTKRTthfGG8s58589qU7VWb6MXyPUZfvMeL8gQv4EKJx
bJgYScRJZEhlex/Ht/gW9xiE966ZclIkovVluaZir6xSMlw/Pq1epx6MRO8jJeIjd02eL0lii5fJ
1jIvKT1w6peJgf4sD+UU3njGCtUecDWf1Rp1lgI4vPD/hj1giRscPqBUW+dTn/UY+HtfolKI5Jr0
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
YHg7E5pyUXg/IVdcofgVpw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
