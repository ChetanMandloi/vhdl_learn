----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2023 09:27:51 AM
-- Design Name: 
-- Module Name: blink - Behavioral
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

entity blink is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC);
end blink;

architecture Behavioral of blink is
    signal clk_counter : natural range 0 to 50000000 := 0;
    signal blinker : std_logic := '0';
begin

process(clk)
	begin 
    if rising_edge(clk) then 
        clk_counter <= clk_counter + 1; 
        if clk_counter >= 50000000 then 
          blinker <= not blinker;
          clk_counter <= 0;
        end if; 
    end if; 
end process;
	
led <= blinker;

end Behavioral;
