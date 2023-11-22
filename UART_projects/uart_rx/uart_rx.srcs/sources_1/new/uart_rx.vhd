----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2023 12:37:04 PM
-- Design Name: 
-- Module Name: uart_rx - Behavioral
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
entity uart_rx is

generic(
clk_freq  : integer := 100000000;
baud_rate : integer := 9600);

port(clk, rst: in std_logic;
debug : out std_logic;
LED : out std_logic_vector(7 downto 0);
rx: in std_logic);

end Uart_Rx;

architecture Behavioral of Uart_Rx is

type state is(Start_Stop,Recieve_Data);
signal present_state,next_state: state:= Start_Stop;

constant rx_clock_counter_limit : integer := (clk_freq/(2*baud_rate));
signal   rx_clock_timer   	   : positive range 1 to rx_clock_counter_limit :=1;
signal   clk_baudrate : std_logic :='0';


constant max_bit_length : natural :=8;
signal   bit_index      : natural range 0 to (max_bit_length -1) ;
signal 	 bit_timer 		: natural range 0 to  max_bit_length;

signal rx_buffer : std_logic_vector(7 downto 0):= "00000000";

begin

Clock_division_process: process(clk,rst)
begin
	if(rising_edge(clk)) then
        if (rst='1') then 
            rx_clock_timer<=1;
        else
            rx_clock_timer<=rx_clock_timer+1;
            if (rx_clock_timer=rx_clock_counter_limit) then
                clk_baudrate<= not clk_baudrate;
                rx_clock_timer<=1;
            end if;
        end if;
	end if;
end process;

State_based_timer_process: process(clk_baudrate,rst)

begin
	
	if(rising_edge(clk_baudrate)) then
        if (rst='1') then 
            present_state<=Start_Stop;
            bit_index<=0;
        else
            if(bit_index=bit_timer-1) then
                present_state<=next_state;
                bit_index<=0;
            else
                bit_index<=bit_index+1;
            end if;
        end if;
    end if;
end process;

Uart_Receive_Process: process(present_state,rx)
begin
	case present_state is 
	
		when Start_Stop =>
			bit_timer<=1;
			LED <= rx_buffer;
			if (rx='1') then
				next_state<=Start_Stop;
			else
				next_state<=Recieve_Data;
			end if;
			
		when Recieve_Data =>
			bit_timer<=8;
			rx_buffer(bit_index)<=rx;
			next_state<=Start_Stop;
		end case;
	end process;
	debug <= rx;
end Behavioral;