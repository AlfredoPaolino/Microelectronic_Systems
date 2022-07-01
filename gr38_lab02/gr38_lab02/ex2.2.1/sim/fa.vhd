library ieee; 
use ieee.std_logic_1164.all;
use work.all;

-- Full Adder
entity FA is 
	Port (	A:	In	std_logic;
		B:	In	std_logic;
		Ci:	In	std_logic;
		S:	Out	std_logic;
		Co:	Out	std_logic);
end FA; 

-- behavioral architecture description of the FA
architecture BEHAVIORAL of FA is

begin

  -- assigns sum output signal 
  S <= A xor B xor Ci;
  -- assigns Carry Out output signal
  Co <= (A and B) or (B and Ci) or (A and Ci);
  
end BEHAVIORAL;

-- behavioral configuration for FA description
configuration CFG_FA_BEHAVIORAL of FA is	
  for BEHAVIORAL
  end for;
end CFG_FA_BEHAVIORAL;
