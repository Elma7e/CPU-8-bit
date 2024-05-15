-- Testbench Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types

ENTITY elma7eCPU_test IS -- Declaration of the testbench entity
END elma7eCPU_test;

ARCHITECTURE behavior OF elma7eCPU_test IS -- Architecture for the testbench entity

    -- Component Declaration for the CPU under test
    COMPONENT elma7eCPU 
        PORT (
            clk : IN std_logic; -- Clock input for the CPU
            value : OUT std_logic_vector(7 downto 0) -- Output value from the CPU
        );
    END COMPONENT; 

    -- Signal Declarations
    signal clk: std_logic := '0'; -- Clock signal initialized to 0
    signal value : std_logic_vector(7 downto 0); -- Signal to capture output value from the CPU

    -- Constant for clock period
    constant clk_period : time := 10 ns; -- Clock period set to 10 ns

BEGIN

    uut: elma7eCPU PORT MAP (clk => clk, value => value); -- Instantiate the CPU under test

    -- Clock process
    clk_process : process
    begin 
        clk <= '0'; -- Set clock to 0
        wait for clk_period/2; -- Wait for half clock period	
        clk <= '1'; -- Set clock to 1
        wait for clk_period/2; -- Wait for half clock period
    end process clk_process;

    -- Stimulus process
    stim_proc: process
    begin 
        wait for 100 ns ; -- Wait for initial stabilization
        wait for clk_period*10; -- Wait for 10 clock periods
        wait; -- Wait indefinitely
    end process stim_proc;

END behavior;
