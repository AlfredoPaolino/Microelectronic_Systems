library IEEE;
use IEEE.std_logic_1164.all;

-- generic NBIT signals 5-to-1 Multiplexer
entity MUX51_GENERIC is
    generic (NBIT : integer := 16); 				
    port (
        IN0 : in std_logic_vector(NBIT-1 downto 0);	--0
        IN1 : in std_logic_vector(NBIT-1 downto 0);	--nA
        IN2 : in std_logic_vector(NBIT-1 downto 0);	---nA
        IN3 : in std_logic_vector(NBIT-1 downto 0);	--+2nA
        IN4 : in std_logic_vector(NBIT-1 downto 0);	---2nA
        S : in std_logic_vector(2 downto 0);
        O : out std_logic_vector(NBIT-1 downto 0)
    );
end entity MUX51_GENERIC;

-- structural architecture description of the 5-to-1 MUX
architecture mux51_struct of MUX51_generic is

    -- 2-to-1 NBIT multiplexer declaration
    component MUX21_GENERIC is
        generic (NBIT : integer := 32);
        port (  
            A : in  std_logic_vector(NBIT-1 downto 0);
            B   : in  std_logic_vector(NBIT-1 downto 0);
            SEL : in  std_logic;
            Y   : out std_logic_vector(NBIT-1 downto 0)
        );
	end component;

    -- signals for internal data propagation
	signal temp00, temp01, temp1 : std_logic_vector(NBIT-1 downto 0);
	
begin

    -- 5-to-1 MUX is composed of a tree of 2-to-1 mux, each level of MUXs is controlled by a selection signal
    -- Selection signal LSBs control earlier MUX stages, MSBs control later MUX stages
    mux00 : MUX21_GENERIC generic map (NBIT => NBIT) port map (A => IN2, B => IN1, SEL => S(0), Y => temp00);
	mux01 : MUX21_GENERIC generic map (NBIT => NBIT) port map (A => IN4, B => IN3, SEL => S(0), Y => temp01);
	mux1 : MUX21_GENERIC generic map (NBIT => NBIT) port map (A => temp01, B => temp00, SEL => S(1), Y => temp1);
	mux2 : MUX21_GENERIC generic map (NBIT => NBIT) port map (A => IN0, B => temp1, SEL => S(2), Y => O);
    
    
end architecture mux51_struct;

-- structural configuration for 5-to-1 MUX description
configuration CFG_MUX51_GENERIC of MUX51_GENERIC is
    for mux51_struct
        -- behavioral configuration for all 2-to-1 MUX description
        for mux00 : MUX21_GENERIC use configuration WORK.CFG_MUX21_GEN_BEHAVIORAL;
        end for;
        for mux01 : MUX21_GENERIC use configuration WORK.CFG_MUX21_GEN_BEHAVIORAL;
        end for;
        for mux1 : MUX21_GENERIC use configuration WORK.CFG_MUX21_GEN_BEHAVIORAL;
        end for;
        for mux2 : MUX21_GENERIC use configuration WORK.CFG_MUX21_GEN_BEHAVIORAL;
        end for;
    end for;
end configuration CFG_MUX51_GENERIC;