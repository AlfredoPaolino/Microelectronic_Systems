library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_RF_generic is
end tb_RF_generic;

architecture TBarch of tb_RF_generic is

  signal CLK_s      : std_logic := '0';
  signal RST_s      : std_logic;
  signal EN_s       : std_logic;
  signal RD1_s      : std_logic;
  signal RD2_s      : std_logic;
  signal WR_s       : std_logic;
  signal ADDR_WR_s  : std_logic_vector(4 downto 0);
  signal ADDR_RD1_s : std_logic_vector(4 downto 0);
  signal ADDR_RD2_s : std_logic_vector(4 downto 0);
  signal DATA_IN_s  : std_logic_vector(63 downto 0);
  signal OUT1_s     : std_logic_vector(63 downto 0);
  signal OUT2_s     : std_logic_vector(63 downto 0);

  component RF_generic is
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
          OUT2     : out std_logic_vector(DATA_BIT-1 downto 0)
          );
  end component;

begin

  DUT : RF_generic
    generic map (ADDR_BIT => 5, DATA_BIT => 64)
    port map (CLK_s, RST_s, EN_s, RD1_s, RD2_s, WR_s, ADDR_WR_s, ADDR_RD1_s, ADDR_RD2_s, DATA_IN_s, OUT1_s, OUT2_s);

--      RST_s <= '1','0' after 5 ns;
--      EN_s <= '0','1' after 3 ns, '0' after 10 ns, '1' after 15 ns, '0' after 21 ns;
--      WR_s <= '0','1' after 6 ns, '0' after 7 ns, '1' after 10 ns, '0' after 20 ns;
--      RD1_s <= '1','0' after 5 ns, '1' after 13 ns, '0' after 20 ns; 
--      RD2_s <= '0','1' after 17 ns;
--      ADDR_WR_s <= "10110", "01000" after 9 ns;
--      ADDR_RD1_s <="10110", "01000" after 9 ns;
--      ADDR_RD2_s <= "11100", "01000" after 9 ns;
--      DATA_IN_s <= (others => '0'),(others => '1') after 8 ns;


  PCLOCK : process
  begin
    CLK_s <= '1';
    wait for 5 ns;
    CLK_s <= '0';
    wait for 5 ns;
  end process;

  vectProcess : process
  begin
    RST_s     <= '1';
    wait for 10 ns;
    RST_s     <= '0';
    EN_s      <= '1';
    WR_s      <= '1';
    RD1_s     <= '1';
    RD2_s     <= '1';
    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '0');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '1');
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    wait;

  end process;
end TBarch;

---
configuration CFG_TESTRF of tb_RF_generic is
  for TBarch
    for DUT : RF_generic
      use configuration WORK.CFG_RF_BEH;
    end for;
  end for;
end CFG_TESTRF;
