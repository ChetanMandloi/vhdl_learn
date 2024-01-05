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
        uart_clk_freq  : integer := 100000000;
        uart_baud_rate : integer := 9600;
        seconds_per_packet : integer := 1;
        bytes_to_send : integer :=  2);
        --data_to_send : std_logic_vector(7 downto 0):= "01110001");
    port(
    clk, uart_reset : in std_logic;
    busy, ready : out std_logic;
    temp_in : in std_logic_vector(15 downto 0);
    uart_tx_pin : out std_logic);

end uart_tx;

architecture Behavioral of uart_tx is

type state is(Idle, Start, Data, Stop);
--type packet_tx is (Transmit, Halt);
signal present_state,next_state: state:= Idle;

constant tx_clock_counter_limit : integer := uart_clk_freq/(2*uart_baud_rate);
constant packet_delay_counter_limit : integer := uart_clk_freq * seconds_per_packet;
signal   tx_clock_counter   : positive range 1 to tx_clock_counter_limit := 1;
signal packet_delay_counter : positive range 1 to packet_delay_counter_limit := 1;
signal   clk_baudrate : std_logic := '0';
signal packet_send_f1 : std_logic := '0';
signal packet_send_f2 : std_logic := '0';
signal switch_on : std_logic := '0';

constant max_bit_length : natural := 8;                             --maximum number of bits in each state
signal   bit_index      : natural range 0 to (max_bit_length -1) ;  --counts the number of bits in current state
signal 	 bit_timer 		: natural range 0 to  max_bit_length;       --specifies for how many bits ea

signal data_select_counter : positive range 1 to bytes_to_send := 1;
signal selected_frame: std_logic_vector(7 downto 0):= temp_in(7 downto 0); 


begin

switch_on_pulse_generator: process(clk, uart_reset)
begin
    if (uart_reset='1') then 
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

baud_rate_generator: process(clk,uart_reset)
begin
	if (uart_reset='1') then 
		tx_clock_counter<=1;
	elsif(rising_edge(clk)) then
		tx_clock_counter<=tx_clock_counter+1;
		if (tx_clock_counter_limit=tx_clock_counter) then 
			clk_baudrate<= not clk_baudrate;
			tx_clock_counter<=1;
		end if;
	end if;
end process;

bit_index_calculator: process(clk_baudrate,uart_reset)

begin
        if (uart_reset='1') then 
            present_state <= Idle;
            bit_index <= 0;

        elsif(rising_edge(clk_baudrate)) then
            if(present_state = Idle) then
                data_select_counter <= 1;
            end if;
            if(bit_index = bit_timer-1) then
                if(present_state = Stop and data_select_counter < bytes_to_send) then
                    data_select_counter <= data_select_counter + 1;
                end if;
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
	        busy <= '0';
	        ready <= '1';
			bit_timer<=1;
			uart_tx_pin<='1';

			if (packet_send_f1= '1') then
				next_state <= Start;
			else
				next_state <= Idle;
			end if;
		when Start =>
		        busy <= '1';
	            ready <= '0';
                bit_timer<=1;
                uart_tx_pin<='0';
                case data_select_counter is
			     when 1 =>
			         selected_frame <= temp_in(15 downto 8);
			     when 2 =>
			         selected_frame <= temp_in(7 downto 0);
			     when others =>
			         
                end case;
                next_state<= Data;
                
            when Data =>
                busy <= '1';
	            ready <= '0';
                bit_timer <= 8;
			    uart_tx_pin <= selected_frame(bit_index);
                next_state <= Stop;
                
            when Stop =>
                busy <= '1';
	            ready <= '0';
                uart_tx_pin <= '1';
                bit_timer <= 1;
                if(data_select_counter < bytes_to_send) then
                    next_state <= Start;
                else
                    next_state <= Idle;
                    packet_send_f1 <= '0';
                end if;
                
			
		end case;
	end process;
