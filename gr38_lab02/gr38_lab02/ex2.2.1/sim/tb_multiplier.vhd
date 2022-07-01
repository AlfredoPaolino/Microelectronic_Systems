library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Testbench for BOOTHMUL entity
entity MULTIPLIER_tb is
end MULTIPLIER_tb;

architecture TEST of MULTIPLIER_tb is

  -- test will run for 8-bit inputs and 16-bit outputs
  constant numBit : integer := 8;

  --  input      
  signal A_mp_i : std_logic_vector(numBit-1 downto 0) := (others => '0');
  signal B_mp_i : std_logic_vector(numBit-1 downto 0) := (others => '0');

  -- output
  signal Y_mp_i : std_logic_vector(2*numBit-1 downto 0);


-- MUL component declaration
  component BOOTHMUL is
    generic (NBIT : integer := 8);
    port (
      A : in  std_logic_vector(NBIT-1 downto 0);
      B : in  std_logic_vector(NBIT-1 downto 0);
      P : out std_logic_vector(2*NBIT-1 downto 0)
      );
  end component;

begin

-- MUL instantiation
  DUT : BOOTHMUL generic map (NBIT => numBit) port map (A => A_mp_i, B => B_mp_i, P => Y_mp_i);

-- PROCESS FOR TESTING TEST --
--    tests the component on all possible input-output
--      combinations for NBIT signals
  test : process
  begin

    -- cycle for operand A
    NumROW : for i in 0 to 2**numBit-1 loop
      A_mp_i <= A_mp_i + '1';
      -- cycle for operand B
      NumCOL : for i in 0 to 2**numBit-1 loop

        B_mp_i <= B_mp_i + '1';
        wait for 10 ns;

        -- automatic result assertion and textual report on console
        assert (to_integer(signed(A_mp_i))*to_integer(signed(B_mp_i)) = to_integer(signed(Y_mp_i))) report "Error!";
      
      end loop NumCOL;

    end loop NumROW;

    wait;
  end process test;

end TEST;
