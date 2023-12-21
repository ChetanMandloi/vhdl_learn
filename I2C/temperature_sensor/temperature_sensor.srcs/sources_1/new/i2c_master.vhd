----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2023 11:57:47 AM
-- Design Name: 
-- Module Name: i2c_master - Behavioral
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

entity i2c_master is
    generic(
        sys_clk_freq     : integer := 100000000; 
        bus_clk   : integer := 400000);
    PORT(

    clk : in     std_logic;         
    reset_l : in     std_logic;      
    enable : in     std_logic;            
    addr : in     std_logic_vector(6 DOWNTO 0); -- i2c address of slave to be passed to this port
    data_write : in     std_logic_vector(7 DOWNTO 0); -- data write register
    read_write : in     std_logic;                    --'0'=write, '1'=read
    busy : out    std_logic; 
    data_read : out    std_logic_vector(7 DOWNTO 0); --data read register
    acknowledge_error : buffer std_logic;   --flag set when no acknowledge recieved from slave
    sda : inout  std_logic;   -- main sda line        
    scl : inout  std_logic);  -- main scl line
end i2c_master;

architecture Behavioral of i2c_master is
    constant freq_divider  :  integer := (sys_clk_freq/bus_clk)/4;
    type machine IS(ready_state, start_state, command_state, acknowledge_state_1, write_state, read_state, acknowledge_state_2, acknowledge_state_3, stop_state);
    -- ready state: module is not busy, ready to start trx
    -- start state: module starts trx, fetches data and address and goes to command state
    --acknowledge_state_1: First acknowledgement after 1 byte from slave
    --acknowledge_state_2: Second acknowledgement after another byte from slave. also read new data and address register information
    --acknowledge_state_3: Acknowledgement from master during this state
    --write/read_state: module performs read or write operations on the bus
    --stop_state: final state before returning to idle or starting next trx
     
    signal  state     :  machine;   
    signal  scl_clk   :  std_logic;
    signal data_clk : std_logic;
    signal scl_enable : std_logic:= '0';
    signal sda_enable_l : std_logic;
    signal sda_internal : std_logic:= '1';   -- signal used for some internal logic in state machine 
    signal bit_counter: integer range 0 to 7 := 7;    --tracks which bit position the state machine is at during a trx
    signal address_read: std_logic_vector(7 downto 0); -- vector used to store read address
    signal tx_data_latch : std_logic_vector(7 downto 0); --tx data latch to use when transmitting data so that changes in other register dosen't mess up tx
    signal rx_data_latch : std_logic_vector(7 downto 0); --same as  above but for rx
    

