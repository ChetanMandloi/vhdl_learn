----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/04/2023 09:27:21 AM
-- Design Name: 
-- Module Name: nand_sim - Behavioral
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

entity nand_sim is
end nand_sim;

architecture Behavioral of nand_sim is
 -- Component declaration for unit test
 COMPONENT nand_design PORT(
    a : IN std_logic;
    b : IN std_logic;
    z : IN std_logic;
    );
  END COMPONENT;
  
  --Inputs
  signal a : std_logic: = '0';
  signal b : std_logic: = '0';
  --Outputs
  signal z : std_logic;
begin
    --instantiate the unit under test
    uut: nand_gate PORT MAP(
    a => a,
    b => b,
    z => z
    );
    --stuimulus process
    stim_proc: process
    begin
        --hold reset state for 100ns
        wait for 100 ns;
        --insert stimulus here
        a<='0';
        b<='0';
        wait for 100 ns;
        a<='0';
        b<='1';
        wait for 100 ns;
        a<='1';
        b<='0';
        wait for 100 ns;
        a<='1';
        b<='1';
wait;
end process;
end Behavioral;
