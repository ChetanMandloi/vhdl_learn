----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/30/2023 10:58:32 AM
-- Design Name: 
-- Module Name: spi_master - Behavioral
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


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_master is
  generic(
    slaves : integer := 1;  --number of spi slaves
    d_width : integer := 8); --data bus width
  port(
    clock : in std_logic;  
    reset_n : in std_logic; 
    enable : in std_logic;  
    cpol : in std_logic;   
    cpha : in std_logic; 
    cont : in std_logic;  --continuous mode command
    clk_div : in integer;   --system clock cycles per 1/2 period of sclk
    addr : in integer;   --address of slave
    tx_data : in std_logic_vector(d_width-1 downto 0);  --data to transmit
    miso : in std_logic; 
    sclk : buffer std_logic; 
    ss_n : buffer std_logic_vector(slaves-1 downto 0);
    mosi : out std_logic; 
    busy : out std_logic;  
    rx_data : out std_logic_vector(d_width-1 downto 0)); --data received
end spi_master;

architecture logic of spi_master is
  type machine is(ready, execute); 
  signal state : machine;  --current state
  signal slave : integer;  --slave selected for current transaction
  signal clk_ratio : integer; --current clk_div
  signal count : integer; --counter to trigger sclk from system clock
  signal clk_toggles : integer range 0 to d_width*2 + 1; --count spi clock toggles
  signal assert_data : std_logic; --'1' is tx sclk toggle, '0' is rx sclk toggle
  signal continue : std_logic; --flag to used to decide if to continue transaction
  signal rx_buffer : std_logic_vector(d_width-1 downto 0); --receive data buffer
  signal tx_buffer : std_logic_vector(d_width-1 downto 0); --transmit data buffer
  signal last_bit_rx : integer range 0 TO d_width*2; --last rx data bit location
begin
  process(clock, reset_n)
  begin
    
    if(rising_edge(clock)) then
        if(reset_n = '0') then        --reset system
            busy <= '1';  
            ss_n <= (others => '1');    --deassert all slave select lines
            mosi <= 'Z';  --set master out to high impedance
            rx_data <= (others => '0'); --clear receive data port
            state <= ready; 
        else
          case state is  
    
            when ready =>
              busy <= '0';          
              ss_n <= (others => '1'); 
              mosi <= 'Z';    
              continue <= '0';  
    
              --user input to initiate transaction
              if(enable = '1') then       
                busy <= '1';             --set busy signal
                if(addr < slaves) then   --check for valid slave address
                  slave <= addr;         --clock in current slave selection if valid
                else
                  slave <= 0;            --set to first slave if not valid
                end if;
                if(clk_div = 0) then  
                  clk_ratio <= 1;    
                  count <= 1;   
                else
                  clk_ratio <= clk_div;  
                  count <= clk_div;   
                end if;
                sclk <= cpol;  
                assert_data <= NOT cpha; --set spi clock phase
                tx_buffer <= tx_data;   --clock in data for transmit into buffer
                clk_toggles <= 0;    --initiate clock toggle counter
                last_bit_rx <= d_width*2 + conv_integer(cpha) - 1; --set last rx data bit
                state <= execute;        --proceed
              else
                state <= ready; 
              end if;
    
            when execute =>
              busy <= '1';  
              ss_n(slave) <= '0'; 

              if(count = clk_ratio) then        
                count <= 1; 
                assert_data <= not assert_data; --switch transmit/receive indicator
                if(clk_toggles = d_width*2 + 1) then
                  clk_toggles <= 0;  
                else
                  clk_toggles <= clk_toggles + 1;
                end if;
                
                if(clk_toggles <= d_width*2 and ss_n(slave) = '0') then 
                  sclk <= not sclk;
                end if;
                
                if(assert_data = '0' and clk_toggles < last_bit_rx + 1 and ss_n(slave) = '0') then 
                  rx_buffer <= rx_buffer(d_width-2 downto 0) & miso; --shift in received bit
                end if;
                
                --transmit spi clock toggle
                if(assert_data = '1' and clk_toggles < last_bit_rx) then 
                  mosi <= tx_buffer(d_width-1);     --clock out data bit
                  tx_buffer <= tx_buffer(d_width-2 downto 0) & '0'; --shift data transmit buffer
                end if;
                
                --last data receive, but continue
                if(clk_toggles = last_bit_rx and cont = '1') then 
                  tx_buffer <= tx_data; --reload transmit buffer
                  clk_toggles <= last_bit_rx - d_width*2 + 1; --reset spi clock toggle counter
                  continue <= '1';  --set continue flag
                end if;
                
                --normal end of transaction, but continue
                if(continue = '1') then  
                  continue <= '0'; --clear continue flag
                  busy <= '0';  --clock out signal that first receive data is ready
                  rx_data <= rx_buffer; --clock out received data to output port    
                end if;
                
                --end of transaction
                if((clk_toggles = d_width*2 + 1) and cont = '0') then   
                  busy <= '0'; 
                  ss_n <= (others => '1'); 
                  mosi <= 'Z';  
                  rx_data <= rx_buffer; 
                  state <= ready; 
                else    
                  state <= execute; 
                end if;
              
              else    
                count <= count + 1; 
                state <= execute; 
              end if;
    
          end case;
      end if;
    end if;
  end process; 
end logic;
