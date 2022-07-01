library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.uP_types.all;

entity CU_uP is
    generic (
        INSTRUCTIONS_EXECUTION_CYCLES : integer := 3;  -- Instructions Execution Clock Cycles
        MICROCODE_MEM_SIZE            : integer := 48;  -- Microcode Memory Size
        RELOC_MEM_SIZE                : integer := 15;  -- Microcode Relocation Memory Size
        OP_CODE_SIZE : integer := 6;        -- Op Code Size
        ALU_OPC_SIZE : integer := 2;        -- ALU Op Code Word Size
        IR_SIZE      : integer := 32;       -- Instruction Register Size
        FUNC_SIZE    : integer := 11;       -- Func Field Size for R-Type Ops
        CW_SIZE      : integer := 13);      -- Control Word Size

    port (
        -- Clock and Reset
        Clk             : in  std_logic;    -- Clock
        Rst_n           : in  std_logic;    -- Reset:Active-Low
        -- Instruction Register
        IR_IN           : in std_logic_vector(IR_SIZE - 1 downto 0);
        -- Pipe Stage 1 Control Signal
        EN1             : out std_logic;    -- Register File and pipeline registers enable
        RF1             : out std_logic;    -- Register File read port 1 enable
        RF2             : out std_logic;    -- Register File read port 2 enable
        WF1             : out std_logic;    -- Register File write port 1 enable
        -- Pipe Stage 2 Control Signal
        EN2             : out std_logic;    -- Register File and pipeline registers enable
        S1              : out std_logic;    -- first MUX input selection
        S2              : out std_logic;    -- second MUX input selection
        A1            : out std_logic;    -- ALU operation control MSB
        A2            : out std_logic;    -- ALU operation control LSB
        -- Pipe Stage 3 Control Signal
        EN3             : out std_logic;    -- Memory and pipeline registers enable
        RM              : out std_logic;    -- read-out memory enable
        WM              : out std_logic;    -- write-in memory enable
        S3              : out std_logic     -- MUX input selection
    );
end entity CU_uP;

architecture CU_uP_rtl of CU_uP is

    type mem_array is array (integer range 0 to MICROCODE_MEM_SIZE - 1) of std_logic_vector(CW_SIZE - 1 downto 0);
    type reloc_mem_array is array (0 to RELOC_MEM_SIZE - 1) of std_logic_vector(OP_CODE_SIZE - 1 downto 0);

    signal reloc_mem : reloc_mem_array := ( b"000000",  -- R-TYPE instructions, not relocated
                                            b"001111",  -- ITYPE_ADDI1 -> 15
                                            b"010010",  -- ITYPE_SUBI1 -> 18
                                            b"010101",  -- ITYPE_ANDI1 -> 21
                                            b"011000",  -- ITYPE_ORI1 -> 24
                                            b"011011",  -- ITYPE_ADDI2 -> 27
                                            b"011110",  -- ITYPE_SUBI2 -> 30
                                            b"100001",  -- ITYPE_ANDI2 -> 33
                                            b"100100",  -- ITYPE_ORI2 -> 36
                                            b"011011",  -- ITYPE_MOV -> 27      -- MOV can be mapped on ADDI2 since we suppose IMM=0 and operation is the same
                                            b"001111",  -- ITYPE_SREG1 -> 15    -- SREG1 can be mapped on ADDI1 supposing RS2=R0=0 (a.k.a. not used)
                                            b"011011",  -- ITYPE_SREG2 -> 27    -- SREG1 can be mapped on ADDI2 supposing RS1=R0=0 (a.k.a. not used)
                                            b"100111",  -- ITYPE_SMEM2 -> 39
                                            b"101010",  -- ITYPE_LMEM1 -> 42
                                            b"101101"  -- ITYPE_LMEM2 -> 45
    );

    signal microcode : mem_array := (   b"000_00000_00000",    -- (PS1) 'NOP'
                                        b"000_00000_00000",    -- (PS2)
                                        b"000_00000_00000",    -- (PS3)
                                        b"111_00000_00000",    -- (PS1) 'ADD RD,RS1,RS2'
                                        b"000_01001_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"111_00000_00000",    -- (PS1) 'SUB RD,RS1,RS2'
                                        b"000_01011_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"111_00000_00000",    -- (PS1) 'AND RD,RS1,RS2'
                                        b"000_01101_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"111_00000_00000",    -- (PS1) 'OR RD,RS1,RS2'
                                        b"000_01111_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"011_00000_00000",    -- (PS1) 'ADDI1 RD,RS2,INP1' (15)
                                        b"000_10001_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"011_00000_00000",    -- (PS1) 'SUBI1 RD,RS2,INP1' (18)
                                        b"000_10011_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"011_00000_00000",    -- (PS1) 'ANDI1 RD,RS2,INP1' (21)
                                        b"000_10101_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"011_00000_00000",    -- (PS1) 'ORI1 RD,RS2,INP1'  (24)
                                        b"000_10111_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"101_00000_00000",    -- (PS1) 'ADDI2 RD,RS1,INP2' (27)
                                        b"000_00001_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"101_00000_00000",    -- (PS1) 'SUBI2 RD,RS1,INP2' (30)
                                        b"000_00011_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"101_00000_00000",    -- (PS1) 'ANDI2 RD,RS1,INP2' (33)
                                        b"000_00101_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"101_00000_00000",    -- (PS1) 'ORI2 RD,RS1,INP2' (36)
                                        b"000_00111_00000",    -- (PS2)
                                        b"001_00000_00101",    -- (PS3)
                                        b"111_00000_00000",    -- (PS1) 'SMEM2 RS1,RS2,INP2' (39)
                                        b"000_00001_00000",    -- (PS2)
                                        b"000_00000_01100",    -- (PS3)
                                        b"011_00000_00000",    -- (PS1) 'LMEM1 RD,RS2,INP1' (42)
                                        b"000_11001_00000",    -- (PS2)
                                        b"001_00000_10111",    -- (PS3)
                                        b"101_00000_00000",    -- (PS1) 'LMEM2 RD,RS1,INP2' (45)
                                        b"000_00001_00000",    -- (PS2)
                                        b"001_00000_10111"    -- (PS3)
    );
    
    signal cw : std_logic_vector(CW_SIZE - 1 downto 0);     -- control word signal (holds current cw coming out of micro code mem)

    signal uPC, next_uPC : integer range 0 to 63;   -- hold current and projected micro Program Counter

    signal OpCode : std_logic_vector(OP_CODE_SIZE -1 downto 0);     -- holds OpCode retrieved from IN_IR signal
    signal OpCode_Reloc : std_logic_vector(OP_CODE_SIZE - 1 downto 0);      -- holds actual OpCode when access to uCode mem needs to be relocated
                                                            
    signal func : std_logic_vector(FUNC_SIZE - 1 downto 0);     -- holds func field retrieved from IN_IR signal

    type StateType is (C1, C2, C3);     -- states enumeration for internal FSM
    signal CurrState, NextState: StateType;     -- hold current and next State for internal FSM

