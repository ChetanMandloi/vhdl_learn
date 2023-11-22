----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 09:36:00 AM
-- Design Name: 
-- Module Name: pll_sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pll_sim is
end pll_sim;

architecture Behavioral of pll_sim is
    component using_PLLs is
        Port( clk_100MHz: in std_logic;
            clk_out: out std_logic;
            dout: out std_logic);
    end component;
    signal clk_100MHz : std_logic:= '0';
    signal clk_200MHz : std_logic;
    signal dout : std_logic;
begin
    uut: using_PLLs port map(
        clk_100MHz => clk_100MHz,
        clk_out => clk_200MHz,
        dout => dout);
    Clock: process
        begin
            clk_100MHz <= '0';
            wait for 10 ns;
            clk_100MHz <= '1';
            wait for 10 ns;
    end process;
    Stim: process
        begin
            wait for 100 ns;
    end process;
end Behavioral;
