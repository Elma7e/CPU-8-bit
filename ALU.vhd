-- Arithmetic Logic Unit (ALU) Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types
use IEEE.NUMERIC_STD.ALL;

entity ALU is -- Declaration of the ALU entity
    port (
        OP : in STD_LOGIC_VECTOR(1 downto 0); -- Operation input
        rIn : in STD_LOGIC_VECTOR(7 downto 0); -- First input operand
        rIn2 : in STD_LOGIC_VECTOR(7 downto 0); -- Second input operand
        rOut : out STD_LOGIC_VECTOR(7 downto 0)  -- Result output
    );
end ALU;

architecture behavioral of ALU is -- Architecture for the ALU entity
    signal result : std_logic_vector(7 downto 0); -- Signal for result output
begin
    process(OP, rIn, rIn2) -- Process sensitive to operation code and input operands
    begin
        if (OP = "00") then -- Addition operation
            result <= std_logic_vector(unsigned(rIn) + unsigned(rIn2)); -- Perform addition
        elsif (OP = "01") then -- Subtraction operation
            result <= std_logic_vector(unsigned(rIn) - unsigned(rIn2)); -- Perform subtraction
        elsif (OP = "10") then -- Logical AND operation
            result <= rIn and rIn2; -- Perform logical AND
        elsif (OP = "11") then -- Increment operation
            result <= std_logic_vector(unsigned(rIn) + to_unsigned(1, 7)); -- Perform increment
        else -- Default case
            result <= std_logic_vector(unsigned(rIn) + unsigned(rIn2)); -- Default to addition
        end if;
    end process;

    rOut <= result;   -- Assign result to output port
end behavioral;
