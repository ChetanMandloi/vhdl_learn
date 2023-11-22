library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_master is
generic 
(
   FPGA_FREQ : integer:= 100000000;
   SPI_BAUDRATE : integer:= 100000
);
port
(
 CLK: in std_logic; -- System Clock
 RESET : in std_logic;
 MIN : in std_logic_vector (7 downto 0); -- Data to be transmitted
 MOUT : out std_logic_vector (7 downto 0); -- Data received;
 CPHA : in std_logic;
 CPOL : in std_logic;
 Start : in std_logic; -- used to start the transmission
 Done : out std_logic; -- Signaling that transmission ended
 HOLD_SS : in std_logic; -- Signal that forces SS low in the case of multiple byte 
                           -- transmit/receive mode
 --SPI Interface Signals
 SCLK : out std_logic;
 MISO_TEST : out std_logic;
 MOSI : out std_logic;
 MISO : in std_logic;
 SS : out std_logic
);
end SPI_master;

architecture Behavioral of SPI_master is

-- to determine division rate for spi baudrate
constant DIV_RATE : integer := ((FPGA_FREQ / ( 2 * SPI_BAUDRATE)) - 1);

-- to generate twice the sclk freq to do things on rising as well as the falling edge
signal SCLK_2X_DIVISION : integer range 0 to DIV_RATE := 0;
signal SCLK_2X_SIGNAL : std_logic := '0';
-- Internal flag used for  logic
signal SCLK_Internal_Flag   : std_logic := '0';
signal Enable_SCLK  : std_logic := '0';
signal Enable_SS   : std_logic := '0';

-- Control Signals 
signal Enable_Shift : std_logic := '0';  -- Enable shifting the MOSI_REG and MISO_REG
signal Enable_Load_MOUT : std_logic :='0';   -- enable loading the MOUT register
signal Enable_Load_MIN : std_logic := '0'; -- Load the MOSI shift register 
signal SHIFT_TICK_IN : std_logic; -- signal that carries pulse for shifting in
signal SHIFT_TICK_OUT : std_logic; -- pulse for shifting out

-- State machine internal condition signals
signal Start_Shifting : std_logic := '0';
signal Shifting_Done  : std_logic := '0';

--Counter for number of bits sent/received for keeping track of state switching
signal Count_Bits: integer range 0 to 7 := 0;
signal Reset_Counters: std_logic; -- to reset all the counters, when in the Idle State

-- Shift In and Shift Out Registers
signal MOSI_REG : std_logic_vector (7 downto 0) := X"00";
signal MISO_REG : std_logic_vector (7 downto 0) := X"00";

-- done signal internal
signal DONE_1  : std_logic := '0';

--From MSB: 7:Enable Load MIN, 6:Enable Shift, 5:Reset Counters, 
--  4:Enable SCLK, 3:Enable SS, 2:Enable Load MOUT, 1:State Logic(1), 0:State Logic(0)
constant Idle_st : std_logic_vector (7 downto 0) := "10100000";
constant Prepare_st: std_logic_vector (7 downto 0) := "00001001";
constant Shift_st : std_logic_vector (7 downto 0) := "01011011";
constant stDone : std_logic_vector (7 downto 0) := "00001110";

--State Machine Signal Definitions
signal State_Current, State_Next   :  std_logic_vector (7 downto 0) := Idle_st;

--Force User Encoding for the State Machine TODO learn other encoding methods and see where they might be useful
attribute FSM_ENCOMING : string;
attribute FSM_ENCOMING of State_Current: signal is "USER";

begin

-- Assign the control signals from current state of spi
Enable_Load_MIN  <= State_Current(7);
Enable_Shift <= State_Current(6);
Reset_Counters <= State_Current(5);
Enable_SCLK <= State_Current(4);
Enable_SS <= State_Current(3);
Enable_Load_MOUT <= State_Current(2);

-- Assign the outputs
SS <= '0' when RESET = '0' and (HOLD_SS = '1' or Enable_SS = '1') else '1';
MOSI  <= MOSI_REG(7);
SCLK <= SCLK_Internal_Flag when Enable_SCLK = '1' else '0';

--Assign the outputs: Register MOUT
Load_Output: process (CLK, Enable_Load_MOUT, MISO_REG)
begin
   if rising_edge (CLK) then
      if Enable_Load_MOUT = '1' then
         MOUT <= MISO_REG;
      end if;
   end if;
end process Load_Output;

-- Set the Done signal, delayed with one clock period
-- after data is assigned
Set_Done: process (CLK, Enable_Load_MOUT, DONE_1)
begin
   if rising_edge (CLK) then
      DONE_1 <= Enable_Load_MOUT;
      Done   <= DONE_1;
   end if;
end process Set_Done;

-- Divider to generate the 2X SCLK tick
SCLK_2X: process (CLK, Reset_Counters, SCLK_2X_DIVISION)
begin
   if rising_edge (CLK) then
      if Reset_Counters = '1' 
         or SCLK_2X_DIVISION = DIV_RATE then
            SCLK_2X_DIVISION <= 0;
      else
            SCLK_2X_DIVISION <= SCLK_2X_DIVISION + 1;
      end if;
   end if;
