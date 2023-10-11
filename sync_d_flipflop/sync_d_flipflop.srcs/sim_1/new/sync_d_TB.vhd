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

entity sync_d_TB is

end sync_d_TB;

architecture tb of sync_d_TB is

component sync_d is
Port ( clk, reset_sync, D : in STD_LOGIC;
    Q : out STD_LOGIC);
end component;

signal clk, reset_sync, D, Q : STD_LOGIC;

begin
uut: sync_d port map(
clk => clk,
reset_sync => reset_sync,
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
    
    reset_sync <= '0';
    D <= '0';
    wait for 15 ns;
    
    reset_sync <= '0';
    D <= '1';
    wait for 15 ns;
    
    reset_sync <= '1';
    D <= '0';
    wait for 15 ns;
    
    reset_sync <= '0';
    D <= '1';
    wait for 15 ns;
    
end process;
end tb;