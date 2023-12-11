----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2023 10:45:43 AM
-- Design Name: 
-- Module Name: uart_simulation - Behavioral
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

entity tb_uart_tx is
end tb_uart_tx;

architecture sim of tb_uart_tx is
    signal clk, reset, button, tx, tx_done, butt_led, trig_pin : std_logic := '0';

    constant c_CLK_PERIOD : time := 10 ns;

    -- Add signals for debouncing if necessary
    -- signal db_button : std_logic := '0';

    -- Add signals for UART receiver if necessary
    -- signal rx : std_logic := '0';

begin

    -- Instantiate the UART TX module
    UUT: entity work.uart_tx
        port map (
            clk => clk,
            reset => reset,
            button => button,
            tx => tx,
            tx_done => tx_done,
            butt_led => butt_led,
            trig_pin => trig_pin
        );

    -- Clock process
    process
    begin
        while True loop
            clk <= not clk;
            wait for c_CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        reset <= '1'; -- Initial reset
        wait for 5 ms;
        reset <= '0'; -- Release reset
        wait for 5 ms;
        
        -- Button press simulation
        button <= '0';
        wait for 25 ms;
     
        button <= '1';
        wait for 25 ms;
        button <= '0';
        wait for 40 ms;
        button <= '1';
        wait for 25 ms;
        button <= '0';

        wait;
    end process;

end sim;