begin
    scl_proc: process(clk, reset_l)
    variable count : integer range 0 to freq_divider*4; 
  begin
    if(rising_edge(clk)) then
        if(reset_l = '0')then
            count := 0;
        else
            if(count = freq_divider*4-1) then       --end of timing cycle
                count := 0;                      --reset timer
            else
                count := count + 1;
            end if;
            case count is
                when 0 to freq_divider-1 =>           -- 1st quadrant of clock cycle
                  scl_clk <= '0';
                  data_clk <= '0';
                when freq_divider to freq_divider*2-1 =>   -- 2nd quadrant of clock cycle
                  scl_clk <= '0';
                  data_clk <= '1';
                when freq_divider*2 to freq_divider*3-1 => -- 3rd quadrant of clock cycle
                  scl_clk <= '1';    
                  data_clk <= '1';
                when others =>                   -- 4th quadrant of clock cycle
                  scl_clk <= '1';
                  data_clk <= '0';
            end case;
        end if;
    end if;

    end process;
    
  state_machine: process(data_clk, reset_l)
  begin

    if(rising_edge(data_clk)) then
        if(reset_l = '0') then                  --reset 
            state <= ready_state;                       
            busy <= '1';                         
            scl_enable <= '0';               
            sda_internal <= '1';     
            bit_counter <= 7;          
            data_read <= "00000000";       
        else
          case state is
            when ready_state =>                       --idle state
              if(enable = '1') then                --trx requested
                busy <= '1';                 
                address_read <= addr & read_write;  --collect addr and data to read/write
                tx_data_latch <= data_write;    
                state <= start_state;                 --go to start_state bit
              else              
                busy <= '0';            
                state <= ready_state;    
              end if;
            when start_state =>                       --start_state bit of transaction
              busy <= '1';                
              scl_enable <= '1';         
              sda_internal <= address_read(bit_counter);      --set first address bit to bus
              state <= command_state;          
            when command_state =>                     -- command_state state when master runs the show
              if(bit_counter = 0) then              -- move to acknowledge state when command is done being sent
                sda_internal <= '1';      
                bit_counter <= 7;       
                state <= acknowledge_state_1;   
              else                      
                bit_counter <= bit_counter - 1;       
                sda_internal <= address_read(bit_counter-1); 
                state <= command_state;           
              end if;
            when acknowledge_state_1 =>                    --slave acknowledgment 1
              if(address_read(0) = '0') then       
                sda_internal <= tx_data_latch(bit_counter);  
                state <= write_state;    
              else                    
                sda_internal <= '1';        --release sda for slave
                state <= read_state;  
              end if;
            when write_state =>                          --write byte of transaction
              busy <= '1';              
              if(bit_counter = 0) then      
                sda_internal <= '1';                 --release sda for slave
                bit_counter <= 7;           
                state <= acknowledge_state_2;              --go to slave acknowledgement2
              else                      
                bit_counter <= bit_counter - 1;      
                sda_internal <= tx_data_latch(bit_counter-1);  
                state <= write_state;     
              end if;
            when read_state =>                          --read mode of module
              busy <= '1';       
              if(bit_counter = 0) then        
                if(enable = '1' and read_write = '1') then 
                  sda_internal <= '0';           --acknowledge the byte has been received
                else                  
                  sda_internal <= '1';               --send a no-acknowledge (before stop_state or repeated start_state)
                end if;
                bit_counter <= 7;      
                data_read <= rx_data_latch;        
                state <= acknowledge_state_3;              --go to master acknowledgement
              else                  
                bit_counter <= bit_counter - 1;      
                state <= read_state;             
              end if;
            when acknowledge_state_2 =>                    --slave acknowledgement 2
              if(enable = '1') then     
                busy <= '0';        
                address_read <= addr & read_write;       
                tx_data_latch <= data_write;        
                if(read_write = '1') then          --continue with a read operation
                  state <= start_state;    
                else                            --continue with write operation
                  sda_internal <= data_write(bit_counter); 
                  state <= write_state;              
                end if;
              else                              --end trx as enable is now 0, i.e not continuos mode
                scl_enable <= '0';            
                state <= stop_state;         
              end if;
            when acknowledge_state_3 =>       --master acknowledgement after a read
              if(enable = '1') then           
                busy <= '0';                   
                address_read <= addr & read_write;      
                tx_data_latch <= data_write;     
                if(read_write = '0') then               --continue with write operation
                  state <= start_state;     
                else                            --continue with read operation
                  sda_internal <= '1';              
                  state <= read_state;      
                end if;
              else                              --end trx as enable is now 0, i.e not continuos mode
                scl_enable <= '0';          
                state <= stop_state;  
              end if;
            when stop_state =>        
              busy <= '0';             
              state <= ready_state;          
          end case;    
        end if;
    end if;

    if(falling_edge(data_clk)) then
        if(reset_l = '0') then          
            acknowledge_error <= '0'; 
        else
          case state is
            when start_state =>        
              acknowledge_error <= '0';              --reset acknowledge error flag at the start
            when acknowledge_state_1 =>              
              acknowledge_error <= sda OR acknowledge_error; --set error output if no-acknowledge
            when read_state =>      --receiving data from slave
              rx_data_latch(bit_counter) <= sda;       --receive current slave data bit
            when acknowledge_state_2 =>    
              acknowledge_error <= sda OR acknowledge_error; --set error output if no-acknowledge
            when others =>
              NULL;
          end case;
       end if;
    end if;
    
  end process;  

  with state select
    sda_enable_l <=  data_clk when start_state, --no sda in start
               not data_clk when stop_state,   -- yes to sda in stop
              sda_internal when others;      --it depends on sda_internal for others
              --this allows the other states to release sda when needed for slave to write
    
    
    scl <= scl_clk when scl_enable = '1' else 'Z';
    sda <= '0' when sda_enable_l = '0' else 'Z';
end Behavioral;
