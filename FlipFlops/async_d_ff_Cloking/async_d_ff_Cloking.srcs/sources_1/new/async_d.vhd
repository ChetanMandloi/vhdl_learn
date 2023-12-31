----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2023 09:17:56 AM
-- Design Name: 
-- Module Name: async_d - Behavioral
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

entity async_d is
    Port ( clk : in STD_LOGIC;
           D : in STD_LOGIC;
           reset_async : in STD_LOGIC;
           Q : out STD_LOGIC);
end async_d;

architecture Behavioral of async_d is

begin

    process(clk,reset_async)
    begin 
        if(reset_async='1') then 
            Q <= '0';
        elsif(rising_edge(clk)) then
            Q <= D; 
        end if;      
end process;


end Behavioral;
