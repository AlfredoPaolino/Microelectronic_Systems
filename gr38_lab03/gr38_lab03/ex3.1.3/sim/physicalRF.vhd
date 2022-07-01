library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.functions.all;

-- generic Physical Register
entity physicalRF is
  generic (M        : integer := 8;     -- number of GLOBAL registers
           N        : integer := 8;  -- number of registers in each IN/OUT/LOCAL window
           F        : integer := 8;     -- number of windows
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
end physicalRF;

-- Physical Register architecture described behaviorally
architecture beh of physicalRF is

  subtype REG_ADDR is natural range 0 to 2*N*F+M - 1;  -- total number of available addresses
  -- defines an array of data words type of DATA_BIT width
  type REG_ARRAY is array(REG_ADDR) of std_logic_vector(DATA_BIT-1 downto 0);
  signal REGS : REG_ARRAY;

begin

  RW : process (CLK)
  begin
    if (rising_edge(CLK)) then
      if (RST = '0') then
        -- standard operating condition
        if(EN = '1') then
          if (RD1 = '1') then
            -- assigns the content of register with address ADDR_RD1 to Read Port 1
            OUT1 <= REGS(to_integer(unsigned(ADDR_RD1)));
          end if;
          if (RD2 = '1') then
            -- assigns the content of register with address ADDR_RD2 to Read Port 2
            OUT2 <= REGS(to_integer(unsigned(ADDR_RD2)));
          end if;
          if (WR = '1') then
            -- stores the DATA_IN value to the register with address ADDR_WR
            REGS(to_integer(unsigned(ADDR_WR))) <= DATA_IN;
          end if;
        end if;
      elsif(RST = '1') then
        -- reset condition, resets all registers to the all '0' pattern
        REGS <= (others => (others => '0'));
      end if;
    end if;
  end process RW;


end beh;

-- behavioral Physical Register configuration
configuration CFG_RF_BEH of physicalRF is
  for beh
  end for;
end configuration;
