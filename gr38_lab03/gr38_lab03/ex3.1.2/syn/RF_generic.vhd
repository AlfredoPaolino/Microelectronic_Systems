library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RF_generic is
  generic (ADDR_BIT : integer := 4;
           DATA_BIT : integer := 32
           );
  port (CLK      : in  std_logic;
        RST      : in  std_logic;
        EN       : in  std_logic;
        RD1      : in  std_logic;
        RD2      : in  std_logic;
        WR       : in  std_logic;
        ADDR_WR  : in  std_logic_vector(ADDR_BIT-1 downto 0);
        ADDR_RD1 : in  std_logic_vector(ADDR_BIT-1 downto 0);
        ADDR_RD2 : in  std_logic_vector(ADDR_BIT-1 downto 0);
        DATA_IN  : in  std_logic_vector(DATA_BIT-1 downto 0);
        OUT1     : out std_logic_vector(DATA_BIT-1 downto 0);
        OUT2     : out std_logic_vector(DATA_BIT-1 downto 0));
end RF_generic;

architecture beh of RF_generic is

  subtype REG_ADDR is natural range 0 to 2**ADDR_BIT-1;
  type REG_ARRAY is array(REG_ADDR) of std_logic_vector(DATA_BIT-1 downto 0);
  signal REGS : REG_ARRAY;


begin

  RW : process (CLK)
  begin
    if (rising_edge(CLK)) then
      if (RST = '0' and EN = '1') then
        if (RD1 = '1') then
          OUT1 <= REGS(to_integer(unsigned(ADDR_RD1)));
        end if;
        if (RD2 = '1') then
          OUT2 <= REGS(to_integer(unsigned(ADDR_RD2)));
        end if;
        if (WR = '1') then
          REGS(to_integer(unsigned(ADDR_WR))) <= DATA_IN;
        end if;
      elsif (RSTI = '1') then
        REGS <= (others => (others => '0'));
      end if;
    end if;
  end process RW;


end beh;

----


configuration CFG_RF_BEH of RF_generic is
  for beh
  end for;
end configuration;
