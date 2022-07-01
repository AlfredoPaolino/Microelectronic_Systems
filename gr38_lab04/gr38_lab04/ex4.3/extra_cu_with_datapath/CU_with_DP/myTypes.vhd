library ieee;
use ieee.std_logic_1164.all;

package myTypes is

-- Control unit input sizes
    	constant OPCODE_SIZE : integer :=  6;                                              -- OPCODE field size
    	constant FUNC_SIZE    : integer :=  11;                                             -- FUNC field size

-- R-Type instruction -> FUNC field
    	constant RTYPE_ADD : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000000";    -- ADD RS1,RS2,RD
    	constant RTYPE_SUB : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000001";    -- SUB RS1,RS2,RD
    	constant RTYPE_AND : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000010";    -- AND RS1,RS2,RD
    	constant RTYPE_OR : std_logic_vector(FUNC_SIZE - 1 downto 0) :=  "00000000011";    -- OR RS1,RS2,RD

-- R-Type instruction -> OPCODE field
    	constant RTYPE : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "000000";          -- for ADD, SUB, AND, OR register-to-register operation

-- I-Type instruction -> OPCODE field
    	constant ITYPE_ADDI1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "010000";    -- ADDI1 RS2,RD,INP1
    	constant ITYPE_SUBI1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "010001";    -- SUBI1 RS2,RD,INP1
		constant ITYPE_ANDI1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "010010";    -- ANDI1 RS2,RD,INP1
		constant ITYPE_ORI1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "010011";    -- ORI1 RS2,RD,INP1
		constant ITYPE_ADDI2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100000";    -- ADDI2 RS1,RD,INP2
    	constant ITYPE_SUBI2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100001";    -- SUBI2 RS1,RD,INP2
		constant ITYPE_ANDI2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100010";    -- ANDI2 RS1,RD,INP2
		constant ITYPE_ORI2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100011";    -- ORI2 RS1,RD,INP2
    	constant ITYPE_MOV : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100000";    -- mapped on ADDI1
    	constant ITYPE_SREG1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "110000";    -- performs ORI12 RD, INP1, INP2
    	constant ITYPE_SREG2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "110000";    -- performs ORI12 RD, INP1, INP2
    	constant ITYPE_SMEM2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "101000";    -- performs ADDI2 and enables writing in memory
    	constant ITYPE_LMEM1 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "010100";    -- performs ADDI1 and enables reading from memory
    	constant ITYPE_LMEM2 : std_logic_vector(OPCODE_SIZE - 1 downto 0) :=  "100100";    -- performs ADDI2 and enables reading from memory

end myTypes;

