library ieee;
use ieee.std_logic_1164.all;
use work.myTypes.all;

entity CU_FSM_TB is
end CU_FSM_TB;

architecture TBarch of CU_FSM_TB is

    component CU_FSM is
        generic (
            OPCODE_SIZE       :     integer := 6;      -- Op Code Size
            FUNC_SIZE          :     integer := 11    -- Func Field Size for R-Type Ops
            );
        port (  
            OPCODE : in std_logic_vector(OPCODE_SIZE-1 downto 0);
            FUNC : in std_logic_vector(FUNC_SIZE-1 downto 0);
            CLK, RST : in std_logic;
            -- FIRST PIPE STAGE OUTPUTS
            EN1    : out std_logic;               -- enables the register file and the pipeline registers
            RF1    : out std_logic;               -- enables the read port 1 of the register file
            RF2    : out std_logic;               -- enables the read port 2 of the register file
            WF1    : out std_logic;               -- enables the write port of the register file
            -- SECOND PIPE STAGE OUTPUTS
            EN2    : out std_logic;               -- enables the pipe registers
            S1     : out std_logic;               -- input selection of the first multiplexer
            S2     : out std_logic;               -- input selection of the second multiplexer
            ALU1   : out std_logic;               -- alu control bit
            ALU2   : out std_logic;               -- alu control bit
            -- THIRD PIPE STAGE OUTPUTS
            EN3    : out std_logic;               -- enables the memory and the pipeline registers
            RM     : out std_logic;               -- enables the read-out of the memory
            WM     : out std_logic;               -- enables the write-in of the memory
            S3     : out std_logic               -- input selection of the multiplexer
            );
    end component;
    
    constant ClockPeriod : time := 10 ns;
    
    signal OPCODE_s : std_logic_vector(5 downto 0);
    signal FUNC_s : std_logic_vector(10 downto 0);
    signal CLK_s, RST_s : std_logic := '0';
    signal EN1_s, RF1_s, RF2_s, WF1_s, EN2_s, S1_s, S2_s, ALU1_s, ALU2_s, EN3_s, RM_s, WM_s, S3_s : std_logic;
    
    
begin

    DUT : CU_FSM 
        generic map (6, 11)
        port map (OPCODE_s, FUNC_s, CLK_s, RST_s, EN1_s, RF1_s, RF2_s, WF1_s, EN2_s, S1_s, S2_s, ALU1_s, ALU2_s, EN3_s, RM_s, WM_s, S3_s);
        
    clkProcess : process
    begin
        CLK_s <= not CLK_s;
        wait for ClockPeriod/2;
    end process;
    
    vectProcess : process
    begin

        RST_s <= '1';
        wait for ClockPeriod;
        RST_s <= '0';

		--R type--

        OPCODE_s <= RTYPE;
        FUNC_s <= RTYPE_ADD;
        wait for 3*ClockPeriod;

		FUNC_s <= RTYPE_SUB;
        wait for 3*ClockPeriod;

		FUNC_s <= RTYPE_AND;
        wait for 3*ClockPeriod;

		FUNC_s <= RTYPE_OR;
        wait for 3*ClockPeriod;

		--I type--

        OPCODE_s <= ITYPE_ADDI1;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_SUBI1;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_ANDI1;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_ORI1;
        wait for 3*ClockPeriod;

 		OPCODE_s <= ITYPE_ADDI2;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_SUBI2;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_ANDI2;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_ORI2;
        wait for 3*ClockPeriod;

		OPCODE_s <= ITYPE_MOV;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_SREG1;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_SREG2;
        wait for 3*ClockPeriod;

        OPCODE_s <= ITYPE_SMEM2;
        wait for 3*ClockPeriod;

		OPCODE_s <= ITYPE_LMEM1;
        wait for 3*ClockPeriod;

		OPCODE_s <= ITYPE_LMEM2;
        wait for 3*ClockPeriod;

        wait;
    end process;
end TBarch;
