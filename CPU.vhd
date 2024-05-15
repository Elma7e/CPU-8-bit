-- CPU (elma7eCPU) Entity Declaration
library IEEE; -- Standard VHDL library
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic types
entity elma7eCPU is -- Declaration of the CPU entity
 port (
      clk : in STD_LOGIC; -- Clock input
      value : out STD_LOGIC_VECTOR (7 downto 0) -- Output value
      );
end elma7eCPU;

architecture behavioral of elma7eCPU is -- Architecture for the CPU entity
-- Component Declarations
COMPONENT ALU -- Declaration of the ALU component
  PORT (
         OP : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- ALU operation input
         rIn : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- First input operand
         rIn2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Second input operand
         rOut : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Result output
       );
END COMPONENT;

COMPONENT instruct -- Declaration of the instruction memory component
  PORT (
         instr_addr : IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Instruction address input
         OP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); 	   -- Operation code output
         rOut_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- Output register address output
         rIn_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- First input register address output
         rIn2_addr : OUT STD_LOGIC_VECTOR(1 DOWNTO 0) -- Second input register address output
       );
END COMPONENT;

COMPONENT PC -- Declaration of the program counter component
  PORT (
         clk : IN STD_LOGIC; -- Clock input
         next_instr: OUT STD_LOGIC_VECTOR(2 DOWNTO 0) -- Next instruction address output
       );
END COMPONENT;

COMPONENT reg_file -- Declaration of the register file component
  PORT (
         clk : IN STD_LOGIC; -- Clock input
         rOut_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Output register address input
         rIn_addr : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- First input register address input
         rIn2_addr:  IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Second input register address input
         wr_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- Write data input
         rIn : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- First input register output
         rIn2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- Second input register output
       );
END COMPONENT;

-- Signal Declarations
SIGNAL WIRE_0: STD_LOGIC_VECTOR (1 DOWNTO 0); -- Signal for ALU operation
SIGNAL WIRE_1 : STD_LOGIC_VECTOR (7 DOWNTO 0); -- Signal for first input operand
SIGNAL WIRE_2: STD_LOGIC_VECTOR( 7 DOWNTO 0); -- Signal for second input operand
SIGNAL WIRE_3 : STD_LOGIC_VECTOR( 1 DOWNTO 0); -- Signal for ALU operation output
SIGNAL WIRE_4 : STD_LOGIC_VECTOR( 1 DOWNTO 0); -- Signal for first input register address
SIGNAL WIRE_5 : STD_LOGIC_VECTOR( 1 DOWNTO 0); -- Signal for second input register address
SIGNAL WIRE_6 : STD_LOGIC_VECTOR( 1 DOWNTO 0); -- Signal for output register address
SIGNAL WIRE_7 : STD_LOGIC_VECTOR (2 DOWNTO 0); -- Signal for instruction address
SIGNAL WIRE_8: STD_LOGIC_VECTOR (7 DOWNTO 0); -- Signal for result output

BEGIN
value <= WIRE_8; -- Assigning result output to value output port

-- Instantiation of Components
arithmetic_logic_unit : ALU
PORT MAP ( OP => WIRE_0, -- Connecting ALU operation input
           rIn => WIRE_1, -- Connecting first input operand
           rIn2 => WIRE_2, -- Connecting second input operand
           rOut => WIRE_8 -- Connecting result output
         );

instruct_memory : instruct
PORT MAP ( instr_addr => WIRE_7, -- Connecting instruction address input
           OP => WIRE_3, -- Connecting operation code output
           rIn_addr => WIRE_4, -- Connecting first input register address output
           rIn2_addr => WIRE_5, -- Connecting second input register address output
           rOut_addr => WIRE_6 -- Connecting output register address output
         );

program_counter : PC
PORT MAP(clk => clk, -- Connecting clock input
        next_instr => WIRE_7 -- Connecting next instruction address output
      );

reg_file_map : reg_file
PORT MAP( clk => clk,  -- Connecting clock input
          rIn_addr => WIRE_4, -- Connecting first input register address input
          rIn2_addr => WIRE_5, -- Connecting second input register address input
          rOut_addr => WIRE_6, -- Connecting output register address input
          wr_data => WIRE_8, -- Connecting write data input
          rIn => WIRE_1, -- Connecting first input register output
          rIn2 => WIRE_2 -- Connecting second input register output
        );

END behavioral;
