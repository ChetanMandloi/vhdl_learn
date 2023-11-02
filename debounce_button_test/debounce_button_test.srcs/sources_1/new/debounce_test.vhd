----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2023 11:46:33 AM
-- Design Name: 
-- Module Name: debounce_test - Behavioral
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

entity debounce_test is
  Port ( clk : in std_logic;
         button : in std_logic;
         led1 : out std_logic;
         led2 : out std_logic);
end debounce_test;

architecture Behavioral of debounce_test is
    signal led1_sig : std_logic:= '0';
    signal led2_sig : std_logic:= '0';
    signal debounced_sig :   std_logic;
    signal undebounced_sig : std_logic;
    component debounce is
        port(
            clk : in std_logic;
            button : in std_logic;
            result : out std_logic;
            unbounced : out std_logic
        );
    end component;
    

begin
    comp: debounce port map(clk => clk, button => button, result => debounced_sig, unbounced => undebounced_sig);
    toggle: process(clk)
        begin
        if(rising_edge(debounced_sig)) then
            led1_sig <= not led1_sig;
        end if;
        if(rising_edge(undebounced_sig)) then
            led2_sig <= not led2_sig;
        end if;
        end process;
    led1 <= debounced_sig;
    led2 <= undebounced_sig;

end Behavioral;