end process SCLK_2X;

-- SCLK_2X_SIGNAL will be active at both the rising and falling edges
-- of SCLK_Internal_Flag
SCLK_2X_SIGNAL <= '1' when SCLK_2X_DIVISION = DIV_RATE else '0';

--Generate SCLK_Internal_Flag;
Gen_SCLK_Internal_Flag: process (CLK, Reset_Counters, SCLK_2X_SIGNAL, SCLK_Internal_Flag)
begin
   if rising_edge (CLK) then
      if Reset_Counters = '1' then
         SCLK_Internal_Flag <= '0';
      elsif SCLK_2X_SIGNAL = '1' then
         SCLK_Internal_Flag <= not SCLK_Internal_Flag;
      end if;
   end if;
end process Gen_SCLK_Internal_Flag;

tick_set: process(CLK) 
begin
    if ((CPOL xnor CPHA) = '1') then
        -- SHIFT_TICK_IN will be active at the rising edge of SCLK
        -- At that moment bit will be read
        SHIFT_TICK_IN  <= '1' when Enable_Shift = '1' and SCLK_Internal_Flag = '0' and SCLK_2X_SIGNAL = '1' else '0';
        
        -- SHIFT_TICK_OUT will be active at the falling edge of SCLK
        -- At that moment the next bit will be shifted out
        SHIFT_TICK_OUT <= '1' when Enable_Shift = '1' and SCLK_Internal_Flag = '1' and SCLK_2X_SIGNAL = '1' else '0';
    else
        --do the opposite for the other SPI Mode
        SHIFT_TICK_IN  <= '1' when Enable_Shift = '1' and SCLK_Internal_Flag = '1' and SCLK_2X_SIGNAL = '1' else '0';
        
        SHIFT_TICK_OUT <= '1' when Enable_Shift = '1' and SCLK_Internal_Flag = '0' and SCLK_2X_SIGNAL = '1' else '0';
    end if;
end process tick_set;


-- Create the shift in register, MSB First, so shift left. TODO shift operator was not working properly investigate why
SHIFT_IN: process (CLK, SHIFT_TICK_IN, MISO_REG)
begin
   if rising_edge (CLK) then
      if SHIFT_TICK_IN = '1' then
         MISO_REG (7 downto 0) <= MISO_REG (6 downto 0) & MISO;
         MISO_TEST <= MISO_REG(0);
      end if;
   end if;
end process SHIFT_IN;

-- Create the shift out register, MSB out first, so shift left
SHIFT_OUT: process (CLK, Enable_Load_MIN, MIN, SHIFT_TICK_OUT, MOSI_REG)
begin
   if rising_edge (CLK) then
      if Enable_Load_MIN = '1' then 
         MOSI_REG <= MIN;
      elsif SHIFT_TICK_OUT = '1' then
         MOSI_REG (7 downto 0) <= MOSI_REG (6 downto 0) & '0';
      end if;
   end if;
end process SHIFT_OUT;

-- Count_Bits will be incremented at the falling edge of SCLK
-- i.e. when SHIFT_TICK_OUT is active
Count_Bits_proc: process (CLK, Reset_Counters, SHIFT_TICK_OUT, Count_Bits)
begin
   if rising_edge (CLK) then
      if Reset_Counters = '1' then
         Count_Bits <= 0;
      elsif SHIFT_TICK_OUT = '1' then
         if Count_Bits = 7 then 
            Count_Bits <= 0;
         else
            Count_Bits <= Count_Bits + 1;
         end if;
      end if;
   end if;
end process Count_Bits_proc; 

-- Assign the State machine internal condition signals

Start_Shifting <= '1' when State_Current = Prepare_st and (HOLD_SS = '1' or (SCLK_Internal_Flag = '1' and SCLK_2X_SIGNAL = '1'))
                      else '0';

-- Shifting ends when 8 bits has been transferred, at the falling edge of SCLK_Internal_Flag
Shifting_Done <= '1' when State_Current = Shift_st and Count_Bits = 7 and SCLK_Internal_Flag = '1' and SCLK_2X_SIGNAL = '1' else '0';

-- State machine register process
Reg_Statem: process (CLK, RESET, State_Next)
begin
   if rising_edge (CLK) then
      if RESET = '1' then
         State_Current <= Idle_st;
      else
         State_Current <= State_Next;
      end if;
   end if;
end process Reg_Statem;

-- State machine transition process TODO why wasn't this working outside process in base architecture?
Cmb_Statem: process (State_Current, Start, Start_Shifting, Shifting_Done)
begin
   State_Next <= State_Current; -- default: stay in the current state if no other condition for transition occurs
   case State_Current is
   when Idle_st => if Start = '1' then State_Next <= Prepare_st; end if;
   when Prepare_st => if Start_Shifting = '1' then State_Next <= Shift_st; end if;
   when Shift_st => if Shifting_Done = '1' then State_Next <= stDone; end if;
   when stDone => State_Next <= Idle_st;
   when others => State_Next <= Idle_st;
   end case;
end process Cmb_Statem;


end Behavioral;
