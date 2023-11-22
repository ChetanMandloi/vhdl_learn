----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2023 02:50:31 PM
-- Design Name: 
-- Module Name: full_adder_sim - Behavioral
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

entity half_adder_sim is
end half_adder_sim;


architecture tb of half_adder_sim is
component halfadder is
Port ( a,b : in STD_LOGIC;
sum,carry : out STD_LOGIC);
end component;

signal a, b, carry, sum : STD_LOGIC;

begin
uut: halfadder port map(
a => a,
b => b,
carry => carry,
sum => sum);

Clock : process
begin
wait for 10 ns;

end process;

Stim : process
begin

a <= '0';
b <= '0';

wait for 20 ns;

a <= '0';
b <= '0';

wait for 20 ns;

a <= '0';
b <= '1';

wait for 20 ns;

a <= '0';
b <= '1';

wait for 20 ns;

a <= '1';
b <= '0';

wait for 20 ns;

a <= '1';
b <= '0';

wait for 20 ns;

a <= '1';
b <= '1';

wait for 20 ns;

a <= '1';
b <= '1';
wait for 20 ns;

end process;

end tb;
