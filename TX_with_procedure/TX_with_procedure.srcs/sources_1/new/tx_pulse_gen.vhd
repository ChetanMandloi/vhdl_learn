----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 12:20:13 PM
-- Design Name: 
-- Module Name: slow_gen - Behavioral
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

entity tx_pulse_gen is
    generic(
        count_to : integer := 500000000
    );
    Port ( clk_in : in STD_LOGIC;
           tx_clk_out : out STD_LOGIC);
end tx_pulse_gen;

architecture Behavioral of tx_pulse_gen is
    signal clock_counter: natural range 0 to count_to := 0;
    signal clk_stat : std_logic := '0';
    begin
        process(clk_in)
        begin
            if rising_edge(clk_in) then
                clock_counter <= clock_counter + 1;
                if clock_counter >= count_to then
                    clock_counter <= 0;
                    clk_stat <= not clk_stat;
                end if;
            end if;
        end process;
        tx_clk_out <= clk_stat;
end Behavioral;
