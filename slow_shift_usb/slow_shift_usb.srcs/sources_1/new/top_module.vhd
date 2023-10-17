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
    signal led_signal: std_logic:= '0';
    signal led2_signal: std_logic:= '0';
    component slow_gen is
        port(
            clk_in: in std_logic;
            clk_out: out std_logic);
    end component;
    component blinker is
        port(
            blink_clk_in: in std_logic;
            led_out: out std_logic;
            led2_out: out std_logic);
    end component;
    
    begin
    comp1: slow_gen port map(
                        clk_in => CLK100MHZ,
                        clk_out => s_clock);
    comp2: blinker port map(
                        blink_clk_in => s_clock,
                        led_out => led_signal,
                        led2_out =>led2_signal);                
    UART_RXD_OUT <= led_signal;
    led2 <= led2_signal;
end Behavioral;
