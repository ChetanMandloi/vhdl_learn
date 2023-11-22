----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2023 03:23:00 PM
-- Design Name: 
-- Module Name: edge_d_flipflop - Behavioral
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

entity edge_d_flipflop is
    Port ( d : in STD_LOGIC;
           en: in STD_LOGIC;
           q : out STD_LOGIC;
           CLK100MHZ : in STD_LOGIC);
end edge_d_flipflop;

architecture Behavioral of edge_d_flipflop is

begin
    process(CLK100MHZ)
        begin
        if en = '1' then
            if(RISING_EDGE(CLK100MHZ)) then
                q <= d; 
            end if;  
        end if;     
    end process;  

end Behavioral;
