----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 09:09:36 AM
-- Design Name: 
-- Module Name: pll - Behavioral
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

entity using_PLLs is
    Port (
    clk_100MHz: in std_logic;
    clk_out: out std_logic;
    dout: out std_logic );
end using_PLLs;

architecture Behavioral of using_PLLs is
    signal clk_200MHz: std_logic;
    signal led1 : std_logic := '0';
    signal led2 : std_logic := '0';
    component pll_design is
    port(
        clk_200MHz: out std_logic;
        clk_100MHz: in std_logic);
    end component;    
    begin
        comp : pll_design port map ( clk_100MHz => clk_100MHz, clk_200MHz => clk_200MHz);
        process(clk_200MHz)
            begin
                if rising_edge(clk_200MHz) then
                    led1 <=  not led1;
                end if;
            end process;
        dout <= led1;
        clk_out <= clk_200MHz;
 end Behavioral;