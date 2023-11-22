----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2023 04:26:40 PM
-- Design Name: 
-- Module Name: tb_sr_flipflop - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SR_FF_tb is
end entity;

architecture tb of SR_FF_tb is

component SR_FLIPFLOP_SOURCE is
Port ( S,R,RST,CLK : in STD_LOGIC;
Q,Qb : out STD_LOGIC);
end component;

signal S, R, RST, CLK, Q, Qb : STD_LOGIC;

begin
uut: SR_FLIPFLOP_SOURCE port map(
S => S,
R => R,
RST => RST,
CLK => CLK,
Q => Q,
Qb => Qb);

Clock : process
begin

CLK <= '0';
wait for 10 ns;
CLK <= '1';
wait for 10 ns;

end process;

Stim : process
begin

RST <= '0';

S <= '0';
R <= '0';
wait for 20 ns;

S <= '0';
R <= '1';
wait for 20 ns;

S <= '1';
R <= '0';
wait for 20 ns;

S <= '1';
R <= '1';
wait for 20 ns;

end process;
end tb;