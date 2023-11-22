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
    Port ( CLK100MHZ : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end pipo;

architecture Behavioral of pipo is

begin

    process (CLK100MHZ)
     begin
         if (rising_edge(CLK100MHZ)) then
            Q <= D;
         end if;
     end process;
    
end Behavioral;
