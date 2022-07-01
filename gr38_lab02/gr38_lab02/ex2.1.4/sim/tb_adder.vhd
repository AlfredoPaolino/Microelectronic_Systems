library IEEE;
use IEEE.std_logic_1164.all;

entity tb_adder is
end tb_adder;

architecture TBarch of tb_adder is

  component adder_generic is
    generic (NBIT           : integer := 32;
             NBIT_PER_BLOCK : integer := 4);
    port (A    : in  std_logic_vector (NBIT-1 downto 0);
          B    : in  std_logic_vector (NBIT-1 downto 0);
          Cin  : in  std_logic;
          Cout : out std_logic;
          S    : out std_logic_vector (NBIT-1 downto 0));
  end component;

  constant NBIT_test           : integer := 32;
  constant NBIT_PER_BLOCK_test : integer := 4;
  signal A_s, B_s              : std_logic_vector (NBIT_test-1 downto 0);
  signal Cin_s                 : std_logic;
  signal Cout_s                : std_logic;
  signal S_s                   : std_logic_vector (NBIT_test-1 downto 0);

begin

  DUT : adder_generic generic map (NBIT_test, NBIT_PER_BLOCK_test) port map (A_s, B_s, Cin_s, Cout_s, S_s);

  test_vector : process
  begin

    wait for 5 ns;

    A_s   <= x"00000000";
    B_s   <= x"00000000";
    Cin_s <= '0';

    wait for 5 ns;

    A_s   <= x"0000000F";
    B_s   <= x"00000001";
    Cin_s <= '0';

    wait for 5 ns;

    A_s   <= x"FFFFFFFF";
    B_s   <= x"11111111";
    Cin_s <= '0';

    wait for 5 ns;
	
	A_s   <= x"FFFFFFFF";
    B_s   <= x"00000001";
    Cin_s <= '0';

    wait for 5 ns;

    A_s   <= x"FFFFFFFE";
    B_s   <= x"00000000";
    Cin_s <= '1';

    wait for 5 ns;

    A_s   <= x"FFFFFFEE";
    B_s   <= x"00000001";
    Cin_s <= '1';

    wait for 5 ns;

    A_s   <= x"FFFFFFFE";
    B_s   <= x"00000011";
    Cin_s <= '0';

    wait for 5 ns;

    A_s   <= x"FFFFFFFE";
    B_s   <= x"00000011";
    Cin_s <= '0';

    wait for 5 ns;

    A_s   <= x"BF8A775C";
    B_s   <= x"10C54936";
    Cin_s <= '0';
    -- Co = "01100101"

    wait for 5 ns;

    A_s   <= x"BF8A775C";
    B_s   <= x"10C54933";
    Cin_s <= '1';
    -- Co = "01100101"

    wait for 5 ns;

    A_s   <= x"BF8A775C";
    B_s   <= x"10C54933";
    Cin_s <= '0';
    -- Co = "01100100"

    wait;

  end process test_vector;

end TBarch;

configuration CFG_TB_ADDER_GENERIC of tb_adder is
	for TBarch
		for DUT : adder_generic use configuration WORK.CFG_ADDER_GENERIC_STRUCT;
		end for;
	end for;
end CFG_TB_ADDER_GENERIC;

