library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use work.uP_types.all;

entity tb_CU_uP is
end entity tb_CU_uP;

architecture tb_CU_uP_arch of tb_CU_uP is

    component CU_uP is
        generic (
            INSTRUCTIONS_EXECUTION_CYCLES : integer := 5;  -- Instructions Execution Clock Cycles
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
    end component;

    constant IR_SIZE: integer := 32;
    constant CW_SIZE: integer := 13;
    constant Clk_period: time := 2 ns;

    signal Clk_s: std_logic;
    signal Rst_n_s: std_logic;

    signal IR_IN_s: std_logic_vector(IR_SIZE-1 downto 0);

    signal EN1_s: std_logic;
    signal RF1_s: std_logic;
    signal RF2_s: std_logic;
    signal WF1_s: std_logic;

    signal EN2_s: std_logic;
    signal S1_s: std_logic;
    signal S2_s: std_logic;
    signal A1_s: std_logic;
    signal A2_s: std_logic;

    signal EN3_s: std_logic;
    signal RM_s: std_logic;
    signal WM_s: std_logic;
    signal S3_s: std_logic;

    signal cw : std_logic_vector(CW_SIZE-1 downto 0);

    signal RD_v, RS1_v, RS2_v : std_logic_vector(4 downto 0) := (others => '0');    -- destination and source registers signals
    signal IMM_v : std_logic_vector(15 downto 0) := (others => '0');        -- immediate value signal
    
begin

    DUT:    CU_uP
            generic map (
                            INSTRUCTIONS_EXECUTION_CYCLES => 3,
                            MICROCODE_MEM_SIZE => 48,
                            RELOC_MEM_SIZE => 15,
                            OP_CODE_SIZE => 6,
                            ALU_OPC_SIZE => 2,
                            IR_SIZE => 32,
                            FUNC_SIZE => 11,
                            CW_SIZE => 13
            )
            port map (
                        Clk => Clk_s,
                        Rst_n => Rst_n_s,
                        IR_IN => IR_IN_s,
                        EN1 => EN1_s,
                        RF1 => RF1_s,
                        RF2 => RF2_s,
                        WF1 => WF1_s,
                        EN2 => EN2_s,
                        S1 => S1_s,
                        S2 => S2_s,
                        A1 => A1_s,
                        A2 => A2_s,
                        EN3 => EN3_s,
                        RM => RM_s,
                        WM => WM_s,
                        S3 => S3_s
            );
    
    clkProc: process
    begin
        
        Clk_s <= '0';
        wait for Clk_period/2;
        Clk_s <= '1';
        wait for Clk_period/2;

    end process clkProc;

    -- test vector process: tests each instruction, each followed by a NOP for better waveform analysis
    -- NOTE: in this version all source/dest/immediate signals are kept to all '0' pattern, since the purpose
    --          of this testbench is to verify uP_CU instructions decode and relative control words generation
    vectProc: process
    begin
      
        wait for Clk_period/4;
        Rst_n_s <= '0';     -- reset (asserted low)

        wait for Clk_period;

        Rst_n_s <= '1';     -- releases reset
        IR_IN_s <= (others => '0');     -- clears input instruction signal

        -- R-TYPE Instructions Test
        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & RTYPE_ADD;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & NOP;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & RTYPE_SUB;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & NOP;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & RTYPE_AND;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & NOP;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & RTYPE_OR;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & RS2_v & NOP;

        -- I-TYPE Instructions Test
        -- I1 sub-group
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ADDI1 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_SUBI1 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ANDI1 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ORI1 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        -- I2 sub-group
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ADDI2 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_SUBI2 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ANDI2 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_ORI2 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        -- MOV
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_MOV & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        -- SREG
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_SREG1 & RD_v & REG_0 & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_SREG2 & RD_v & REG_0 & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        -- SMEM
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_SMEM2 & RS1_v & RS2_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        -- LMEM
        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_LMEM1 & RD_v & RS2_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= ITYPE_LMEM2 & RD_v & RS1_v & IMM_v;

        wait for 3*Clk_period;
        IR_IN_s <= RTYPE & RD_v & RS1_v & IMM_v;

        wait;

    end process vectProc;

    -- control word to dedicated signal binding
    cw(CW_SIZE - 1) <= RF1_s;
    cw(CW_SIZE - 2) <= RF2_s;
    cw(CW_SIZE - 3) <= EN1_s;

    cw(CW_SIZE - 4) <= S1_s;
    cw(CW_SIZE - 5) <= S2_s;
    cw(CW_SIZE - 6) <= A1_s;
    cw(CW_SIZE - 7) <= A2_s;
    cw(CW_SIZE - 8) <= EN2_s;

    cw(CW_SIZE - 9) <= RM_s;
    cw(CW_SIZE - 10) <= WM_s;
    cw(CW_SIZE - 11) <= EN3_s;
    cw(CW_SIZE - 12) <= S3_s;
    cw(CW_SIZE - 13) <= WF1_s;
    
end architecture tb_CU_uP_arch;
