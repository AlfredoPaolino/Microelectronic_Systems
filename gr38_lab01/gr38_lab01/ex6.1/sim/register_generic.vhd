library IEEE;
use IEEE.std_logic_1164.all;
use WORK.constants.all;

entity REGISTER_GENERIC is

  -- generic definition for multi-bit register, default value defined in constants.vhd
  generic (N : integer := numBit);

  port (
    CK: in std_logic;
    RESET_n: in std_logic;
    ACC_ENABLE_n: in std_logic;
    DATA_IN: in std_logic_vector (N-1 downto 0);
    DATA_OUT: out std_logic_vector (N-1 downto 0)
  ) ;
end REGISTER_GENERIC;

-- structural asynchronous register architecture
architecture REG_GEN_STRUCT_ASYNC of REGISTER_GENERIC is

	-- data flip flop component definition
	component FD is
		Port (	D:	In	std_logic;
			CK:	In	std_logic;
			RESET_n:	In	std_logic;
			ENABLE_n: in std_logic;
			Q:	Out	std_logic);
	end component;

begin
    
  -- for generate loop for automated register structure generation
  GENERATION_LOOP_A : for i in N-1 downto 0 generate
    FD_i: FD port map (D=>DATA_IN(i), CK=>CK, RESET_n=>RESET_n,
									ENABLE_n=>ACC_ENABLE_n ,Q=>DATA_OUT(i));
  end generate ; -- GENERATION_LOOP

end REG_GEN_STRUCT_ASYNC ; -- REG_GEN_STRUCT

-- structural synchronous register architecture
architecture REG_GEN_STRUCT_SYNC of REGISTER_GENERIC is

	-- data flip flop component definition
	component FD is
		Port (	D:	In	std_logic;
			CK:	In	std_logic;
			RESET_n:	In	std_logic;
			ENABLE_n: in std_logic;
			Q:	Out	std_logic);
	end component;

begin
    
  -- for generate loop for automated register structure generation
  GENERATION_LOOP_S: for i in N-1 downto 0 generate
    FD_i: FD port map (D=>DATA_IN(i), CK=>CK, RESET_n=>RESET_n,
									ENABLE_n=>ACC_ENABLE_n, Q=>DATA_OUT(i));
  end generate ; -- GENERATION_LOOP

end REG_GEN_STRUCT_SYNC ; -- REG_GEN_STRUCT

-- configuration for asynchronous reset_n N bit register
configuration CFG_REG_GEN_ASYNC OF REGISTER_GENERIC is
  for REG_GEN_STRUCT_ASYNC
    for GENERATION_LOOP_A
      for all : FD
        use configuration WORK.CFG_FD_ASYNC; -- asynchronous reset FF selected
      end for;
    end for;
  end for;
end CFG_REG_GEN_ASYNC;

-- configuration for synchronous reset_n N bit register
configuration CFG_REG_GEN_SYNC OF REGISTER_GENERIC is
  for REG_GEN_STRUCT_SYNC
    for GENERATION_LOOP_S
      for all : FD
        use configuration WORK.CFG_FD_SYNC; -- synchronous reset FF selected
      end for;
    end for;
  end for;
end CFG_REG_GEN_SYNC;
