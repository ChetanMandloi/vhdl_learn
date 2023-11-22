----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 03:59:52 PM
-- Design Name: 
-- Module Name: 0_5hz_clock_sim - Behavioral
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

entity one_hz_clock_sim is

end one_hz_clock_sim;

architecture Behavioral of one_hz_clock_sim is
    component top_module is
    Port(
        CLK100MHz: in std_logic:= '0'; 
        UART_RXD_OUT : out std_logic;
        led2: out std_logic); 
    end component;
    signal CLK, LED, RXD_o : std_logic;
    begin
    uut: top_module port map(CLK100Mhz => CLK, led2 => LED, UART_RXD_OUT => RXD_o);
    Clock: process
        begin
            CLK<= '0';
            wait for 5 ns;
            CLK<= '1';
            wait for 5ns;
        end process;

end Behavioral;
