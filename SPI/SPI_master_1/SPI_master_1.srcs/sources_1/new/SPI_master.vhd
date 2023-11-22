----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2023 09:17:50 AM
-- Design Name: 
-- Module Name: SPI_master - Behavioral
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


entity SPI_master is
    generic (
        CLK_FREQ    :   integer := 100000000;      -- FPGA Clock frequency
        Baudrate    :   integer := 115200;         -- Desired SPI baudrate
        DF_Size  :   integer := 8;    -- Data frame_size. bits per frame
        Test_Data : std_logic_vector(9 downto 0) := "0001100111"
    );
    port (
        -- Input ports
        CLK  :  in  std_logic;  -- FPGA Clock 100M                                                  
        RESET :  in  std_logic;  -- Reset port
        Master_Enable : in  std_logic;     
        MISO : in  std_logic;  -- Master in Slave Out port
        MIN : in  std_logic_vector (((DF_Size + 2) - 1) downto 0);  -- Parallel data input port 
        -- Output Ports
        SCK     :   out std_logic;  -- Generated SPI clock port
        SS      :   out std_logic;   -- Slave Select
        MOSI    :   out std_logic;   -- Master out Slave in port
        MOUT    :   out std_logic_vector (((DF_Size + 2) - 1) downto 0);  -- Parallel data output port
        M_Ready  :   out std_logic;  -- Master ready port
        M_Done   :   out std_logic  -- Master done port
    );
end entity SPI_master;

architecture Behavioral of SPI_master is

    type state_type is (S_IDLE, S_TRANSCEIVE, S_STOP);   -- Type for the states  
    signal PS, NS      :   state_type   := S_IDLE;        -- Present and Next State

    signal SPI_HALF_PERIOD  :    integer     := ((CLK_FREQ) / (Baudrate * 2));   -- SPI clock counter limit calcolation

    -- Register signals
    signal CPOL : std_logic   := '0';    -- Clock polarity control
    signal CPHA : std_logic   := '0';       -- Clock phase control
    signal SCK_Reg : std_logic   := '0';          -- Register for the SPI clock
    signal SS_Reg : std_logic   := '1';             -- Register for the Slave select
    signal MOSI_Reg  :  std_logic_vector ((DF_Size - 1) downto 0) := (others => '0');   -- Shift register for the MOSI
    signal MOSI_Temp : std_logic_vector ((DF_Size - 1) downto 0) := (others => '0');    -- Register for the input data
    signal MISO_Reg : std_logic_vector ((DF_Size - 1) downto 0) := (others => '0');    -- Shift register for the MISO
    signal MOUT_Reg : std_logic_vector (((DF_Size + 2) - 1) downto 0)  := (others => '0');        --! Register for the output data
    
    -- Counter signals
    signal SCK_Counter: integer     := 0; -- Counter signal for the SPI clock 
    signal DATA_Counter: integer     := 0; -- Counter signal for the transceive state
    signal SCK_Enable:  std_logic   := '0'; -- SPI clock counter enable signal
    signal SCK_Done: std_logic   := '0'; -- SPI clock counter done signal

