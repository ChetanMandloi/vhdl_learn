----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2023 09:29:30 AM
-- Design Name: 
-- Module Name: pipo - Behavioral
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

entity pipo is
    Port ( CLK100MHZ, clear : in STD_LOGIC;
           input_pin : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end pipo;

architecture Behavioral of pipo is
    signal shift_reg: std_logic_vector(7 downto 0);
begin

    process (CLK100MHZ)
         begin
         if clear = '1' then
            Q <= "00000000";
            shift_reg <= "00000000";
         elsif (rising_edge(CLK100MHZ)) then
            shift_reg(7 downto 1) <= shift_reg(6 downto 0);
            shift_reg(0)<= input_pin;
            Q <= shift_reg;
         end if;
     end process;
    
end Behavioral;
