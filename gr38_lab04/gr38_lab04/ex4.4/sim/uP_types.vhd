library ieee;
use ieee.std_logic_1164.all;

package uP_types is

-- Control unit input sizes
    constant OP_CODE_SIZE : integer :=  6;                                              -- OPCODE field size
    constant FUNC_SIZE    : integer :=  11;                                             -- FUNC field size

-- Special Registers
    constant REG_0        : std_logic_vector(4 downto 0) := (others => '0');

-- R-Type instruction -> FUNC field
    constant NOP       : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000000";    -- no operation
    constant RTYPE_ADD : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000011";    -- ADD RD,RS1,RS2
    constant RTYPE_SUB : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000110";    -- SUB RD,RS1,RS2
	constant RTYPE_AND : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000001001";    -- AND RD,RS1,RS2
    constant RTYPE_OR  : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000001100";    -- OR  RD,RS1,RS2

-- R-Type instruction -> OPCODE field
    constant RTYPE : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000000";          -- for ADD, SUB, AND, OR register-to-register operation

-- I-Type instruction -> OPCODE field
    constant ITYPE_ADDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000001";    -- ADDI1 RD,RS1,INP1
    constant ITYPE_SUBI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000010";    -- SUBI1 RD,RS1,INP1
    constant ITYPE_ANDI1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000011";    -- ANDI1 RD,RS1,INP1
    constant ITYPE_ORI1  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000100";    -- ORI1  RD,RS1,INP1
    constant ITYPE_ADDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000101";    -- ADDI2 RD,RS1,INP2
    constant ITYPE_SUBI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000110";    -- SUBI2 RD,RS1,INP2
    constant ITYPE_ANDI2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "000111";    -- ANDI2 RD,RS1,INP2
    constant ITYPE_ORI2  : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001000";    -- ORI2  RD,RS1,INP2
    constant ITYPE_MOV   : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001001";    -- MOV   RD,RS1,INP2
    constant ITYPE_SREG1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001010";    -- SREG  RD,(R0),INP1
    constant ITYPE_SREG2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001011";    -- SREG  RD,(R0),INP2
    constant ITYPE_SMEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001100";    -- SMEM2 RS1,RS2,INP2
    constant ITYPE_LMEM1 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001101";    -- LMEM1 RD,RS2,INP1
    constant ITYPE_LMEM2 : std_logic_vector(OP_CODE_SIZE - 1 downto 0) :=  "001110";    -- LMEM2 RD,RS1,INP2

end uP_types;

