library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    generic (
        clk_freq : integer := 100; 
        uart_clk_freq  : integer := 100000000;
        uart_baud_rate : integer := 9600;
        bytes_to_send : integer := 6;
        data_rate : std_logic_vector := "011"; -- Replace with your desired data rate code
        data_range : std_logic_vector := "00"  -- Replace with your desired data range code
    );
    port (
        clk : in std_logic;
        reset_n : in std_logic;
        uart_reset : in std_logic;
        miso : in std_logic;
        sclk : buffer std_logic;
        ss_n : buffer std_logic_vector(0 downto 0);
        mosi : out std_logic;
        acceleration_x_led : out std_logic_vector(11 downto 0);
        uart_tx_pin : out std_logic
    );
end top_level;

architecture Behavioral of top_level is

    component adxl362 is
      generic(
        clk_freq : integer := 100;              --system clock frequency in MHz
        uart_baud_rate : integer := 9600;
        bytes_to_send : integer :=  6;
        data_rate : std_logic_vector := "011";  --011 for 100 Hz  data rate code to configure the accelerometer
        data_range : std_logic_vector := "00");  --00 +-2g     01 +-4g     1X 8g             data range code to configure the accelerometer
      port(
        clk : in std_logic;                      --system clock

        
        reset_n : in std_logic;                      --active low asynchronous reset
        miso : in std_logic;                      --SPI bus: master in, slave out
        sclk : buffer std_logic;                      --SPI bus: serial clock
        ss_n : buffer std_logic_vector(0 downto 0);   --SPI bus: slave select
        mosi : out std_logic;                      --SPI bus: master out, slave in
        acceleration_x_led : out     std_logic_vector(11 downto 0);  --x-axis acceleration data
        x_in : buffer std_logic_vector(11 downto 0);
        y_in : buffer std_logic_vector(11 downto 0);
        z_in : buffer std_logic_vector(11 downto 0));

    end component adxl362;
    component uart_tx is
    
        generic(
            uart_clk_freq  : integer := 100000000;
            uart_baud_rate : integer := 9600;
            seconds_per_packet : integer := 1;
            bytes_to_send : integer :=  6);
            --data_to_send : std_logic_vector(7 downto 0):= "01110001");
        port(
        clk, uart_reset : in std_logic;
        x_in, y_in, z_in : in std_logic_vector(11 downto 0);
        uart_tx_pin 	 : out std_logic);
    
    end component uart_tx;


    signal x_acceleration, y_acceleration, z_acceleration : std_logic_vector(11 downto 0);

begin
    -- Instantiate the accelerometer module
    accelerometer_inst : component adxl362
        generic map (
            clk_freq => clk_freq,
            uart_baud_rate => uart_baud_rate,
            bytes_to_send => bytes_to_send,
            data_rate => data_rate,
            data_range => data_range
        )
        port map (
            clk => clk,
            reset_n => reset_n,
            miso => miso,
            sclk => sclk,
            ss_n => ss_n,
            mosi => mosi,
            acceleration_x_led => acceleration_x_led,
            x_in => x_acceleration,
            y_in => y_acceleration,
            z_in => z_acceleration
        );

    -- Instantiate the UART transmitter module
    uart_tx_inst : component uart_tx
        generic map (
            uart_clk_freq => uart_clk_freq,
            uart_baud_rate => uart_baud_rate,
            bytes_to_send => bytes_to_send
        )
        port map (
            clk => clk,
            uart_reset => uart_reset,  
            x_in => x_acceleration,
            y_in => y_acceleration,
            z_in => z_acceleration,
            uart_tx_pin => uart_tx_pin
        );
end Behavioral;
