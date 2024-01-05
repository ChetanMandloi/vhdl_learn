----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/19/2023 04:19:42 PM
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


library ieee;
use ieee.std_logic_1164.all;

entity temp_sensor_adt7420 is
  generic(
    sys_clk_freq : integer := 100000000;      
    uart_clk_freq  : integer := 100000000;
    bytes_to_send : integer := 2;
    uart_baud_rate : integer := 9600;
    temp_sensor_addr : std_logic_vector(6 downto 0) := "1001011"); --I2C address of the temp sensor
  port(
      
    scl_pin : out std_logic;
    sda_pin : out std_logic;
  
    clk : in std_logic; 
    uart_reset: in std_logic;   
    reset_l : in    std_logic;  
    scl : inout std_logic;  
    sda : inout std_logic;    
    i2c_acknowledge_error : out   std_logic;    
    temperature : buffer   std_logic_vector(15 downto 0);
    uart_tx_pin : out std_logic); 
end temp_sensor_adt7420;

architecture behavior of temp_sensor_adt7420 is
  type machine is(start, set_resolution, pause, read_data, output_result); 
  signal state : machine;           --state machine
  signal i2c_enable : std_logic;  
  signal i2c_addr : std_logic_vector(6 downto 0);  
  signal i2c_rw : std_logic;      --i2c read/write command signal
  signal i2c_data_write : std_logic_vector(7 downto 0); 
  signal i2c_data_read : std_logic_vector(7 downto 0); 
  signal i2c_busy : std_logic;
  signal uart_busy_read: std_logic;
  signal uart_ready_read: std_logic;
  signal busy_prev : std_logic;      
  signal temp_data : std_logic_vector(15 downto 0); 

  component i2c_master is
    generic(
     input_clk : integer; 
     bus_clk   : integer); 
    port(
     clk : in std_logic;                    --system clock
     reset_l : in std_logic;    
     enable : in  std_logic;          
     addr : in  std_logic_vector(6 downto 0);
     read_write : in  std_logic;       
     data_write : in std_logic_vector(7 downto 0); 
     busy   : out  std_logic;        
     data_read : out  std_logic_vector(7 downto 0);
     acknowledge_error : buffer std_logic;    
     sda  : inout  std_logic;      
     scl : inout  std_logic);     
  end component;
  
  component uart_tx is
    
        generic(
            uart_clk_freq  : integer := 100000000;
            uart_baud_rate : integer := 9600;
            seconds_per_packet : integer := 1;
            bytes_to_send : integer :=  2);
        port(
        clk, uart_reset : in std_logic;
        busy, ready : out std_logic;
        temp_in : in std_logic_vector(15 downto 0);
        uart_tx_pin 	 : out std_logic);
    
    end component uart_tx;

begin

  --instantiate the i2c master
  i2c_master_0:  i2c_master
    generic map(input_clk => sys_clk_freq, bus_clk => 400000)
    port map(clk => clk, reset_l => reset_l, enable => i2c_enable, addr => i2c_addr,read_write => i2c_rw, data_write => i2c_data_write, 
             busy => i2c_busy, data_read => i2c_data_read, acknowledge_error => i2c_acknowledge_error, sda => sda, scl => scl);

    uart_tx_inst : component uart_tx
        generic map (
            uart_clk_freq => uart_clk_freq,
            uart_baud_rate => uart_baud_rate,
            bytes_to_send => bytes_to_send
        )
        port map (
            clk => clk,
            uart_reset => uart_reset,  
            temp_in => temperature,
            busy => uart_busy_read,
            ready => uart_ready_read,
            uart_tx_pin => uart_tx_pin
        );
  process(clk, reset_l)
    variable busy_cnt : integer RANGE 0 TO 3 := 0;               --counts the busy signal transistions during one transaction
    variable counter  : integer RANGE 0 TO sys_clk_freq/20 := 0; --counts 100ms to wait before communicating
  begin
    if(reset_l = '0') THEN               --reset activated
      counter := 0;                        --clear wait counter
      i2c_enable <= '0';                      --clear i2c enable
      busy_cnt := 0;                       --clear busy counter
      temperature <= (OTHERS => '0');      --clear temperature result output
      state <= start;                      --return to start state
    elsif(rising_edge(clk)) THEN  --rising edge of system clock
      case state is                        --state machine
      
        --give temp sensor 100ms to power up before communicating
        when start =>
          if(counter < sys_clk_freq/20) THEN   --100ms not yet reached
            counter := counter + 1;              --increment counter
          else                                 --100ms reached
            counter := 0;                        --clear counter
            state <= set_resolution;             --advance to setting the resolution
          end if;
      
        --set the resolution of the temperature data to 16 bits
        when set_resolution =>            
          busy_prev <= i2c_busy;           
          if(busy_prev = '0' AND i2c_busy = '1') THEN 
            busy_cnt := busy_cnt + 1;           --counts the times busy has gone from low to high during trx
          end if;
          case busy_cnt is     
            when 0 =>                     
              i2c_enable <= '1';                              --initiate the trx
              i2c_addr <= temp_sensor_addr;    --set the address of the temp sensor
              i2c_rw <= '0';      --command 0 is a write
              i2c_data_write <= "00000011";   --send the address (x03) of the Configuration Register
            when 1 =>                        
              i2c_data_write <= "10000000";        
            when 2 =>                                  
              i2c_enable <= '0';                
              if(i2c_busy = '0') THEN                 
                busy_cnt := 0;                     
                state <= pause;                    
              end if;
            when OTHERS => NULL;
          end case;
          
        --pause t_buff between trx
        when pause =>
          if(counter < sys_clk_freq/1538000) THEN 
            counter := counter + 1;       
          else                              
            counter := 0;             
            state <= read_data;      
          end if;
			 

        when read_data =>
          busy_prev <= i2c_busy;             
          if(busy_prev = '0' AND i2c_busy = '1') THEN 
            busy_cnt := busy_cnt + 1;     
          end if;
          case busy_cnt is       
            when 0 =>          
              i2c_enable <= '1';                   
              i2c_addr <= temp_sensor_addr;  
              i2c_rw <= '0';         
              i2c_data_write <= "00000000";        
            when 1 =>                 
              i2c_rw <= '1';     
            when 2 =>                 
              if(i2c_busy = '0') THEN     
                temp_data(15 downto 8) <= i2c_data_read;    
              end if;
            when 3 =>        
              i2c_enable <= '0';     
              if(i2c_busy = '0') THEN                      --indicates data read in command 3 is ready
                temp_data(7 downto 0) <= i2c_data_read;     
                busy_cnt := 0;       
                state <= output_result;       
              end if;
            when OTHERS => NULL;
          end case;

        --output the temperature data
        when output_result =>
            if uart_busy_read = '0' then
                temperature <= temp_data(15 downto 0);       --write temperature data to output
            else
                null;
            end if;
            state <= pause;             

        --default to start state
        when OTHERS =>
          state <= start;

      end case;
    end if;
    scl_pin <= scl;
    sda_pin <= sda;
  end process;   
end behavior;