library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.functions.all;


entity tb_WRF_generic is
end tb_WRF_generic;

architecture TBarch of tb_WRF_generic is


  constant N        : integer := 8;
  constant M        : integer := 8;
  constant F        : integer := 8;
  constant DATA_BIT : integer := 64;

  signal CLK_s         : std_logic := '0';
  signal RST_s         : std_logic;
  signal EN_s          : std_logic;
  signal RD1_s         : std_logic;
  signal RD2_s         : std_logic;
  signal WR_s          : std_logic;
  signal ADDR_WR_s     : std_logic_vector(log2(3*N+M)-1 downto 0);
  signal ADDR_RD1_s    : std_logic_vector(log2(3*N+M)-1 downto 0);
  signal ADDR_RD2_s    : std_logic_vector(log2(3*N+M)-1 downto 0);
  signal DATA_IN_s     : std_logic_vector(DATA_BIT-1 downto 0);
  signal DATA_IN_MEM_s : std_logic_vector(DATA_BIT-1 downto 0);
  signal OUT1_s        : std_logic_vector(DATA_BIT-1 downto 0);
  signal OUT_MEM_s     : std_logic_vector(DATA_BIT-1 downto 0);
  signal OUT2_s        : std_logic_vector(DATA_BIT-1 downto 0);
  signal SPILL_s       : std_logic;
  signal FILL_s        : std_logic;
  signal CALL_s        : std_logic;
  signal RET_s         : std_logic;


  component WRF_generic is
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

  end component;

begin

  DUT : WRF_generic generic map(N => N, M => M, F => F, DATA_BIT => DATA_BIT)
    port map (
      CLK         => CLK_s, RST => RST_s, EN => EN_s, RD1 => RD1_s, RD2 => RD2_s, WR => WR_s,
      CALL        => CALL_s, RET => RET_s, ADDR_WR => ADDR_WR_s, ADDR_RD1 => ADDR_RD1_s, ADDR_RD2 => ADDR_RD2_s,
      DATA_IN_MEM => DATA_IN_MEM_s, DATA_IN => DATA_IN_s, SPILL => SPILL_s, FILL => FILL_s, OUT_MEM => OUT_MEM_s,
      OUT1        => OUT1_s, OUT2 => OUT2_s);



  PCLOCK : process
  begin
    CLK_s <= '1';
    wait for 5 ns;
    CLK_s <= '0';
    wait for 5 ns;
  end process;


-- the testbench is implementing the MATS algorithm. It consists in writing
-- first all '1's, then read what has been written and write all '0's on the
-- current active window. Then, we test also for the correct working of CWP,
-- and SWP behaviour simulating sequence of CALLs and RETs. On the OUT1 port we
-- read the value containted at the current_address-1 whereas on the OUT2 port
-- we read the current_address value.
  
  vectProcess : process
  begin
	RST_s     <= '0';
	wait for 10 ns;
    RST_s     <= '1';
    wait for 10 ns;
    RST_s     <= '0';
    EN_s      <= '1';
    WR_s      <= '1';
    RD1_s     <= '1';
    RD2_s     <= '1';
    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '1');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '0');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    -- testing CALL
    CALL_s <= '1', '0' after 10 ns;     --call to subroutine

    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '1');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '0');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;
    -- testing RET
    RET_s     <= '1';
    wait for 10 ns;
    RET_s     <= '0';
    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '1');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '0');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;
    -- now we're in window 0, then to activate SPILL we perform 7 calls
    CALL_s <= '1';
    WR_s <= '0'; --disable writing when calling subroutine
-- write again on the window 0
    wait for 70 ns;
    CALL_s <= '0';
    WR_s <= '1'; --enable writing for the MATS
    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '1');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;


    ADDR_WR_s <= (others => '0');
    DATA_IN_s <= (others => '0');
    wait for 10 ns;
    for i in 0 to 31 loop
      ADDR_RD1_s <= ADDR_WR_s;
      ADDR_RD2_s <= std_logic_vector(unsigned(ADDR_WR_s) +1);
      ADDR_WR_s  <= std_logic_vector(unsigned(ADDR_WR_s) + 1);
      wait for 10 ns;
    end loop;

    RET_s <= '1';
    WR_s <= '0'; --disable writing before returning
-- force to return at first window 0
    wait for 70 ns;
    RET_s <= '0';




    wait;

  end process;
end TBarch;

---
configuration CFG_TESTRF of tb_WRF_generic is
  for TBarch
    for DUT : WRF_generic
    end for;
  end for;
end CFG_TESTRF;
