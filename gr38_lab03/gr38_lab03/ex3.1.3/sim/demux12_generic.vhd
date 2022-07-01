library IEEE;
use IEEE.std_logic_1164.all;

-- generic NBIT Demultiplexer
entity DEMUX12_GENERIC is
  generic (NBIT : integer := 4);
  port (A   : out std_logic_vector(NBIT-1 downto 0);
        B   : out std_logic_vector(NBIT-1 downto 0);
        SEL : in  std_logic;
        Y   : in  std_logic_vector(NBIT-1 downto 0));
end DEMUX12_GENERIC;

-- Demultiplexer architecture described behaviorally
architecture BEH of DEMUX12_GENERIC is
begin
  MUX_PROCESS : process (SEL, Y)
  begin
    if (SEL = '0') then
      -- if selection signal is '0' the input signal is assigned to output A
      A <= Y;
    else
      -- if selection signal is '1' the input signal is assigned to output B
      B <= Y;
    end if;
  end process;
end BEH;

-- behavioral Demultiplexer configuration
configuration CFG_DEMUX12_GEN_BEHAVIORAL of DEMUX12_GENERIC is
  for BEH
  end for;
end CFG_DEMUX12_GEN_BEHAVIORAL;
