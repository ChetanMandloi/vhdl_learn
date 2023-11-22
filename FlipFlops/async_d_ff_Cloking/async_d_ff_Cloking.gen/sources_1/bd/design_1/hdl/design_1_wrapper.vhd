--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
--Date        : Mon Oct  9 13:46:05 2023
--Host        : dhep-sipm running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    clk_100MHz : in STD_LOGIC;
    reset_rtl_0 : in STD_LOGIC;
    clk_out2 : out STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      clk_100MHz => clk_100MHz,
      clk_out2 => clk_out2,
      reset_rtl_0 => reset_rtl_0
    );
end STRUCTURE;
