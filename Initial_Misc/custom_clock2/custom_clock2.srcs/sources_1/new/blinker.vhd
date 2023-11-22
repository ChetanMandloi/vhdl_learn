----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 12:20:59 PM
-- Design Name: 
-- Module Name: blinker - Behavioral
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

entity blinker is
    Port ( blink_clk_in : in STD_LOGIC;
           led_out : out STD_LOGIC);
end blinker;

architecture Behavioral of blinker is
    signal led_status: std_logic:='0';
    begin
        process(blink_clk_in)
            begin
                if rising_edge(blink_clk_in) then
                    led_status <= not led_status;
                end if;
    end process;
    led_out <= led_status;

end Behavioral;
