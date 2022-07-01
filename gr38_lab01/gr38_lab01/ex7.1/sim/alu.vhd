library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.constants.all;
use WORK.alu_type.all;

entity ALU is
  generic (N : integer := numBit);
  port 	 ( FUNC: IN TYPE_OP;
           DATA1, DATA2: IN std_logic_vector(N-1 downto 0);
           OUTALU: OUT std_logic_vector(N-1 downto 0));
end ALU;

architecture BEHAVIOR of ALU is

begin

P_ALU: process (FUNC, DATA1, DATA2)
  -- complete all the requested functions
	
	variable OUTTMP : std_logic_vector(N-1 downto 0);

  begin
	
	OUTTMP := DATA1;

    case FUNC is
		when ADD 	=> OUTALU <= std_logic_vector(unsigned(DATA1) + unsigned(DATA2)); 

		when SUB 	=> OUTALU <= std_logic_vector(unsigned(DATA1) - unsigned(DATA2)); 

		when MULT 	=> OUTALU <= std_logic_vector(unsigned(DATA1(N/2-1 downto 0)) * unsigned(DATA2(N/2-1 downto 0)));

		when BITAND 	=> OUTALU <= std_logic_vector(DATA1 and DATA2); -- bitwise operations

		when BITOR 	=> OUTALU <= std_logic_vector(DATA1 or DATA2);

		when BITXOR 	=> OUTALU <= std_logic_vector(DATA1 xor DATA2);

		when FUNCLSL 	=> 
			for i in 0 to DATA2'length-1 loop
				if (DATA2(i) = '1') then
					for k in 0 to 2**i-1 loop
						OUTTMP := OUTTMP(N-2 downto 0) & '0';
					end loop;
				end if;
			end loop;
			OUTALU <= OUTTMP;
			--using library functions : OUTALU <= std_logic_vector(shift_left(unsigned(DATA1), to_integer(unsigned(DATA2))));

		when FUNCLSR 	=>
			for i in 0 to DATA2'length-1 loop
				if (DATA2(i) = '1') then
					for k in 0 to 2**i-1 loop
						OUTTMP := '0' & OUTTMP(N-1 downto 1);
					end loop;
				end if;
			end loop;
			OUTALU <= OUTTMP;
			--using library functions : OUTALU <= std_logic_vector(shift_right(unsigned(DATA1), to_integer(unsigned(DATA2))));

		when FUNCRL 	=> 
			for i in 0 to DATA2'length-1 loop
				if (DATA2(i) = '1') then
					for k in 0 to 2**i-1 loop
						OUTTMP := OUTTMP(N-2 downto 0) & OUTTMP(N-1);
					end loop;
				end if;
			end loop;
			OUTALU <= OUTTMP;
 			--using library functions : OUTALU <= std_logic_vector(rotate_left(unsigned(DATA1), to_integer(unsigned(DATA2))));

		when FUNCRR 	=> 
			for i in 0 to DATA2'length-1 loop
				if (DATA2(i) = '1') then
					for k in 0 to 2**i-1 loop
						OUTTMP := OUTTMP(0) & OUTTMP(N-1 downto 1);
					end loop;
				end if;
			end loop;
			OUTALU <= OUTTMP;
			--using library functions : OUTALU <= std_logic_vector(rotate_right(unsigned(DATA1), to_integer(unsigned(DATA2))));

		when others => null;

		end case; 
  end process P_ALU;

end BEHAVIOR;

configuration CFG_ALU_BEHAVIORAL of ALU is
  for BEHAVIOR
  end for;
end CFG_ALU_BEHAVIORAL;
