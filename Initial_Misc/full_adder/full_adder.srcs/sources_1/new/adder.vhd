----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2023 02:28:54 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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


--top module(full adder) entity declaration
entity fulladder is
    port (a : in std_logic;
            b : in std_logic;
           cin : in std_logic;
           sum : out std_logic;
           carry : out std_logic
         );
end fulladder;
--top module architecture declaration.
architecture behavior of fulladder is
--sub-module(half adder) is declared as a component before the keyword "begin".
   component halfadder
    port(
         a : in std_logic;
         b : in std_logic;
         sum : out std_logic;
         carry : out std_logic
        );
    end component;
--All the signals are declared here,which are not a part of the top module.
--These are temporary signals like 'wire' in Verilog.
signal s1,c1,c2 : std_logic:='0';

begin
--instantiate and do port map for the first half adder.
  HA1 : halfadder port map (
          a => a,
          b => b,
          sum => s1,
          carry => c1
        );
--instantiate and do port map for the second half adder.
 HA2 : halfadder port map (
          a => s1,
          b => cin,
         sum => sum,
         carry => c2
        );
carry <= c1 or c2;  --final carry calculation

end;