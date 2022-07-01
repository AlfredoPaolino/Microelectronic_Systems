library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DP is
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
end DP;

architecture struct of DP is

    component RF is
    generic (
        ADDR_BITS : integer := 5;
        DATA_BITS : integer := 32
        );
    port (
        CLK      : in  std_logic;
        RST      : in  std_logic;
        EN       : in  std_logic;
        RF1      : in  std_logic;
        RF2      : in  std_logic;
        WF1      : in  std_logic;
        ADDR_WR  : in  std_logic_vector(ADDR_BITS-1 downto 0);
        ADDR_RD1 : in  std_logic_vector(ADDR_BITS-1 downto 0);
        ADDR_RD2 : in  std_logic_vector(ADDR_BITS-1 downto 0);
        DATA_IN  : in  std_logic_vector(DATA_BITS-1 downto 0);
        OUT_A    : out std_logic_vector(DATA_BITS-1 downto 0);
        OUT_B    : out std_logic_vector(DATA_BITS-1 downto 0)
        );
    end component;
    
    component REG is
    generic (
        DATA_BITS : integer := 32
        );
    port (
        CLK, RST : in std_logic;
        I : in std_logic_vector(DATA_BITS-1 downto 0);
        O : out std_logic_vector(DATA_BITS-1 downto 0)
        );
    end component;
    
    component MUX is
    generic (
        DATA_BITS : integer := 32
        );
    port (
        IN0, IN1 : in std_logic_vector(DATA_BITS-1 downto 0);
        S : in std_logic;
        O : out std_logic_vector(DATA_BITS-1 downto 0)
        );
    end component;
    
    component ALU is
    generic (
        DATA_BITS : integer :=  32
        );
    port (
        OP1, OP2 : in std_logic_vector(DATA_BITS-1 downto 0);
        S1, S2 : in std_logic;
        RES : out std_logic_vector(DATA_BITS-1 downto 0)
        );
    end component;
    
    signal ZERO_PAD_i : std_logic_vector (DATA_BITS - IMM_BITS -1 downto 0) := (others => '0');
    signal DATA_IN_i, A_IN_i, B_IN_i, INP1_i, INP2_i : std_logic_vector (DATA_BITS-1 downto 0);
    signal A_OUT_i, B_OUT_i, MUX_A_i, MUX_B_i, ALU_OUT_i, ALU_OUT_REG_i : std_logic_vector (DATA_BITS-1 downto 0);
    signal RD1_i, RD2_i : std_logic_vector (ADDR_BITS-1 downto 0);
    signal EXT_INP1, EXT_INP2 : std_logic_vector(DATA_BITS-1 downto 0);
    signal O_i : std_logic_vector(DATA_BITS-1 downto 0);
    
begin
    EXT_INP1 <= ZERO_PAD_i&INP1;
    EXT_INP2 <= ZERO_PAD_i&INP2;
    O <= O_i;
    REGFILE: RF generic map (ADDR_BITS, DATA_BITS) 
                port map (CLK, RST, EN1, RF1, RF2, WF1, RD2_i, RS1, RS2, ALU_OUT_REG_i, A_IN_i, B_IN_i);
    REGINP1: REG generic map (DATA_BITS)
                port map (CLK, RST, EXT_INP1, INP1_i);
    REGA: REG generic map (DATA_BITS)
                port map (CLK, RST, A_IN_i, A_OUT_i);
    REGB: REG generic map (DATA_BITS)
                port map (CLK, RST, B_IN_i, B_OUT_i);                    
    REGINP2: REG generic map (DATA_BITS)
                port map (CLK, RST, EXT_INP2, INP2_i);
    REGRD1: REG generic map (ADDR_BITS)
                port map (CLK, RST, RD, RD1_i);
    MUXA: MUX generic map (DATA_BITS)
                port map (A_OUT_i, INP1_i, S1, MUX_A_i);
    MUXB: MUX generic map (DATA_BITS)
                port map (B_OUT_i, INP2_i, S2, MUX_B_i);
    ALUA: ALU generic map (DATA_BITS)
                port map (MUX_A_i, MUX_B_i, ALU1, ALU2, ALU_OUT_i);
    REGALU: REG generic map (DATA_BITS)
                port map (CLK, RST, ALU_OUT_i, ALU_OUT_REG_i);
    REGRD2: REG generic map (ADDR_BITS)
                port map (CLK, RST, RD1_i, RD2_i);
    REGOUT: REG generic map (DATA_BITS)
                port map (CLK, RST, ALU_OUT_REG_i, O_i);
end struct;