end Behavioral;
/*
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
        bytes_to_send : integer :=  2);
    port(
    clk,reset, button : in std_logic;
    temp_in : in std_logic_vector(15 downto 0);
    uart_busy, uart_ready : out std_logic;
    uart_tx_pin, s_pin1, s_pin2, trig_pin, tx_done, button_pin : out std_logic);

end uart_tx;

architecture Behavioral of uart_tx is

    type state is(Idle, Start, Data, Stop);
    signal present_state,next_state: state:= Idle;
    
    constant tx_clock_counter_limit : integer := clk_freq/(2*baud_rate);
    signal tx_clock_counter  : positive range 1 to tx_clock_counter_limit :=1;
    signal clk_baudrate : std_logic := '0';
    
    constant max_bit_length : natural := 8;                             --maximum number of bits in each state
    signal   bit_index : natural range 0 to (max_bit_length -1) ;  --counts the number of bits in current state
    signal 	 bit_timer : natural range 0 to  max_bit_length;       --specifies for how many bits ea
    signal db_button : std_logic:= '0';
    signal button_buff : std_logic_vector(1 downto 0) := "00";
    signal trig :std_logic:= '0';
    signal tx_done_sig : std_logic:= '0';
    signal final_byte_done: std_logic := '0';
    signal trig_counter : positive range 1 to 5*tx_clock_counter_limit :=1;
    
    
    signal data_select_counter : positive range 1 to bytes_to_send := 1;
    signal selected_frame: std_logic_vector(7 downto 0):= temp_in(7 downto 0); 
    
    component debounce is
            port(
                clk : in std_logic;
                button : in std_logic;
                result : out std_logic
            );
    end component;
    
    
    begin
    comp: debounce port map(clk => clk, button=> button, result => db_button);
    tx_trig_generator: process(clk)
    begin
        if(reset = '1') then
            trig <= '0';
        elsif(rising_edge(clk)) then
            button_buff(1) <= button_buff(0);
            button_buff(0) <= db_button;
            if(button_buff(0) = '1' and button_buff(1)= '0')then
                trig<= '1';
            end if;
            if(trig = '1') then
                trig_counter <= trig_counter + 1 ;
                if(trig_counter = 4*tx_clock_counter_limit) then
                    trig <= '0';
                    trig_counter <= 1;
                end if; 
            end if;
        end if;
    end process;
    
    baud_rate_generator: process(clk,reset)
    begin
        if (reset='1') then 
            tx_clock_counter<=1;
        elsif(rising_edge(clk)) then
            tx_clock_counter<=tx_clock_counter+1;
            if (tx_clock_counter_limit = tx_clock_counter) then 
                clk_baudrate<= not clk_baudrate;
                tx_clock_counter<=1;
            end if;
        end if;
    end process;
    
    bit_index_calculator: process(clk_baudrate, reset, next_state)
    
    begin
        if (reset='1') then 
            present_state <= Idle;
            bit_index <= 0;
            final_byte_done <= '0';
        elsif(rising_edge(clk_baudrate)) then
            if(present_state = Idle) then
                data_select_counter <= 1;
            end if;
            if(bit_index = bit_timer-1) then
                if(present_state = Stop and data_select_counter < bytes_to_send) then
                    data_select_counter <= data_select_counter + 1;
                end if;
                present_state <= next_state;
                bit_index <= 0;
            else
                bit_index <= bit_index+1;
            end if;
        end if;
    end process;
    
    tx_process: process(clk)
    begin
        case present_state is 
        
            when Idle =>
                s_pin1 <= '0';
                s_pin2 <= '0';
                bit_timer<=1;
                uart_tx_pin<='1';
                tx_done_sig<='0';
                if (trig='1') then
                    next_state <= Start;
                else
                    next_state <= Idle;
                end if;
                
            when Start =>
                s_pin1 <= '0';
                s_pin2 <= '1';
                bit_timer<=1;
                uart_tx_pin<='0';
                case data_select_counter is
			     when 1 =>
			         selected_frame <= temp_in(15 downto 8);
			     when 2 =>
			         selected_frame <= temp_in(7 downto 0);
			     when others =>
			         
                end case;
                next_state<= Data;
                
            when Data =>
                s_pin1 <= '1';
                s_pin2 <= '0';
                bit_timer <= 8;
			    uart_tx_pin <= selected_frame(bit_index);
                next_state <= Stop;
                
            when Stop =>
                s_pin1 <= '1';
                s_pin2 <= '1';
                uart_tx_pin <= '1';
                bit_timer <= 1;
                if(data_select_counter < bytes_to_send) then
                    next_state <= Start;
                else
                    next_state <= Idle;
                    tx_done_sig <= '1';
                end if;
                

            end case;
        end process;
    trig_pin <= trig;
    tx_done <= tx_done_sig;
    button_pin <= button;
end Behavioral;
*/