library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RF is
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
end RF;

architecture beh of RF is

  subtype REG_ADDR is natural range 0 to 2**ADDR_BITS-1;
  type REG_ARRAY is array(REG_ADDR) of std_logic_vector(DATA_BITS-1 downto 0);
  signal REGS : REG_ARRAY;


begin

  RW : process (CLK)
  begin
    if (rising_edge(CLK)) then
      if (RST = '0') then
        if(EN = '1') then
          if (RF1 = '1') then
            OUT_A <= REGS(to_integer(unsigned(ADDR_RD1)));
          end if;
          if (RF2 = '1') then
            OUT_B <= REGS(to_integer(unsigned(ADDR_RD2)));
          end if;
        end if;
        if (WF1 = '1') then
            REGS(to_integer(unsigned(ADDR_WR))) <= DATA_IN;
        end if;
      elsif(RST = '1') then
        REGS <= (others => (others => '0'));
      end if;
    end if;
  end process RW;

end beh;
