----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2023 12:12:29 PM
-- Design Name: 
-- Module Name: uart_tx - Behavioral
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

entity uart_tx is

    generic(
        clk_freq  : integer := 100000000;
        baud_rate : integer := 9600;
        seconds_per_packet : integer := 1;
        data_to_send : std_logic_vector(7 downto 0):= "01110001");
    port(
    clk,reset : in std_logic;
    tx,tx_done 	 : out std_logic);

end uart_tx;

architecture Behavioral of uart_tx is

type state is(Idle, Start, Data, Stop);
--type packet_tx is (Transmit, Halt);
signal present_state,next_state: state:= Idle;

constant tx_clock_counter_limit : integer := clk_freq/(2*baud_rate);
constant packet_delay_counter_limit : integer := clk_freq * seconds_per_packet;
signal   tx_clock_counter   : positive range 1 to tx_clock_counter_limit := 1;
signal packet_delay_counter : positive range 1 to packet_delay_counter_limit := 1;
signal   clk_baudrate : std_logic := '0';
signal packet_send_f1 : std_logic := '0';
signal packet_send_f2 : std_logic := '0';
signal switch_on : std_logic := '0';

constant max_bit_length : natural := 8;                             --maximum number of bits in each state
signal bit_index : natural range 0 to (max_bit_length -1) ;  --counts the number of bits in current state
signal bit_timer : natural range 0 to  max_bit_length;       --specifies for how many bits ea

begin

switch_on_pulse_generator: process(clk, reset)
begin
    if (reset='1') then 
		packet_delay_counter<=1;
	elsif(rising_edge(clk)) then
		packet_delay_counter <= packet_delay_counter + 1;
		if (packet_delay_counter_limit = packet_delay_counter) then 
			packet_send_f2 <= '1';
			packet_delay_counter<=1;
	   elsif (packet_delay_counter > 10 and packet_send_f1 = '0') then  
	       packet_send_f2 <= '0';
		end if;
	end if;
end process;

baud_rate_generator: process(clk,reset)
begin
	if (reset='1') then 
		tx_clock_counter<=1;
	elsif(rising_edge(clk)) then
		tx_clock_counter<=tx_clock_counter+1;
		if (tx_clock_counter_limit=tx_clock_counter) then 
			clk_baudrate<= not clk_baudrate;
			tx_clock_counter<=1;
		end if;
	end if;
end process;

bit_index_calculator: process(clk_baudrate,reset)

begin
	if (reset='1') then 
		present_state <= Idle;
		bit_index <= 0;
	elsif(rising_edge(clk_baudrate)) then
		if(bit_index = bit_timer-1) then
			present_state <= next_state;
			bit_index <= 0;
		else
			bit_index <= bit_index+1;
		end if;
	end if;
end process;

tx_process: process(present_state,packet_send_f1)
begin
    if packet_send_f2 = '1' then
        packet_send_f1 <= '1';
    end if ;
	case present_state is 
	
		when Idle =>
			bit_timer<=1;
			tx<='1';
			tx_done<='0';
			if (packet_send_f1= '1') then
				next_state <= Start;
			else
				next_state <= Idle;
			end if;
			
		when Start =>
			bit_timer<=1;
			tx<='0';
			next_state<= Data;
			
		when Data =>
			bit_timer <= 8;
			tx <= data_to_send(bit_index);
			next_state <= Stop;
			
		when Stop =>
			tx <= '1';
			bit_timer <= 1;
			tx_done <= '1';
			packet_send_f1 <= '0';
		    next_state <= Idle;
			
		end case;
	end process;
end Behavioral;