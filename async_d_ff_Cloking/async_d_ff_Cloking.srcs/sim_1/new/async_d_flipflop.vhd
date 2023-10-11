----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2023 10:03:10 AM
-- Design Name: 
-- Module Name: sync_d_TB - Behavioral
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

entity async_d_TB is

end async_d_TB;

architecture tb of async_d_TB is

component async_d is
Port ( clk, reset_async, D : in STD_LOGIC;
    Q : out STD_LOGIC);
end component;

signal clk, reset_async, D, Q : STD_LOGIC;

begin
uut: async_d port map(
clk => clk,
reset_async => reset_async,
D => D,
Q => Q);

Clock : process
begin
    
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    
    end process;
    
Stim : process
    begin
    
    reset_async <= '1';
    D <= '0';
    wait for 15 ns;
    
    reset_async <= '0';
    D <= '1';
    wait for 15 ns;
    
    reset_async <= '1';
    D <= '0';
    wait for 15 ns;
    
    reset_async <= '0';
    D <= '1';
    wait for 15 ns;
    
end process;
end tb;