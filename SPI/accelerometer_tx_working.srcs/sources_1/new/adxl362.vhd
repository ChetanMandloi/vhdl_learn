----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 12:08:39 PM
-- Design Name: 
-- Module Name: adxl362 - Behavioral
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

entity adxl362 is
  generic(
    clk_freq : integer := 100;    --system clock frequency in MHz
    uart_baud_rate : integer := 9600;
    bytes_to_send : integer :=  6;    --2bytes per axis of data to send
    data_rate : std_logic_vector := "011";  --011 for 100 Hz  data rate code to configure the accelerometer
    data_range : std_logic_vector := "00");  --00 +-2g     01 +-4g     1X 8g             data range code to configure the accelerometer
  port(
    clk : in std_logic;                      --system clock
    
    reset_n : in std_logic;                      --active low synchronous reset
    miso : in std_logic;                      
    sclk : buffer std_logic;                      
    ss_n : buffer std_logic_vector(0 downto 0);   
    mosi : out std_logic;                      
    acceleration_x_led : out     std_logic_vector(11 downto 0);  --x-axis acceleration data on led
    x_in : buffer std_logic_vector(11 downto 0);
    y_in : buffer std_logic_vector(11 downto 0);
    z_in : buffer std_logic_vector(11 downto 0));
end adxl362;

architecture behavior of adxl362 is
  type machine is(start, pause, configure, read_data, output_result);
  signal state  : machine := start;                       --state machine
  signal parameter_sig : integer range 0 to 3;                   
  signal parameter_addr : std_logic_vector(5 downto 0);  
  signal parameter_data : std_logic_vector(7 downto 0);  
  signal spi_busy_prev : std_logic;                              
  signal spi_busy : std_logic;                              
  signal spi_ena : std_logic;                              --enable for SPI component
  signal spi_cont : std_logic;                              --continuous mode signal for SPI component
  signal spi_tx_data : std_logic_vector(7 downto 0);           --transmit data for SPI component
  signal spi_rx_data : std_logic_vector(7 downto 0);           --received data from SPI component
  signal acceleration_x_int : std_logic_vector(15 downto 0);          --x-axis acceleration data buffer
  signal acceleration_y_int : std_logic_vector(15 downto 0);          --y-axis acceleration data buffer
  signal acceleration_z_int : std_logic_vector(15 downto 0);          --z-axis acceleration data buffer

  
  signal uart_busy : std_logic:= '1';

    component spi_master is
        generic(
            slaves  : integer := 1;  
            d_width : integer := 8); 
        port(
            clock : in std_logic;  
            reset_n : in std_logic;  
            enable : in std_logic;   
            cpol : in std_logic; 
            cpha : in std_logic;   
            cont : in std_logic;  --continuous mode on
            clk_div : in integer;  --system clock cycles per 1/2 period of sclk
            addr : in integer;    --address of slave
            tx_data : in std_logic_vector(d_width-1 downto 0);  --data to transmit
            miso : in std_logic;  
            sclk : buffer std_logic;  
            ss_n : buffer std_logic_vector(slaves-1 downto 0); 
            mosi : out std_logic;  
            busy : out std_logic;  --busy / data ready signal
            rx_data : out std_logic_vector(d_width-1 downto 0)); --data received
    end component spi_master;


