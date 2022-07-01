-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.all;
use work.constants.all;
-------------------------------------------------------------------------------

entity tb_acc is

end tb_acc;

-------------------------------------------------------------------------------

architecture TEST of tb_acc is

  component ACC is

    generic (N: integer := numBit);

    port (
      A          : in  std_logic_vector(N - 1 downto 0);
      B          : in  std_logic_vector(N - 1 downto 0);
      CLK        : in  std_logic;
      RST_n      : in  std_logic;
      ACCUMULATE : in  std_logic;
      ACC_EN_n   : in  std_logic;  -- optional use of the enable
      Y          : out std_logic_vector(N - 1 downto 0));
end component;

  --constant numBit: integer := 32;
  constant numBit: integer := 64;
  signal A_i          : std_logic_vector(numBit - 1 downto 0);
  signal B_i          : std_logic_vector(numBit - 1 downto 0);
  signal CLK_i        : std_logic :='0' ;
  signal RST_n_i      : std_logic;
  signal ACCUMULATE_i : std_logic;
  signal ACC_EN_n_i   : std_logic; -- optional
  signal Y_i          : std_logic_vector(numBit - 1 downto 0);

begin  -- TEST

  DUT: ACC
    generic map (N => numBit)
    port map (
        A          => A_i,
        B          => B_i,
        CLK        => CLK_i,
        RST_n      => RST_n_i,
        ACCUMULATE => ACCUMULATE_i,
        ACC_EN_n   => ACC_EN_n_i, -- optional
        Y          => Y_i);

  
  p_clock: process (CLK_i)

  begin  -- process p_clock
    CLK_i <= not(CLK_i) after 6 ns;
  end process p_clock;

--  test: process

--  begin  -- process test

--  A_i          <= "00000000000000000000000000000001";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '0';
--  ACC_EN_n_i   <= '0';  -- optional
--  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

--  wait for 12 ns;

--  A_i          <= "00000000000000000000000000000001";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '0';   -- optional
--  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

--  wait for 7 ns;

--  A_i          <= "00000000000000000000000000000001";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '0';   -- optional
--  ACCUMULATE_i <= '0';                  -- seleziona ingresso B del mux

--  wait for 12 ns;

--  A_i          <= "00000000000000000000000000010000";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '0';
--  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

--  wait for 19 ns;

--  A_i          <= "00000000000000000000000000010000";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '1';    --- optional
--  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

--  wait for 20 ns;

--  A_i          <= "00000000000000000000000000010000";
--  B_i          <= "00000000000000000000000000000010";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '0'; -- optional
--  ACCUMULATE_i <= '1';

--  wait for 5 ns;

--  A_i          <= "00000000000000000000000000010000";
--  B_i          <= "00000000000000000000000100000000";
--  RST_n_i      <= '1';
--  ACC_EN_n_i   <= '0';  -- optional
--  ACCUMULATE_i <= '0';

--  wait ;
    
--  end process test;

--end TEST;

test: process

  begin  -- process test 64-bit
  
  A_i          <= X"0000000000000001";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0';  -- optional
  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

  wait for 4 ns;

  A_i          <= X"0000000000000001";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '0';
  ACC_EN_n_i   <= '0';  -- optional
  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

  wait for 8 ns;

  A_i          <= X"0000000000000001";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0';   -- optional
  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

  wait for 7 ns;

  A_i          <= X"0000000000000001";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0';   -- optional
  ACCUMULATE_i <= '0';                  -- seleziona ingresso B del mux

  wait for 12 ns;

  A_i          <= X"0000000000000010";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0';
  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

  wait for 19 ns;

  A_i          <= X"0000000000000010";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '1';    --- optional
  ACCUMULATE_i <= '1';                  -- seleziona ingresso FEEDBACK del mux

  wait for 20 ns;

  A_i          <= X"0000000000000010";
  B_i          <= X"0000000000000002";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0'; -- optional
  ACCUMULATE_i <= '1';

  wait for 5 ns;

  A_i          <= X"0000000000000010";
  B_i          <= X"0000000000000100";
  RST_n_i      <= '1';
  ACC_EN_n_i   <= '0';  -- optional
  ACCUMULATE_i <= '0';

  wait ;
    
  end process test;

end TEST;

-------------------------------------------------------------------------------


configuration CFG_TEST_ACC of tb_acc is
  for TEST
      for DUT: ACC
        --use configuration WORK.CFG_ACC_BEHAV;
        use configuration WORK.CFG_ACC_STRUCT;
      end for;
  end for;
end CFG_TEST_ACC;