begin

    -- Input assignments
    CPHA  <= MIN (0);
    CPOL  <= MIN (1);
    MOSI_Temp <= MIN (((DF_Size + 2) - 1) downto 2);

    -- SPI clock generator
    GEN_SCK:    process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (SCK_Enable = '1') then
                if (SCK_Counter = (SPI_HALF_PERIOD - 1)) then
                    SCK_Reg     <= not (SCK_Reg);
                    SCK_Counter <= 0;
                    SCK_Done    <= '1';
                else
                    SCK_Counter <= SCK_Counter + 1;
                    SCK_Done    <= '0';
                end if;
            else
                SCK_Reg     <= CPOL;
                SCK_Counter <= 0;
                SCK_Done    <= '0';
            end if;
        end if;
    end process;

    -- Synchronises the states of the Main process
    FSM_SYNC:   process (CLK, RESET)
    begin
        if (rising_edge(CLK)) then
            if (RESET = '1') then
                PS <= S_IDLE;
            else
                PS <= NS;
            end if;
        end if;
    end process;

    -- SPI data control logic
    MAIN:   process (RESET, PS, Master_Enable, SCK_Done)
    begin
        case (PS) is

            when (S_IDLE) =>
                if(RESET = '1') then
                    NS           <= S_IDLE;
                    M_Ready       <= '0';
                    M_Done        <= '0';
                    SS_Reg       <= '1';
                    MOSI         <= '1';
                    SCK_Enable       <= '0';
                    DATA_Counter <= 0;
                    MISO_Reg     <= (others => '0');
                    MOSI_Reg     <= (others => '0');
                elsif (Master_Enable = '1') then
                    NS       <= S_TRANSCEIVE;
                    M_Ready   <= '0';
                    SS_Reg   <= '0';
                    SCK_Enable   <= '1';
                    MOSI_Reg <= MOSI_Temp;
                else
                    NS           <= S_IDLE;
                    M_Ready       <= '1';
                    M_Done        <= '0';
                    SS_Reg       <= '1';
                    MOSI         <= '1';
                    SCK_Enable       <= '0';
                    DATA_Counter <= 0;
                    MOSI_Reg     <= (others => '0');
                    MISO_Reg     <= (others => '0');
                end if;

            when (S_TRANSCEIVE) =>
                if(CPHA = '0') then
                    if (DATA_Counter = ((DF_Size * 2) - 1)) then
                        if(SCK_Done = '1') then
                            NS           <= S_STOP;
                            MOSI         <= '1';
                        end if;
                    else
                        MOSI <= MOSI_Reg (0);
                        if(SCK_Done = '1') then
                            if ((DATA_Counter rem 2) = 0) then
                                MISO_Reg ((DF_Size - 1)) <= MISO;
                                DATA_Counter                <= DATA_Counter + 1;
                            else        
                                MOSI_Reg     <= MOSI_Reg (0) & MOSI_Reg ((DF_Size - 1) downto 1);                        
                                MISO_Reg     <= MISO_Reg (0) & MISO_Reg ((DF_Size - 1) downto 1);                        
                                DATA_Counter <= DATA_Counter + 1;
                            end if;                         
                        end if;
                    end if;
                elsif (CPHA = '1') then
                    if (DATA_Counter = (DF_Size * 2)) then
                        NS <= S_STOP;
                    else
                        if (DATA_Counter = 0) then
                            MOSI <= '1';
                            if(SCK_Done = '1') then
                                DATA_Counter <= DATA_Counter + 1;
                            end if;
                        else
                            MOSI <= MOSI_Reg (0);
                            if(SCK_Done = '1') then
                                if ((DATA_Counter rem 2) /= 0) then
                                    MISO_Reg ((DF_Size - 1)) <= MISO;
                                    DATA_Counter                <= DATA_Counter + 1;
                                else       
                                    MOSI_Reg     <= MOSI_Reg (0) & MOSI_Reg ((DF_Size - 1) downto 1);                        
                                    MISO_Reg     <= MISO_Reg (0) & MISO_Reg ((DF_Size - 1) downto 1);                        
                                    DATA_Counter <= DATA_Counter + 1;
                                end if;                         
                            end if;
                        end if;
                    end if;
                else
                    NS <= S_IDLE;
                end if;

            when (S_STOP) =>
                    MOUT_Reg     <= (MISO_Reg) & (CPOL) & (CPHA);
                if(SCK_Done = '1') then
                    NS           <= S_IDLE;
                    SS_Reg       <= '1';
                    M_Done        <= '1';
                    SCK_Enable       <= '0';
                    DATA_Counter <= 0;
                end if;

            when others =>
                NS           <= S_IDLE;
                M_Ready       <= '0';
                M_Done        <= '0';
                SS_Reg       <= '1';
                MOSI         <= '1';
                SCK_Enable       <= '0';
                DATA_Counter <= 0;
                MISO_Reg     <= (others => '0');
                MOSI_Reg     <= (others => '0');

        end case;
    end process;

    -- Output assignments
    SCK  <= SCK_Reg;
    SS   <= SS_Reg;
    MOUT <= (MOUT_Reg) when (RESET = '0') else
            (others => '0');

end architecture;