begin

  --instantiate the SPI Master component
  spi_master_0:  spi_master
    generic map(slaves => 1, d_width => 8)
    port map(clock => clk, reset_n => reset_n, enable => spi_ena, cpol => '0', cpha => '0',
        cont => spi_cont, clk_div => clk_freq/32, addr => 0, tx_data => spi_tx_data, miso => miso,
        sclk => sclk, ss_n => ss_n, mosi => mosi, busy => spi_busy, rx_data => spi_rx_data);


  process(clk)
    variable count : integer := 0; --counter variable 
  begin
    if(reset_n = '0') then   --reset
      spi_busy_prev <= '0'; 
      spi_ena <= '0';  --disable spi
      spi_cont <= '0';    --clear SPI  continuous signal
      spi_tx_data <= (others => '0');     
      x_in <= (others => '0');  --clear all data from previous reading
      y_in <= (others => '0');  
      z_in <= (others => '0');  
      state <= start;                     --restart state machine
    elsif(rising_edge(clk)) then 
      case state is            

        --entry state
        when start =>
          count := 0;      --clear counter
          parameter_sig <= 0;  
          state <= pause;
          
        --pauses for some time between SPI transactions and selects SPI transaction
        when pause =>
          if(spi_busy = '0') then                
            if(count < clk_freq/5) then           
              count := count + 1;                 
              state <= pause;                   
            else                                   
              count := 0;                            --reset counter ofter pause and proceed
              case parameter_sig is                      
                when 0 =>                              --SPI transaction to set range and data rate
                  parameter_sig <= parameter_sig + 1;            
                  parameter_addr <= "101100";            -- 0x2c register address with range and data rate settings
                  parameter_data <= data_range & "010" & data_rate;  
                  state <= configure;                   
                when 1 =>                              
                  parameter_sig <= parameter_sig + 1;            
                  parameter_addr <= "101101";         
                  parameter_data <= "00000010";       
                  state <= configure;              
                when 2 =>                    
                  state <= read_data;       
                when others => NULL;
              end case;        
            end if;
          end if;

        --performs SPI writes to config registers  
        when configure =>
          spi_busy_prev <= spi_busy;                      
          if(spi_busy_prev = '1' and spi_busy = '0') then 
            count := count + 1;    
          end if;
          case count is            
            when 0 =>               
              if(spi_busy = '0') then                         --no communication started. prepare to start
                spi_cont <= '1';                      
                spi_ena <= '1';                    
                spi_tx_data <= "00001010";             -- 0x0A write command first
              else                                     
                spi_tx_data <= "00" & parameter_addr;           --register address then send register address
              end if;
            when 1 =>                                        
              spi_tx_data <= parameter_data;                    --third information to send (write data)
            when 2 =>                                         --2nd busy deassertion                                       --first busy deassertion
              spi_cont <= '0';                                --clear continous mode to end transaction
              spi_ena <= '0';                                 --clear SPI transaction enable
              count := 0;                                     
              state <= pause;                                 --return to pause state
            when others => NULL;
          end case;

        --performs SPI transactions that read acceleration data registers  
        when read_data =>
          spi_busy_prev <= spi_busy;    
          if(spi_busy_prev = '1' and spi_busy = '0') then   
            count := count + 1;                               --counts the times busy goes from high to low during transaction
          end if;          
          case count is                                     
            when 0 =>                                        
              if(spi_busy = '0') then                           --no transaction yet
                spi_cont <= '1';                                  --set to continuous mode
                spi_ena <= '1';                                   --enable SPI transaction
                spi_tx_data <= "00001011";                        --first information to send (read command)
              else                                              
                spi_tx_data <= "00001110";                        --second information to send (register address)
              end if;
            when 1 =>                                         
              spi_tx_data <= "00000000";                        --third information to send
            when 3 =>                                         
              acceleration_x_int(7 downto 0) <= spi_rx_data;    --start getting data from all registers
            when 4 =>                                      
              acceleration_x_int(15 downto 8) <= spi_rx_data;   
            when 5 =>                                         
              acceleration_y_int(7 downto 0) <= spi_rx_data;    
            when 6 =>                                         
              acceleration_y_int(15 downto 8) <= spi_rx_data;   
            when 7 =>                                         
              spi_cont <= '0';                                  --stop spi transaction
              spi_ena <= '0';                                   
              acceleration_z_int(7 downto 0) <= spi_rx_data;    
            when 8 =>                                         
              acceleration_z_int(15 downto 8) <= spi_rx_data;   -- fetch last data
              count := 0;                                       --clear  counter
              state <= output_result;                           -- move to next state
            when others => NULL;
          end case;
  
        --outputs acceleration data
        when output_result =>
            x_in <= acceleration_x_int(11 downto 0);  --output x-axis data
            acceleration_x_led <= x_in;
            y_in <= acceleration_y_int(11 downto 0);  --output y-axis data
            z_in <= acceleration_z_int(11 downto 0);  --output z-axis data
            state <= pause;   --return to pause state
        
        --default to start state
        when others => 
          state <= start;

      end case;      
    end if;
  end process;
end behavior;
