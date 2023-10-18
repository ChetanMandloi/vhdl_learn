----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 12:19:21 PM
-- Design Name: 
-- Module Name: top_module - Behavioral
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
-- #define pi 3.14
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_module is
    Port ( CLK100MHZ : in STD_LOGIC;
           UART_RXD_OUT : out STD_LOGIC;
           led2: out std_logic);
end top_module;

architecture Behavioral of top_module is
    signal s_clock: std_logic:= '0';
    signal tx_out: std_logic:= '0';
    signal tx_clock : std_logic:= '0';
    component slow_gen is
        port(
            clk_in: in std_logic;
            clk_out: out std_logic);
    end component;
    component tx_pulse_gen is
        port(
            clk_in : in std_logic;
            tx_clk_out : out std_logic
        );
     end component;
    component transmitter is
        port(
            baud_clk_in: in std_logic;
            tx_clk_in : in std_logic;
            tx_out: out std_logic
        );
    end component;
    
    
    begin
    comp1: slow_gen port map(
                        clk_in => CLK100MHZ,
                        clk_out => s_clock);
    comp2: tx_pulse_gen port map(
                        clk_in => CLK100MHZ,
                        tx_clk_out => tx_clock
                        );
    
    comp3: transmitter port map(
                        baud_clk_in => s_clock,
                        tx_clk_in => tx_clock,
                        tx_out =>tx_out); 
    
                                       
    UART_RXD_OUT <= tx_out;
end Behavioral;
