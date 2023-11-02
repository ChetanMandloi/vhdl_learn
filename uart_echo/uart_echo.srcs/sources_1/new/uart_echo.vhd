----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2023 02:00:04 PM
-- Design Name: 
-- Module Name: uart_echo - Behavioral
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
entity uart_Echo is

generic(
clk_freq  : integer := 100000000;
baud_rate : integer := 9600;
data_to_send : std_logic_vector(7 downto 0):= "01110001");

port(clk, rst, trig_pin, button: in std_logic;
debug_tx, debug_rx : out std_logic;
LED : out std_logic_vector(7 downto 0);
tx, tx_done: out std_logic;
rx: in std_logic);

end Uart_Echo;

architecture Behavioral of Uart_Echo is

type rx_state is(Start_Stop,Recieve_Data);
signal rx_present_state, rx_next_state: rx_state:= Start_Stop;
type tx_state is(Idle, Start, Data, Stop);
signal tx_present_state, tx_next_state: tx_state:= Idle;

constant clock_counter_limit : integer := (clk_freq/(2*baud_rate));
signal   rx_clock_timer   	   : positive range 1 to clock_counter_limit :=1;
signal   rx_clk_baudrate : std_logic :='0';


constant max_bit_length : natural :=8;
signal   rx_bit_index      : natural range 0 to (max_bit_length -1) ;
signal 	 rx_bit_timer 		: natural range 0 to  max_bit_length;
signal rx_buffer : std_logic_vector(7 downto 0):= "00000000";

constant tx_clock_counter_limit : integer := clk_freq/(2*baud_rate);
signal   tx_clock_counter   	   : positive range 1 to tx_clock_counter_limit :=1;
signal   tx_clk_baudrate : std_logic := '0';                           --maximum number of bits in each state
signal   tx_bit_index      : natural range 0 to (max_bit_length -1) ;  --counts the number of bits in current state
signal 	 tx_bit_timer 		: natural range 0 to  max_bit_length;       --specifies for how many bits ea
signal db_button : std_logic:= '0';
signal button_buff : std_logic_vector(1 downto 0) := "00";
signal trig :std_logic:= '0';
signal trig_counter : positive range 1 to 5*tx_clock_counter_limit :=1;
component debounce is
            port(
                clk : in std_logic;
                button : in std_logic;
                result : out std_logic
            );
    end component;


begin

Clock_division_process: process(clk,rst)
begin
	if(rising_edge(clk)) then
        if (rst='1') then 
            rx_clock_timer<=1;
        else
            rx_clock_timer<=rx_clock_timer+1;
            if (rx_clock_timer=clock_counter_limit) then
                rx_clk_baudrate<= not rx_clk_baudrate;
                rx_clock_timer<=1;
            end if;
        end if;
	end if;
end process;

State_based_timer_process: process(rx_clk_baudrate,rst)

begin
	
	if(rising_edge(rx_clk_baudrate)) then
        if (rst='1') then 
            rx_present_state<=Start_Stop;
            rx_bit_index<=0;
        else
            if(rx_bit_index=rx_bit_timer-1) then
                rx_present_state<=rx_next_state;
                rx_bit_index<=0;
            else
                rx_bit_index<=rx_bit_index+1;
            end if;
        end if;
    end if;
end process;

Uart_Receive_Process: process(rx_present_state,rx)
begin
	case rx_present_state is 
	
		when Start_Stop =>
			rx_bit_timer<=1;
			LED <= rx_buffer;
			if (rx='1') then
				rx_next_state<=Start_Stop;
			else
				rx_next_state<=Recieve_Data;
			end if;
			
		when Recieve_Data =>
			rx_bit_timer<=max_bit_length;
			rx_buffer(rx_bit_index)<=rx;
			rx_next_state<=Start_Stop;
		end case;
	end process;








comp: debounce port map(clk => clk, button=> button, result => db_button);
    tx_trig_generator: process(clk)
    begin
        if(rst = '1') then
            trig <= '0';
        elsif(rising_edge(clk)) then
            button_buff(1) <= button_buff(0);
            button_buff(0) <= db_button;
            if(button_buff(0) = '1' and button_buff(1)= '0')then
                trig<= '1';
            end if;
            if(trig = '1') then
                trig_counter <= trig_counter + 1 ;
                if(trig_counter = 5*tx_clock_counter_limit) then
                    trig <= '0';
                    trig_counter <= 1;
                end if; 
            end if;
        end if;
    end process;
    tx_baud_rate_generator: process(clk,rst)
    begin
        if (rst='1') then 
            tx_clock_counter<=1;
        elsif(rising_edge(clk)) then
            tx_clock_counter<=tx_clock_counter+1;
            if (tx_clock_counter_limit=tx_clock_counter) then 
                tx_clk_baudrate<= not tx_clk_baudrate;
                tx_clock_counter<=1;
            end if;
        end if;
    end process;
    
    tx_bit_index_calculator: process(tx_clk_baudrate,rst)
    begin
        if (rst='1') then 
            tx_present_state <= Idle;
            tx_bit_index <= 0;
        elsif(rising_edge(tx_clk_baudrate)) then
            if(tx_bit_index = tx_bit_timer-1) then
                tx_present_state <= tx_next_state;
                tx_bit_index <= 0;
            else
                tx_bit_index <= tx_bit_index+1;
            end if;
        end if;
    end process;	
	tx_process: process(tx_present_state,trig)
    begin
        case tx_present_state is 
        
            when Idle =>
                tx_bit_timer<=1;
                tx<='1';
                debug_tx <= '0';
                tx_done<='0';
                if (trig='1') then
                    tx_next_state <= Start;
                else
                    tx_next_state <= Idle;
                end if;
                
            when Start =>
                tx_bit_timer<=1;
                tx<='0';
                tx_next_state<= Data;
                
            when Data =>
                tx_bit_timer <= 8;
                tx <= data_to_send(tx_bit_index);
                debug_tx <= data_to_send(tx_bit_index);
                tx_next_state <= Stop;
                
            when Stop =>
                tx <= '1';
                debug_tx <= '1';
                tx_bit_timer <= 1;
                tx_done <= '1';
                if (trig='0') then
                    tx_next_state <= Idle;
                else
                    tx_next_state <= Start;
                end if;
                
            end case;
        end process;

	
	debug_rx <= rx;
end Behavioral;