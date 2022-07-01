library ieee;
use ieee.std_logic_1164.all;

entity TopLevel is
generic (
    ADDR_BITS : integer := 5;
    DATA_BITS : integer := 32;
    IMM_BITS : integer := 16;
    OPCODE_SIZE : integer := 6;
    FUNC_SIZE : integer := 11
    );
port (
    CLK, RST : in std_logic;
    INSTRUCTION : in std_logic_vector(31 downto 0);
    O : out std_logic_vector(DATA_BITS-1 downto 0)
    );
end TopLevel;

architecture struct of TopLevel is

    component CU_FSM is
    generic (
        OPCODE_SIZE : integer := 6;      -- Op Code Size
        FUNC_SIZE : integer := 16    -- Func Field Size for R-Type Ops
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
    
    component DP is
    generic (
        ADDR_BITS : integer := 5;
        DATA_BITS : integer := 32;
        IMM_BITS : integer := 16
        );
    port (  
        CLK, RST : in std_logic;
        -- FIRST PIPE STAGE OUTPUTS
        EN1    : in std_logic;               -- enables the register file and the pipeline registers
        RF1    : in std_logic;               -- enables the read port 1 of the register file
        RF2    : in std_logic;               -- enables the read port 2 of the register file
        WF1    : in std_logic;               -- enables the write port of the register file
        -- SECOND PIPE STAGE OUTPUTS
        EN2    : in std_logic;               -- enables the pipe registers
        S1     : in std_logic;               -- input selection of the first multiplexer
        S2     : in std_logic;               -- input selection of the second multiplexer
        ALU1   : in std_logic;               -- alu control bit
        ALU2   : in std_logic;               -- alu control bit
        -- THIRD PIPE STAGE OUTPUTS
        EN3    : in std_logic;               -- enables the memory and the pipeline registers
        RM     : in std_logic;               -- enables the read-out of the memory
        WM     : in std_logic;               -- enables the write-in of the memory
        S3     : in std_logic;               -- input selection of the multiplexer
        INP1   : in std_logic_vector (IMM_BITS-1 downto 0);
        INP2   : in std_logic_vector (IMM_BITS-1 downto 0);
        RS1    : in std_logic_vector (ADDR_BITS-1 downto 0);
        RS2    : in std_logic_vector (ADDR_BITS-1 downto 0);
        RD     : in std_logic_vector (ADDR_BITS-1 downto 0);
        O      : out std_logic_vector (DATA_BITS-1 downto 0)
        );
    end component;
    
    signal EN1_i, RF1_i, RF2_i, WF1_i, EN2_i, S1_i, S2_i, ALU1_i, ALU2_i, EN3_i, RM_i, WM_i, S3_i : std_logic;

begin 

    CU1: CU_FSM generic map (OPCODE_SIZE, FUNC_SIZE)
                port map (INSTRUCTION(31 downto 26), INSTRUCTION(10 downto 0), CLK ,RST, EN1_i, RF1_i, RF2_i, WF1_i, EN2_i, S1_i, S2_i, ALU1_i, ALU2_i, EN3_i, RM_i, WM_i, S3_i);
    DP1: DP generic map (ADDR_BITS, DATA_BITS, IMM_BITS)
                port map (CLK ,RST, EN1_i, RF1_i, RF2_i, WF1_i, EN2_i, S1_i, S2_i, ALU1_i, ALU2_i, EN3_i, RM_i, WM_i, S3_i, INSTRUCTION(15 downto 0), INSTRUCTION(15 downto 0), INSTRUCTION(20 downto 16), INSTRUCTION(15 downto 11), INSTRUCTION(25 downto 21), O);

end struct;