begin
    
    cw <= microcode(uPC);       -- retrieves cw from uCode mem line pointed by uPC

    -- connects each bit of the cw to the dedicated output signal
    -- Pipe Stage 1 signals
    RF1 <= cw(CW_SIZE - 1);
    RF2 <= cw(CW_SIZE - 2);
    EN1 <= cw(CW_SIZE - 3);
    
    -- Pipe Stage 2 signals
    S1 <= cw(CW_SIZE - 4);
    S2 <= cw(CW_SIZE - 5);
    A1 <= cw(CW_SIZE - 6);
    A2 <= cw(CW_SIZE - 7);
    EN2 <= cw(CW_SIZE - 8);

    -- Pipe Stage 3 signals
    RM <= cw(CW_SIZE - 9);
    WM <= cw(CW_SIZE - 10);
    EN3 <= cw(CW_SIZE - 11);
    S3 <= cw(CW_SIZE - 12);
    WF1 <= cw(CW_SIZE - 13);

    OpCode <= IR_IN(IR_SIZE-1 downto 26);     -- first 6 instruction bits (31-26)
    OpCode_Reloc <= reloc_mem(conv_integer(unsigned(OpCode)));    -- accesses relocation memory at position OpCode for Opcode relocation
    func <= IR_IN(10 downto 0);           -- last 11 instruction bits (10-0)

    -- purpose: Updates uPC and CurrState registers at each clock cycle
    -- type   : sequential
    -- inputs : Clk, Rst_n
    -- outputs: uPC, CurrState
    uPC_FSM_StateReg: process(Clk, Rst_n)
    begin
        if Rst_n = '0' then      -- asynchronous reset active low

            -- reset conditions
            uPC <= 0;
            CurrState <= C1;
            
        elsif rising_edge(clk) then

            -- projected registers value is assigned to current registers
            uPC <= next_uPC;
            CurrState <= NextState;
            
        end if;
    end process uPC_FSM_StateReg;

    -- purpose: Computes projected uPC and NextState values based on CurrState value
    -- type   : combinational
    -- inputs : Rst_n, CurrState, uPc, OpCode, func, OpCode_Reloc
    -- outputs: next_uPC, NextState
    uPC_FSM_CombLogic: process(Rst_n, CurrState, uPc, OpCode, func, OpCode_Reloc)  --todo
    begin

        if (Rst_n = '0') then

            -- reset conditions
            next_uPC <= 0;
            NextState <= C1;

        elsif (Rst_n = '1') then

            -- describes behavior based on CurrState register value
            case CurrState is

                -- state C1: new instruction received
                when C1 =>
                    -- retrieves projected uPC
                    if (OpCode = RTYPE) then
                        -- for R-TYPE instruction uPC is retrieved from uCode mem at line pointed by func
                        next_uPC <= conv_integer(unsigned(func));
                        NextState <= C2;
                    else
                        -- for I-TYPE instruction uPC is retrieved from uCode mem at line pointed by OpCode relocation
                        next_uPC <= conv_integer(unsigned(OpCode_Reloc));
                    end if;

                -- state C2: uPC is incremented
                when C2 =>
                    next_uPC <= uPC + 1;
                    NextState <= C3;

                -- state C3: uPC is incremented
                when C3 =>
                    next_uPC <= uPC + 1;
                    NextState <= C1;
            
                -- recovery state (for safe FSM implementation)
                when others =>
                    next_uPC <= 0;
                    NextState <= C1;
            
            end case;

        end if;

    end process uPC_FSM_CombLogic;
    
end architecture CU_uP_rtl;