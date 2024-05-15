-- Instruction Memory (instruct) Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types
use IEEE.NUMERIC_STD.ALL;

entity instruct is -- Declaration of the instruct entity
    port (
        instr_addr : in STD_LOGIC_VECTOR(2 downto 0); -- Instruction address input
        OP : out STD_LOGIC_VECTOR(1 downto 0); -- Operation code output
        rIn_addr : out STD_LOGIC_VECTOR(1 downto 0); -- First input register address output
        rIn2_addr : out STD_LOGIC_VECTOR(1 downto 0); -- Second input register address output
        rOut_addr : out STD_LOGIC_VECTOR(1 downto 0) -- Output register address output
    );
end instruct;

architecture behavioral of instruct is -- Architecture for the instruct entity
    type instruct_set is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0); -- Type declaration for instruction set
    constant instr : instruct_set := ( -- Constant array representing instructions
        "01000010", -- Instruction 000
        "11010101", -- Instruction 001
        "11101011", -- Instruction 010
        "01000111", -- Instruction 011
        "10101100", -- Instruction 100
        "00000000", -- Instruction 101
        "00000000", -- Instruction 110
        "00000000"  -- Instruction 111
    );
begin
    -- Assigning outputs based on instruction address
    OP <= instr(to_integer(unsigned(instr_addr)))(7 downto 6); -- Extracting operation code from instruction
    rIn_addr <= instr(to_integer(unsigned(instr_addr)))(5 downto 4); -- Extracting first input register address from instruction
    rIn2_addr <= instr(to_integer(unsigned(instr_addr)))(3 downto 2); -- Extracting second input register address from instruction
    rOut_addr <= instr(to_integer(unsigned(instr_addr)))(1 downto 0); -- Extracting output register address from instruction
end behavioral;

