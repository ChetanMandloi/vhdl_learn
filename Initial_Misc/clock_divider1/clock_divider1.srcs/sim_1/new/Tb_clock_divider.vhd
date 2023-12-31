LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tb_clock_divider IS
END Tb_clock_divider;
 
ARCHITECTURE Behavioral OF Tb_clock_divider IS
 
-- Component Declaration for the Unit Under Test (UUT)
 
COMPONENT Clock_Divider
PORT(
clk : IN std_logic;
reset : IN std_logic;
clock_out : OUT std_logic
);
END COMPONENT;
 
--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';
 
--Outputs
signal clock_out : std_logic;
 
-- Clock period definitions
constant clk_period : time := 20 ns;
 
BEGIN
 
-- Instantiate the Unit Under Test (UUT)
uut: Clock_Divider PORT MAP (
clk => clk,
reset => reset,
clock_out => clock_out
);
 
-- Clock process definitions
clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;
 
-- Stimulus process
stim_proc: process
begin
wait for 100 ns;
reset <= '1';
wait for 100 ns;
reset <= '0';
wait;
end process;
 
END;