
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_RCA_GENERIC_NBIT4 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_RCA_GENERIC_NBIT4;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_RCA_GENERIC_NBIT4.all;

entity RCA_GENERIC_NBIT4 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_GENERIC_NBIT4;

architecture SYN_BEHAVIORAL of RCA_GENERIC_NBIT4 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_55_carry_1_port, add_55_carry_2_port, add_55_carry_3_port, 
      add_55_CI : std_logic;

begin
   
   add_55_U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => add_55_CI, CO => 
                           add_55_carry_1_port, S => S(0));
   add_55_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => 
                           add_55_carry_1_port, CO => add_55_carry_2_port, S =>
                           S(1));
   add_55_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_55_carry_2_port, CO => add_55_carry_3_port, S =>
                           S(2));
   add_55_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_55_carry_3_port, CO => Co, S => S(3));
   add_55_CI <= '0';

end SYN_BEHAVIORAL;
