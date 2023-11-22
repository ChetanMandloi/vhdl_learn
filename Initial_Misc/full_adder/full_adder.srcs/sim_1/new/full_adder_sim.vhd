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

entity full_adder_sim is
end full_adder_sim;


architecture sim of full_adder_sim is
    component adder is
        Port ( a,b,cin : in STD_LOGIC;
              sum,carry : out STD_LOGIC);
    end component;

    signal a : std_logic:= '0';
    signal b : std_logic:= '0';
    signal cin : std_logic:= '0';
    signal carry : std_logic:= '0';
    signal sum : std_logic:= '0';

    begin
    uut: adder port map(
    a => a,
    b => b,
    cin => cin,
    carry => carry,
    sum => sum);
    
    Clock : process
    begin
        cin <= '0'; 
        wait for 10 ns;
        cin <= '1'; 
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
    
end sim;
