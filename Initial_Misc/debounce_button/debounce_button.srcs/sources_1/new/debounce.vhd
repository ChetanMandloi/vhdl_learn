----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2023 10:01:08 AM
-- Design Name: 
-- Module Name: debounce - Behavioral
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
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce IS
  PORT(
    clk     : in std_logic;  --input clock of 100 MHz
    button  : in std_logic;  -- button input
    result  : out std_logic;
    led1 : out std_logic;
    led2 : out std_logic);
    --led2 : out std_logic); --debounced signal
end debounce;

architecture logic of debounce is
  signal buffers   : std_logic_vector(1 downto 0):= "00"; --input buffers
  constant counter_limit : integer := 1000000;
  signal counter_start : std_logic;
  signal out_sig : std_logic;
  signal counter_out : positive range 1 to counter_limit :=1 ;--counter output
  --signal led1_sig : std_logic := '0';
  --signal led2_sig : std_logic := '0';
begin
  
  db: process(clk)
  begin
    if(rising_edge(clk)) then
      buffers(0) <= button;
      buffers(1) <= buffers(0);
      counter_start <= buffers(0) xor buffers(1);
      if(counter_start = '1') then  
        counter_out <= 1;
      elsif(counter_out = counter_limit) then 
        result <= buffers(0);
        led2 <= buffers(0);
        counter_out <= 1;
      else
        counter_out <= counter_out + 1;                                       
      end if;
    end if;
    led1 <= button;
  end process;
  
end logic;
