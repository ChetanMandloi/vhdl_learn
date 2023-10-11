----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/05/2023 02:13:42 PM
-- Design Name: 
-- Module Name: sr_flip - Behavioral
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

entity sr_flip is
    Port ( CLK100MHZ : in STD_LOGIC;
           st : in STD_LOGIC;
           rst : in STD_LOGIC;
           ena : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end sr_flip;

architecture Behavioral of sr_flip is

begin

process (st,ena,rst,CLK100MHZ)

begin

if (ena = '0') then
    q <= '0';
    elsif (RISING_EDGE(CLK100MHZ))then
        if (st /= rst) then
                q <= st;
                q_bar <= rst;
            elsif (st = '1' AND rst = '1') then
                q <= 'Z';
                q_bar <= 'Z';

        end if;
end if; 
end process;

end Behavioral;
