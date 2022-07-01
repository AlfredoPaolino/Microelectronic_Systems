library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;               -- we need a conversion to unsigned 


entity TB_CARRY_SELECT_BLOCK is
end TB_CARRY_SELECT_BLOCK;

architecture TEST of TB_CARRY_SELECT_BLOCK is

  component LFSR16
    port (CLK, RESET, LD, EN : in  std_logic;
          DIN                : in  std_logic_vector(15 downto 0);
          PRN                : out std_logic_vector(15 downto 0);
          ZERO_D             : out std_logic);
  end component;

  component CARRY_SELECT_BLOCK_GENERIC is
    generic (
      NBIT : integer := 6
      );
    port (
      C_IN : in  std_logic;
      A, B : in  std_logic_vector(NBIT-1 downto 0);
      S    : out std_logic_vector(NBIT-1 downto 0)
      );
  end component;

  constant NBIT                : integer   := 4;
  constant Period              : time      := 1 ns;  -- Clock period (1 GHz)
  signal CLK                   : std_logic := '0';
  signal RESET, LD, EN, ZERO_D : std_logic;
  signal DIN, PRN              : std_logic_vector(15 downto 0);

  signal A, B, S0, S1 : std_logic_vector(NBIT-1 downto 0);

begin

-- Forcing adder input to LFSR output
  A(0) <= PRN(0);
  A(3) <= PRN(4);
  A(1) <= PRN(6);
  A(2) <= PRN(10);

  B(0) <= PRN(15);
  B(3) <= PRN(11);
  B(1) <= PRN(9);
  B(2) <= PRN(5);

-- Instanciate the Unit Under Test (UUT)
  CARRY_SELECT_BLOCK0 : CARRY_SELECT_BLOCK_GENERIC generic map(NBIT => NBIT)
    port map (
      A => A, B => B, S => S0, C_IN => '0'
      );
  CARRY_SELECT_BLOCK1 : CARRY_SELECT_BLOCK_GENERIC generic map(NBIT => NBIT)
    port map (
      A => A, B => B, S => S1, C_IN => '1'
      );
  UUT : LFSR16 port map (CLK => CLK, RESET => RESET, LD => LD, EN => EN,
                         DIN => DIN, PRN => PRN, ZERO_D => ZERO_D);
-- Create the permanent Clock and the Reset pulse
  CLK   <= not CLK  after Period/2;
  RESET <= '1', '0' after Period;
-- Open file, make a load, and wait for a timeout in case of design error.
  STIMULUS1 : process
  begin
    DIN <= "0000000000000001";
    EN  <= '1';
    LD  <= '1';
    wait for 2 * PERIOD;
    LD  <= '0';
    wait for (65600 * PERIOD);
  end process STIMULUS1;

end TEST;

configuration TEST_CARRY_SELECT_BLOCK of TB_CARRY_SELECT_BLOCK is
  for TEST
    for all : CARRY_SELECT_BLOCK_GENERIC use configuration WORK.CONFIG_CARRY_SELECT;
    end for;
  end for;
end configuration TEST_CARRY_SELECT_BLOCK;
