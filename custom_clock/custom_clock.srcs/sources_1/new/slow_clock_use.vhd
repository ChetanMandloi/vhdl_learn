----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 11:02:08 AM
-- Design Name: 
-- Module Name: slow_clock_use - Behavioral
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

entity slow_clock_use is
    Port (led : out STD_LOGIC);
end slow_clock_use;

architecture Behavioral of slow_clock_use is
    signal s_clock : std_logic:= '0';
    signal led_status: std_logic:= '0';
    component slow_clock is
        port(
            clk_out : out std_logic);
    end component;
    begin
    comp : slow_clock port map(clk_out => s_clock);
    process(s_clock)
        begin
            if rising_edge(s_clock) then
                led_status <= not led_status;
            end if;
    end process;
    led <= led_status;
end Behavioral;
