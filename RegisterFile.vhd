-- Register File (reg_file) Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types
use IEEE.NUMERIC_STD.ALL;

entity reg_file is -- Declaration of the reg_file entity
    port (
        clk : in STD_LOGIC; -- Clock input
        rIn_addr : in STD_LOGIC_VECTOR(1 downto 0); -- Output register address input
        rIn2_addr : in STD_LOGIC_VECTOR(1 downto 0); -- Second input register address input
        rOut_addr : in STD_LOGIC_VECTOR(1 downto 0); -- Output register address input
        wr_data : in STD_LOGIC_VECTOR(7 downto 0); -- Write data input
        rIn : out STD_LOGIC_VECTOR(7 downto 0); -- First input register output
        rIn2 : out STD_LOGIC_VECTOR(7 downto 0) -- Second input register output
    );
end reg_file;

architecture behavioral of reg_file is -- Architecture for the reg_file entity
    type registerfile is array (0 to 3) of std_logic_vector(7 downto 0); -- Type declaration for register file
    signal reg : registerfile := ( -- Signal declaration for register file, initialized with default values
        "11000010", -- Register 00
        "11010101", -- Register 01
        "11101011", -- Register 10
        "01000111"  -- Register 11
    );
begin
    process (clk) -- Process for clock signal
    begin
        if falling_edge(clk) then -- Check for falling edge of clock signal
            reg(to_integer(unsigned(rOut_addr))) <= wr_data; -- Write data to specified register on falling edge
        end if;
    end process;

    -- Output signals assigned based on register addresses
    rIn <= reg(to_integer(unsigned(rIn_addr))); -- Assign first input register output based on address
    rIn2 <= reg(to_integer(unsigned(rIn2_addr))); -- Assign second input register output based on address
end behavioral;
