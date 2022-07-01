library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.all;

-- generic NBIT Ripple Carry Adder
entity RCA_GENERIC is
  generic (NBIT : integer := 4);
  port (A  : in  std_logic_vector(NBIT-1 downto 0);
        B  : in  std_logic_vector(NBIT-1 downto 0);
        Ci : in  std_logic;
        S  : out std_logic_vector(NBIT-1 downto 0);
        Co : out std_logic);
end RCA_GENERIC;

-- behavioral architecture description of the RCA
architecture BEHAVIORAL of RCA_GENERIC is

  -- temporary signal to store extended sum result
  signal S_TEMP : std_logic_vector(NBIT downto 0);

begin  -- architecture BEHAVIORAL

  S_TEMP <= (('0'&A) + ('0'&B) + Ci); -- extended sum
  S      <= S_TEMP(NBIT-1 downto 0);  -- sum output on NBIT is assigned to Sum port
  Co     <= S_TEMP(NBIT); -- extended sum's MSB is assigned to the Carry Out port

end architecture BEHAVIORAL;

-- behavioral configuration for RCA description
configuration CFG_RCA_GENERIC_BEHAVIORAL of RCA_GENERIC is
  for BEHAVIORAL
  end for;
end CFG_RCA_GENERIC_BEHAVIORAL;
