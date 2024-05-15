-- Program Counter (PC) Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types
use IEEE.NUMERIC_STD.ALL; -- for the signed and unsigned

entity PC is -- Declaration of the PC entity
    port (
        clk : in STD_LOGIC; -- Clock input
        next_instr : out STD_LOGIC_VECTOR(2 downto 0) -- Next instruction address output
    );
end PC;

architecture behavioral of PC is -- Architecture for the PC entity
    signal current_signal : STD_LOGIC_VECTOR(2 downto 0) := "000"; -- Signal for current instruction address, initialized to 0

begin
    process (clk) -- Process for clock signal
    begin
        if falling_edge(clk) then -- Check for falling edge of clock signal
            current_signal <= std_logic_vector(unsigned(current_signal) + to_unsigned(1, 3)); -- Increment current instruction address
        end if;
    end process;
    next_instr <= current_signal; -- Assign current instruction address to next instruction address output
end behavioral;
