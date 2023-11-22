----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/10/2023 12:20:59 PM
-- Design Name: 
-- Module Name: blinker - Behavioral
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

entity transmitter is
    generic(
    data_frame_length : integer := 8;
    tx_data : std_logic_vector := "01110001";
    partiy_bit_type : integer := 0;
    stop_bit_length : integer := 2
    );
    Port ( blink_clk_in : in STD_LOGIC;
           tx_out : out STD_LOGIC);
end transmitter;

architecture Behavioral of transmitter is
    signal tx_line: std_logic:='1';
    signal data_8bit: std_logic_vector(7 downto 0):= tx_data;
    
    procedure send_start_bit(
    signal tx : out std_logic
    ) is
        begin
        
        for i in 0 to 0 loop
            if rising_edge(blink_clk_in) then
                tx <= '0';
            end if;
        end loop;
        
    end procedure send_start_bit;
        
    procedure send_data_frame(
        signal tx : out std_logic;
        signal data_vector : std_logic_vector;
        signal data_length : integer;
        signal parity_type : integer
        ) is
        begin
        
        for i in data_length-1 downto 0 loop
            if rising_edge(blink_clk_in) then
                tx <= data_vector(i);
            end if;
        end loop;
        --partiy bit
    end procedure send_data_frame;
        
    procedure send_stop_bit(
    signal tx : out std_logic;
    signal stop_length : integer
    ) is
        begin
        for i in 0 to stop_length loop
            if rising_edge(blink_clk_in) then
                tx <= '1';
            end if;
        end loop;
    end procedure send_stop_bit;
    
    procedure send_packet(
    signal tx : out std_logic;
    signal data : std_logic_vector;
    signal data_frame_len : integer;
    signal parity_type : integer;
    signal stop_len : integer
    ) is
        begin
        send_start_bit(tx);
        send_data_frame(tx,data, data_frame_len, parity_type);
        send_stop_bit(tx,stop_len);
    end procedure send_packet;
    
    
    begin
        process(blink_clk_in)
            begin
                if rising_edge(blink_clk_in) then
                    tx_line <= data_8bit(0);
                    data_8bit <= data_8bit ror 1;
                end if;
        end process;
    tx_out <= tx_line;

end Behavioral;
