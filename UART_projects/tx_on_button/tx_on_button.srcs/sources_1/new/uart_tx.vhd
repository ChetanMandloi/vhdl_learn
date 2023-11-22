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
        data_to_send : std_logic_vector(7 downto 0):= "01110001");
    port(
    clk,reset, button : in std_logic;
    tx,tx_done,butt_led, trig_pin 	 : out std_logic);

end uart_tx;

architecture Behavioral of uart_tx is

    type state is(Idle, Start, Data, Stop);
    signal present_state,next_state: state:= Idle;
    
    constant tx_clock_counter_limit : integer := clk_freq/(2*baud_rate);
    signal   tx_clock_counter   	   : positive range 1 to tx_clock_counter_limit :=1;
    signal   clk_baudrate : std_logic := '0';
    
    constant max_bit_length : natural := 8;                             --maximum number of bits in each state
    signal   bit_index      : natural range 0 to (max_bit_length -1) ;  --counts the number of bits in current state
    signal 	 bit_timer 		: natural range 0 to  max_bit_length;       --specifies for how many bits ea
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
    comp: debounce port map(clk => clk, button=> button, result => db_button);
    tx_trig_generator: process(clk)
    begin
        butt_led <= db_button;
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
                if(trig_counter = 5*tx_clock_counter_limit) then
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
    
    tx_process: process(present_state,trig)
    begin
        case present_state is 
        
            when Idle =>
                bit_timer<=1;
                tx<='1';
                tx_done<='0';
                if (trig='1') then
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
                if (trig='0') then
                    next_state <= Idle;
                else
                    next_state <= Start;
                end if;
                
            end case;
        end process;
     trig_pin <= trig;
end Behavioral;