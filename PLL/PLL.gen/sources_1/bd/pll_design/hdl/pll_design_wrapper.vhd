--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
--Date        : Tue Oct 10 09:26:03 2023
--Host        : dhep-sipm running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target pll_design_wrapper.bd
--Design      : pll_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pll_design_wrapper is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_200MHz : out STD_LOGIC
  );
end pll_design_wrapper;

architecture STRUCTURE of pll_design_wrapper is
  component pll_design is
  port (
    clk_100MHz : in STD_LOGIC;
    clk_200MHz : out STD_LOGIC
  );
  end component pll_design;
begin
pll_design_i: component pll_design
     port map (
      clk_100MHz => clk_100MHz,
      clk_200MHz => clk_200MHz
    );
end STRUCTURE;
