library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.functions.all;

entity WRF_generic is
  generic (M        : integer := 8;
           N        : integer := 8;
           F        : integer := 8;
           DATA_BIT : integer := 32
           );
  port (CLK         : in  std_logic;
        RST         : in  std_logic;
        EN          : in  std_logic;
        RD1         : in  std_logic;
        RD2         : in  std_logic;
        WR          : in  std_logic;
        CALL        : in  std_logic;
        RET         : in  std_logic;
        ADDR_WR     : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        ADDR_RD1    : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        ADDR_RD2    : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        DATA_IN_MEM : in  std_logic_vector(DATA_BIT-1 downto 0);
        DATA_IN     : in  std_logic_vector(DATA_BIT-1 downto 0);
        SPILL       : out std_logic;
        FILL        : out std_logic;
        OUT_MEM     : out std_logic_vector(DATA_BIT-1 downto 0);
        OUT1        : out std_logic_vector(DATA_BIT-1 downto 0);
        OUT2        : out std_logic_vector(DATA_BIT-1 downto 0));

end WRF_generic;

architecture struct of WRF_generic is

  component RML is
    generic (M : integer := 8;
             N : integer := 8;
             F : integer := 8
             );
    port (
      CLK       : in  std_logic;
      RST       : in  std_logic;
      EN        : in  std_logic;
      CALL      : in  std_logic;
      RET       : in  std_logic;
      BASE_ADDR : out std_logic_vector(log2(2*N*F)-1 downto 0);
      SPILL     : out std_logic;
      FILL      : out std_logic
      );
  end component;

  component ATU is
    generic (M : integer := 8;
             N : integer := 8;
             F : integer := 8
             );
    port (CWP        : in  std_logic_vector(log2(2*N*F)-1 downto 0);
          ADDR_WR_i  : in  std_logic_vector(log2(3*N+M)-1 downto 0);
          ADDR_RD1_i : in  std_logic_vector(log2(3*N+M)-1 downto 0);
          ADDR_RD2_i : in  std_logic_vector(log2(3*N+M)-1 downto 0);
          ADDR_WR_o  : out std_logic_vector(log2(2*N*F+M)-1 downto 0);
          ADDR_RD1_o : out std_logic_vector(log2(2*N*F+M)-1 downto 0);
          ADDR_RD2_o : out std_logic_vector(log2(2*N*F+M)-1 downto 0)
          );
  end component;
  component physicalRF is
    generic (M        : integer := 8;
             N        : integer := 8;
             F        : integer := 8;
             DATA_BIT : integer := 32
             );

    port (CLK      : in  std_logic;
          RST      : in  std_logic;
          EN       : in  std_logic;
          RD1      : in  std_logic;
          RD2      : in  std_logic;
          WR       : in  std_logic;
          ADDR_WR  : in  std_logic_vector(log2(2*N*F+M)-1 downto 0);
          ADDR_RD1 : in  std_logic_vector(log2(2*N*F+M)-1 downto 0);
          ADDR_RD2 : in  std_logic_vector(log2(2*N*F+M)-1 downto 0);
          DATA_IN  : in  std_logic_vector(DATA_BIT-1 downto 0);
          OUT1     : out std_logic_vector(DATA_BIT-1 downto 0);
          OUT2     : out std_logic_vector(DATA_BIT-1 downto 0));
  end component;
  component MUX21_GENERIC is
    generic (NBIT : integer := 4);
    port (A   : in  std_logic_vector(NBIT-1 downto 0);
          B   : in  std_logic_vector(NBIT-1 downto 0);
          SEL : in  std_logic;
          Y   : out std_logic_vector(NBIT-1 downto 0));
  end component;

  signal intermediate_CWP        : std_logic_vector(log2(2*N*F)-1 downto 0);
  signal intermediate_ADDR_WR_o  : std_logic_vector(log2(2*N*F+M)-1 downto 0);
  signal intermediate_ADDR_RD1_o : std_logic_vector(log2(2*N*F+M)-1 downto 0);
  signal intermediate_ADDR_RD2_o : std_logic_vector(log2(2*N*F+M)-1 downto 0);
  signal intermediate_SPILL      : std_logic;
  signal intermediate_FILL       : std_logic;
  signal intermediate_DATA_IN    : std_logic_vector(DATA_BIT-1 downto 0);
  signal intermediate_OUT        : std_logic_vector(DATA_BIT-1 downto 0);
  signal intermediate_WR         : std_logic;
  signal intermediate_RD1        : std_logic;
  
begin

  intermediate_WR  <= (intermediate_FILL or WR) and (not intermediate_SPILL);
  intermediate_RD1 <= intermediate_SPILL or RD1;
  SPILL            <= intermediate_SPILL;
  FILL             <= intermediate_FILL;
  OUT1 			   <= intermediate_OUT;
  OUT_MEM          <= intermediate_OUT;
--register management logic
  REG_MGMT_LOGIC : RML generic map (M => M, N => N, F => F) port map (CLK => CLK, RST => RST, EN => EN, CALL => CALL, RET => RET, BASE_ADDR => intermediate_CWP, SPILL => intermediate_SPILL, FILL => intermediate_FILL);

  ADDR_TRANSLATION_UNIT : ATU generic map (M => M, N => N, F => F)
    port map (CWP        => intermediate_CWP, ADDR_WR_i => ADDR_WR, ADDR_RD1_i => ADDR_RD1, ADDR_RD2_i => ADDR_RD2,
              ADDR_WR_o  => intermediate_ADDR_WR_o, ADDR_RD1_o => intermediate_ADDR_RD1_o,
              ADDR_RD2_o => intermediate_ADDR_RD2_O);

  MUX21   : MUX21_GENERIC generic map (NBIT  => DATA_BIT) port map(A => DATA_IN, B => DATA_IN_MEM, SEL => intermediate_FILL, Y => intermediate_DATA_IN);

  PHYSICAL_REGFILE : physicalRF generic map (N => N, M => M, F => F, DATA_BIT => DATA_BIT)
    port map (CLK      => CLK, RST => RST, EN => EN, RD1 => intermediate_RD1, RD2 => RD2, WR => intermediate_WR, ADDR_WR => intermediate_ADDR_WR_o, ADDR_RD1 => intermediate_ADDR_RD1_o,
              ADDR_RD2 => intermediate_ADDR_RD2_o, DATA_IN => intermediate_DATA_IN, OUT1 => intermediate_OUT,
              OUT2     => OUT2);

end struct;
