library IEEE;
use IEEE.std_logic_1164.all;

-- generic NBIT signals 2-to-1 Multiplexer
entity MUX21_GENERIC is
  generic (NBIT      : integer := 4);
  port (A   : in  std_logic_vector(NBIT-1 downto 0);
        B   : in  std_logic_vector(NBIT-1 downto 0);
        SEL : in  std_logic;
        Y   : out std_logic_vector(NBIT-1 downto 0));
end MUX21_GENERIC;

-- behavioral architecture description of the 2-to-1 MUX
architecture BEH of MUX21_GENERIC is
begin
  
  MUX_PROCESS : process (A, B, SEL)
  begin
    if (SEL = '0') then
      Y <= A; -- when SELection signal is '0' MUX lets signal A value go through
    else
      Y <= B; -- when SELection signal is '1' MUX lets signal B value go through
    end if;
  end process;
end BEH;

-- behavioral configuration for 2-to-1 MUX description
configuration CFG_MUX21_GEN_BEHAVIORAL of MUX21_GENERIC is
  for BEH
  end for;
end CFG_MUX21_GEN_BEHAVIORAL;
