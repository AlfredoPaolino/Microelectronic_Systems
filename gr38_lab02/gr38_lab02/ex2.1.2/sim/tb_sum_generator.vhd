library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity TBSUM_GENERATOR is
end TBSUM_GENERATOR;

architecture TEST of TBSUM_GENERATOR is


  component SUM_GENERATOR_GENERIC is
    generic (
      NBIT_PER_BLOCK : integer := 4;
      NBLOCKS        : integer := 8);
    port (
      A  : in  std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
      B  : in  std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
      Ci : in  std_logic_vector(NBLOCKS-1 downto 0);
      S  : out std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0));
  end component;

  constant NBIT_PER_BLOCK : integer := 4;
  constant NBLOCKS        : integer := 8;
  signal A_s, B_s, S_s    : std_logic_vector(NBIT_PER_BLOCK*NBLOCKS-1 downto 0);
  signal Ci_s             : std_logic_vector(NBLOCKS-1 downto 0);

begin

  --instantiate UUT
  UUT : SUM_GENERATOR_GENERIC generic map (NBIT_PER_BLOCK => NBIT_PER_BLOCK, NBLOCKS => NBLOCKS)
    port map (A => A_s, B => B_s, Ci => Ci_s, S => S_s);

  vector : process
  begin
    A_s  <= std_logic_vector(to_unsigned(0, NBIT_PER_BLOCK*NBLOCKS));
    B_s  <= std_logic_vector(to_unsigned(10, NBIT_PER_BLOCK*NBLOCKS));
    Ci_s <= (others => '0');
    wait for 1 ns;
    assert (unsigned(S_s) = 10) report "#1 checkpoint error";
    wait for 1 ns;
    Ci_s <= X"01";                      --set only first carry input to 1
    wait for 1 ns;
    assert (unsigned(S_s) = 11) report "#2 checkpoint error";
    wait for 1 ns;
    Ci_s <= X"FF";
    A_s  <= (others => '0');
    B_s  <= (others => '0');
    wait for 1 ns;
    assert (unsigned(S_s) = X"1111_1111") report "#3 checkpoint error";
    wait;

  end process;




end TEST;

configuration SUM_GENERATORTEST of TBSUM_GENERATOR is
  for TEST
    for all : SUM_GENERATOR_GENERIC
      use configuration WORK.CFG_SUM_GENERATOR_STRUCTURAL;
    end for;
  end for;
end SUM_GENERATORTEST;
