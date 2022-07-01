
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_BOOTHMUL_NBIT8 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_BOOTHMUL_NBIT8;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_0_DW01_add_0 is

   port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (16 downto 0);  CO : out std_logic);

end RCA_GENERIC_NBIT16_0_DW01_add_0;

architecture SYN_rpl of RCA_GENERIC_NBIT16_0_DW01_add_0 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, 
      carry_1_port : std_logic;

begin
   
   U1_15 : FA_X1 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           SUM(16), S => SUM(15));
   U1_14 : FA_X1 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : FA_X1 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : FA_X1 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : FA_X1 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : FA_X1 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : FA_X1 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : FA_X1 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : FA_X1 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : FA_X1 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : FA_X1 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : FA_X1 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => carry_1_port, CO => 
                           carry_2_port, S => SUM(1));
   U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => CI, CO => carry_1_port, S
                           => SUM(0));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_2_DW01_add_0 is

   port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (16 downto 0);  CO : out std_logic);

end RCA_GENERIC_NBIT16_2_DW01_add_0;

architecture SYN_rpl of RCA_GENERIC_NBIT16_2_DW01_add_0 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, 
      carry_1_port : std_logic;

begin
   
   U1_15 : FA_X1 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           SUM(16), S => SUM(15));
   U1_14 : FA_X1 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : FA_X1 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : FA_X1 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : FA_X1 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : FA_X1 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : FA_X1 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : FA_X1 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : FA_X1 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : FA_X1 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : FA_X1 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : FA_X1 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => carry_1_port, CO => 
                           carry_2_port, S => SUM(1));
   U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => CI, CO => carry_1_port, S
                           => SUM(0));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_1_DW01_add_0 is

   port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (16 downto 0);  CO : out std_logic);

end RCA_GENERIC_NBIT16_1_DW01_add_0;

architecture SYN_rpl of RCA_GENERIC_NBIT16_1_DW01_add_0 is

   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, 
      carry_1_port : std_logic;

begin
   
   U1_15 : FA_X1 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           SUM(16), S => SUM(15));
   U1_14 : FA_X1 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : FA_X1 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_12 : FA_X1 port map( A => A(12), B => B(12), CI => carry_12_port, CO => 
                           carry_13_port, S => SUM(12));
   U1_11 : FA_X1 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : FA_X1 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : FA_X1 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : FA_X1 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : FA_X1 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : FA_X1 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : FA_X1 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : FA_X1 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => carry_1_port, CO => 
                           carry_2_port, S => SUM(1));
   U1_0 : FA_X1 port map( A => A(0), B => B(0), CI => CI, CO => carry_1_port, S
                           => SUM(0));

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_15 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_15;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_15 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U3 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U4 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U5 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U8 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U9 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U10 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U11 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U12 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U13 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U14 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U15 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U16 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_14 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_14;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_14 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U3 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U4 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U5 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U8 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U9 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U10 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U11 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U12 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U13 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U14 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U15 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U16 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_13 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_13;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_13 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U9 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U14 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U15 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U16 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_12 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_12;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_12 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U4 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U5 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U11 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U12 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U13 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U14 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U15 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U16 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_11 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_11;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_11 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U5 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U12 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U13 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U14 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U15 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U16 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_10 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_10;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_10 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U5 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U12 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U13 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U14 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U15 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U16 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_9 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_9;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_9 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U9 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U14 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U15 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U16 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_8 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_8;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_8 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U11 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U12 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U13 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U14 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U15 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U16 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_7 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_7;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_7 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U13 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U14 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U15 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U16 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_6 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_6;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_6 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U13 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U14 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U15 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U16 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_5 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_5;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_5 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U9 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U14 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U15 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U16 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_4 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_4;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_4 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U11 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U12 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U13 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U14 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U15 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U16 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_3 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_3;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_3 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U11 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U14 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U15 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U16 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_2 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_2;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_2 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U9 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U10 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U11 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U14 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U15 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U16 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_1 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_1;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_1 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));
   U2 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U3 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U4 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U5 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U6 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U7 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U8 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U9 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U10 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U11 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U12 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U13 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U14 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U15 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U16 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_2 is

   port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : out
         std_logic_vector (15 downto 0);  Co : out std_logic);

end RCA_GENERIC_NBIT16_2;

architecture SYN_BEHAVIORAL of RCA_GENERIC_NBIT16_2 is

   component RCA_GENERIC_NBIT16_2_DW01_add_0
      port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (16 downto 0);  CO : out std_logic);
   end component;
   
   signal n2, n_1009 : std_logic;

begin
   
   n2 <= '0';
   add_1_root_add_23_2 : RCA_GENERIC_NBIT16_2_DW01_add_0 port map( A(16) => n2,
                           A(15) => A(15), A(14) => A(14), A(13) => A(13), 
                           A(12) => A(12), A(11) => A(11), A(10) => A(10), A(9)
                           => A(9), A(8) => A(8), A(7) => A(7), A(6) => A(6), 
                           A(5) => A(5), A(4) => A(4), A(3) => A(3), A(2) => 
                           A(2), A(1) => A(1), A(0) => A(0), B(16) => n2, B(15)
                           => B(15), B(14) => B(14), B(13) => B(13), B(12) => 
                           B(12), B(11) => B(11), B(10) => B(10), B(9) => B(9),
                           B(8) => B(8), B(7) => B(7), B(6) => B(6), B(5) => 
                           B(5), B(4) => B(4), B(3) => B(3), B(2) => B(2), B(1)
                           => B(1), B(0) => B(0), CI => Ci, SUM(16) => Co, 
                           SUM(15) => S(15), SUM(14) => S(14), SUM(13) => S(13)
                           , SUM(12) => S(12), SUM(11) => S(11), SUM(10) => 
                           S(10), SUM(9) => S(9), SUM(8) => S(8), SUM(7) => 
                           S(7), SUM(6) => S(6), SUM(5) => S(5), SUM(4) => S(4)
                           , SUM(3) => S(3), SUM(2) => S(2), SUM(1) => S(1), 
                           SUM(0) => S(0), CO => n_1009);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_1 is

   port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : out
         std_logic_vector (15 downto 0);  Co : out std_logic);

end RCA_GENERIC_NBIT16_1;

architecture SYN_BEHAVIORAL of RCA_GENERIC_NBIT16_1 is

   component RCA_GENERIC_NBIT16_1_DW01_add_0
      port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (16 downto 0);  CO : out std_logic);
   end component;
   
   signal n2, n_1010 : std_logic;

begin
   
   n2 <= '0';
   add_1_root_add_23_2 : RCA_GENERIC_NBIT16_1_DW01_add_0 port map( A(16) => n2,
                           A(15) => A(15), A(14) => A(14), A(13) => A(13), 
                           A(12) => A(12), A(11) => A(11), A(10) => A(10), A(9)
                           => A(9), A(8) => A(8), A(7) => A(7), A(6) => A(6), 
                           A(5) => A(5), A(4) => A(4), A(3) => A(3), A(2) => 
                           A(2), A(1) => A(1), A(0) => A(0), B(16) => n2, B(15)
                           => B(15), B(14) => B(14), B(13) => B(13), B(12) => 
                           B(12), B(11) => B(11), B(10) => B(10), B(9) => B(9),
                           B(8) => B(8), B(7) => B(7), B(6) => B(6), B(5) => 
                           B(5), B(4) => B(4), B(3) => B(3), B(2) => B(2), B(1)
                           => B(1), B(0) => B(0), CI => Ci, SUM(16) => Co, 
                           SUM(15) => S(15), SUM(14) => S(14), SUM(13) => S(13)
                           , SUM(12) => S(12), SUM(11) => S(11), SUM(10) => 
                           S(10), SUM(9) => S(9), SUM(8) => S(8), SUM(7) => 
                           S(7), SUM(6) => S(6), SUM(5) => S(5), SUM(4) => S(4)
                           , SUM(3) => S(3), SUM(2) => S(2), SUM(1) => S(1), 
                           SUM(0) => S(0), CO => n_1010);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX51_GENERIC_NBIT16_3 is

   port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : in 
         std_logic_vector (2 downto 0);  O : out std_logic_vector (15 downto 0)
         );

end MUX51_GENERIC_NBIT16_3;

architecture SYN_mux51_struct of MUX51_GENERIC_NBIT16_3 is

   component MUX21_GENERIC_NBIT16_9
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_10
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_11
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_12
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   signal temp00_15_port, temp00_14_port, temp00_13_port, temp00_12_port, 
      temp00_11_port, temp00_10_port, temp00_9_port, temp00_8_port, 
      temp00_7_port, temp00_6_port, temp00_5_port, temp00_4_port, temp00_3_port
      , temp00_2_port, temp00_1_port, temp00_0_port, temp01_15_port, 
      temp01_14_port, temp01_13_port, temp01_12_port, temp01_11_port, 
      temp01_10_port, temp01_9_port, temp01_8_port, temp01_7_port, 
      temp01_6_port, temp01_5_port, temp01_4_port, temp01_3_port, temp01_2_port
      , temp01_1_port, temp01_0_port, temp1_15_port, temp1_14_port, 
      temp1_13_port, temp1_12_port, temp1_11_port, temp1_10_port, temp1_9_port,
      temp1_8_port, temp1_7_port, temp1_6_port, temp1_5_port, temp1_4_port, 
      temp1_3_port, temp1_2_port, temp1_1_port, temp1_0_port : std_logic;

begin
   
   mux00 : MUX21_GENERIC_NBIT16_12 port map( A(15) => IN2(15), A(14) => IN2(14)
                           , A(13) => IN2(13), A(12) => IN2(12), A(11) => 
                           IN2(11), A(10) => IN2(10), A(9) => IN2(9), A(8) => 
                           IN2(8), A(7) => IN2(7), A(6) => IN2(6), A(5) => 
                           IN2(5), A(4) => IN2(4), A(3) => IN2(3), A(2) => 
                           IN2(2), A(1) => IN2(1), A(0) => IN2(0), B(15) => 
                           IN1(15), B(14) => IN1(14), B(13) => IN1(13), B(12) 
                           => IN1(12), B(11) => IN1(11), B(10) => IN1(10), B(9)
                           => IN1(9), B(8) => IN1(8), B(7) => IN1(7), B(6) => 
                           IN1(6), B(5) => IN1(5), B(4) => IN1(4), B(3) => 
                           IN1(3), B(2) => IN1(2), B(1) => IN1(1), B(0) => 
                           IN1(0), SEL => S(0), Y(15) => temp00_15_port, Y(14) 
                           => temp00_14_port, Y(13) => temp00_13_port, Y(12) =>
                           temp00_12_port, Y(11) => temp00_11_port, Y(10) => 
                           temp00_10_port, Y(9) => temp00_9_port, Y(8) => 
                           temp00_8_port, Y(7) => temp00_7_port, Y(6) => 
                           temp00_6_port, Y(5) => temp00_5_port, Y(4) => 
                           temp00_4_port, Y(3) => temp00_3_port, Y(2) => 
                           temp00_2_port, Y(1) => temp00_1_port, Y(0) => 
                           temp00_0_port);
   mux01 : MUX21_GENERIC_NBIT16_11 port map( A(15) => IN4(15), A(14) => IN4(14)
                           , A(13) => IN4(13), A(12) => IN4(12), A(11) => 
                           IN4(11), A(10) => IN4(10), A(9) => IN4(9), A(8) => 
                           IN4(8), A(7) => IN4(7), A(6) => IN4(6), A(5) => 
                           IN4(5), A(4) => IN4(4), A(3) => IN4(3), A(2) => 
                           IN4(2), A(1) => IN4(1), A(0) => IN4(0), B(15) => 
                           IN3(15), B(14) => IN3(14), B(13) => IN3(13), B(12) 
                           => IN3(12), B(11) => IN3(11), B(10) => IN3(10), B(9)
                           => IN3(9), B(8) => IN3(8), B(7) => IN3(7), B(6) => 
                           IN3(6), B(5) => IN3(5), B(4) => IN3(4), B(3) => 
                           IN3(3), B(2) => IN3(2), B(1) => IN3(1), B(0) => 
                           IN3(0), SEL => S(0), Y(15) => temp01_15_port, Y(14) 
                           => temp01_14_port, Y(13) => temp01_13_port, Y(12) =>
                           temp01_12_port, Y(11) => temp01_11_port, Y(10) => 
                           temp01_10_port, Y(9) => temp01_9_port, Y(8) => 
                           temp01_8_port, Y(7) => temp01_7_port, Y(6) => 
                           temp01_6_port, Y(5) => temp01_5_port, Y(4) => 
                           temp01_4_port, Y(3) => temp01_3_port, Y(2) => 
                           temp01_2_port, Y(1) => temp01_1_port, Y(0) => 
                           temp01_0_port);
   mux1 : MUX21_GENERIC_NBIT16_10 port map( A(15) => temp01_15_port, A(14) => 
                           temp01_14_port, A(13) => temp01_13_port, A(12) => 
                           temp01_12_port, A(11) => temp01_11_port, A(10) => 
                           temp01_10_port, A(9) => temp01_9_port, A(8) => 
                           temp01_8_port, A(7) => temp01_7_port, A(6) => 
                           temp01_6_port, A(5) => temp01_5_port, A(4) => 
                           temp01_4_port, A(3) => temp01_3_port, A(2) => 
                           temp01_2_port, A(1) => temp01_1_port, A(0) => 
                           temp01_0_port, B(15) => temp00_15_port, B(14) => 
                           temp00_14_port, B(13) => temp00_13_port, B(12) => 
                           temp00_12_port, B(11) => temp00_11_port, B(10) => 
                           temp00_10_port, B(9) => temp00_9_port, B(8) => 
                           temp00_8_port, B(7) => temp00_7_port, B(6) => 
                           temp00_6_port, B(5) => temp00_5_port, B(4) => 
                           temp00_4_port, B(3) => temp00_3_port, B(2) => 
                           temp00_2_port, B(1) => temp00_1_port, B(0) => 
                           temp00_0_port, SEL => S(1), Y(15) => temp1_15_port, 
                           Y(14) => temp1_14_port, Y(13) => temp1_13_port, 
                           Y(12) => temp1_12_port, Y(11) => temp1_11_port, 
                           Y(10) => temp1_10_port, Y(9) => temp1_9_port, Y(8) 
                           => temp1_8_port, Y(7) => temp1_7_port, Y(6) => 
                           temp1_6_port, Y(5) => temp1_5_port, Y(4) => 
                           temp1_4_port, Y(3) => temp1_3_port, Y(2) => 
                           temp1_2_port, Y(1) => temp1_1_port, Y(0) => 
                           temp1_0_port);
   mux2 : MUX21_GENERIC_NBIT16_9 port map( A(15) => IN0(15), A(14) => IN0(14), 
                           A(13) => IN0(13), A(12) => IN0(12), A(11) => IN0(11)
                           , A(10) => IN0(10), A(9) => IN0(9), A(8) => IN0(8), 
                           A(7) => IN0(7), A(6) => IN0(6), A(5) => IN0(5), A(4)
                           => IN0(4), A(3) => IN0(3), A(2) => IN0(2), A(1) => 
                           IN0(1), A(0) => IN0(0), B(15) => temp1_15_port, 
                           B(14) => temp1_14_port, B(13) => temp1_13_port, 
                           B(12) => temp1_12_port, B(11) => temp1_11_port, 
                           B(10) => temp1_10_port, B(9) => temp1_9_port, B(8) 
                           => temp1_8_port, B(7) => temp1_7_port, B(6) => 
                           temp1_6_port, B(5) => temp1_5_port, B(4) => 
                           temp1_4_port, B(3) => temp1_3_port, B(2) => 
                           temp1_2_port, B(1) => temp1_1_port, B(0) => 
                           temp1_0_port, SEL => S(2), Y(15) => O(15), Y(14) => 
                           O(14), Y(13) => O(13), Y(12) => O(12), Y(11) => 
                           O(11), Y(10) => O(10), Y(9) => O(9), Y(8) => O(8), 
                           Y(7) => O(7), Y(6) => O(6), Y(5) => O(5), Y(4) => 
                           O(4), Y(3) => O(3), Y(2) => O(2), Y(1) => O(1), Y(0)
                           => O(0));

end SYN_mux51_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX51_GENERIC_NBIT16_2 is

   port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : in 
         std_logic_vector (2 downto 0);  O : out std_logic_vector (15 downto 0)
         );

end MUX51_GENERIC_NBIT16_2;

architecture SYN_mux51_struct of MUX51_GENERIC_NBIT16_2 is

   component MUX21_GENERIC_NBIT16_5
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_6
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_7
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_8
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   signal temp00_15_port, temp00_14_port, temp00_13_port, temp00_12_port, 
      temp00_11_port, temp00_10_port, temp00_9_port, temp00_8_port, 
      temp00_7_port, temp00_6_port, temp00_5_port, temp00_4_port, temp00_3_port
      , temp00_2_port, temp00_1_port, temp00_0_port, temp01_15_port, 
      temp01_14_port, temp01_13_port, temp01_12_port, temp01_11_port, 
      temp01_10_port, temp01_9_port, temp01_8_port, temp01_7_port, 
      temp01_6_port, temp01_5_port, temp01_4_port, temp01_3_port, temp01_2_port
      , temp01_1_port, temp01_0_port, temp1_15_port, temp1_14_port, 
      temp1_13_port, temp1_12_port, temp1_11_port, temp1_10_port, temp1_9_port,
      temp1_8_port, temp1_7_port, temp1_6_port, temp1_5_port, temp1_4_port, 
      temp1_3_port, temp1_2_port, temp1_1_port, temp1_0_port : std_logic;

begin
   
   mux00 : MUX21_GENERIC_NBIT16_8 port map( A(15) => IN2(15), A(14) => IN2(14),
                           A(13) => IN2(13), A(12) => IN2(12), A(11) => IN2(11)
                           , A(10) => IN2(10), A(9) => IN2(9), A(8) => IN2(8), 
                           A(7) => IN2(7), A(6) => IN2(6), A(5) => IN2(5), A(4)
                           => IN2(4), A(3) => IN2(3), A(2) => IN2(2), A(1) => 
                           IN2(1), A(0) => IN2(0), B(15) => IN1(15), B(14) => 
                           IN1(14), B(13) => IN1(13), B(12) => IN1(12), B(11) 
                           => IN1(11), B(10) => IN1(10), B(9) => IN1(9), B(8) 
                           => IN1(8), B(7) => IN1(7), B(6) => IN1(6), B(5) => 
                           IN1(5), B(4) => IN1(4), B(3) => IN1(3), B(2) => 
                           IN1(2), B(1) => IN1(1), B(0) => IN1(0), SEL => S(0),
                           Y(15) => temp00_15_port, Y(14) => temp00_14_port, 
                           Y(13) => temp00_13_port, Y(12) => temp00_12_port, 
                           Y(11) => temp00_11_port, Y(10) => temp00_10_port, 
                           Y(9) => temp00_9_port, Y(8) => temp00_8_port, Y(7) 
                           => temp00_7_port, Y(6) => temp00_6_port, Y(5) => 
                           temp00_5_port, Y(4) => temp00_4_port, Y(3) => 
                           temp00_3_port, Y(2) => temp00_2_port, Y(1) => 
                           temp00_1_port, Y(0) => temp00_0_port);
   mux01 : MUX21_GENERIC_NBIT16_7 port map( A(15) => IN4(15), A(14) => IN4(14),
                           A(13) => IN4(13), A(12) => IN4(12), A(11) => IN4(11)
                           , A(10) => IN4(10), A(9) => IN4(9), A(8) => IN4(8), 
                           A(7) => IN4(7), A(6) => IN4(6), A(5) => IN4(5), A(4)
                           => IN4(4), A(3) => IN4(3), A(2) => IN4(2), A(1) => 
                           IN4(1), A(0) => IN4(0), B(15) => IN3(15), B(14) => 
                           IN3(14), B(13) => IN3(13), B(12) => IN3(12), B(11) 
                           => IN3(11), B(10) => IN3(10), B(9) => IN3(9), B(8) 
                           => IN3(8), B(7) => IN3(7), B(6) => IN3(6), B(5) => 
                           IN3(5), B(4) => IN3(4), B(3) => IN3(3), B(2) => 
                           IN3(2), B(1) => IN3(1), B(0) => IN3(0), SEL => S(0),
                           Y(15) => temp01_15_port, Y(14) => temp01_14_port, 
                           Y(13) => temp01_13_port, Y(12) => temp01_12_port, 
                           Y(11) => temp01_11_port, Y(10) => temp01_10_port, 
                           Y(9) => temp01_9_port, Y(8) => temp01_8_port, Y(7) 
                           => temp01_7_port, Y(6) => temp01_6_port, Y(5) => 
                           temp01_5_port, Y(4) => temp01_4_port, Y(3) => 
                           temp01_3_port, Y(2) => temp01_2_port, Y(1) => 
                           temp01_1_port, Y(0) => temp01_0_port);
   mux1 : MUX21_GENERIC_NBIT16_6 port map( A(15) => temp01_15_port, A(14) => 
                           temp01_14_port, A(13) => temp01_13_port, A(12) => 
                           temp01_12_port, A(11) => temp01_11_port, A(10) => 
                           temp01_10_port, A(9) => temp01_9_port, A(8) => 
                           temp01_8_port, A(7) => temp01_7_port, A(6) => 
                           temp01_6_port, A(5) => temp01_5_port, A(4) => 
                           temp01_4_port, A(3) => temp01_3_port, A(2) => 
                           temp01_2_port, A(1) => temp01_1_port, A(0) => 
                           temp01_0_port, B(15) => temp00_15_port, B(14) => 
                           temp00_14_port, B(13) => temp00_13_port, B(12) => 
                           temp00_12_port, B(11) => temp00_11_port, B(10) => 
                           temp00_10_port, B(9) => temp00_9_port, B(8) => 
                           temp00_8_port, B(7) => temp00_7_port, B(6) => 
                           temp00_6_port, B(5) => temp00_5_port, B(4) => 
                           temp00_4_port, B(3) => temp00_3_port, B(2) => 
                           temp00_2_port, B(1) => temp00_1_port, B(0) => 
                           temp00_0_port, SEL => S(1), Y(15) => temp1_15_port, 
                           Y(14) => temp1_14_port, Y(13) => temp1_13_port, 
                           Y(12) => temp1_12_port, Y(11) => temp1_11_port, 
                           Y(10) => temp1_10_port, Y(9) => temp1_9_port, Y(8) 
                           => temp1_8_port, Y(7) => temp1_7_port, Y(6) => 
                           temp1_6_port, Y(5) => temp1_5_port, Y(4) => 
                           temp1_4_port, Y(3) => temp1_3_port, Y(2) => 
                           temp1_2_port, Y(1) => temp1_1_port, Y(0) => 
                           temp1_0_port);
   mux2 : MUX21_GENERIC_NBIT16_5 port map( A(15) => IN0(15), A(14) => IN0(14), 
                           A(13) => IN0(13), A(12) => IN0(12), A(11) => IN0(11)
                           , A(10) => IN0(10), A(9) => IN0(9), A(8) => IN0(8), 
                           A(7) => IN0(7), A(6) => IN0(6), A(5) => IN0(5), A(4)
                           => IN0(4), A(3) => IN0(3), A(2) => IN0(2), A(1) => 
                           IN0(1), A(0) => IN0(0), B(15) => temp1_15_port, 
                           B(14) => temp1_14_port, B(13) => temp1_13_port, 
                           B(12) => temp1_12_port, B(11) => temp1_11_port, 
                           B(10) => temp1_10_port, B(9) => temp1_9_port, B(8) 
                           => temp1_8_port, B(7) => temp1_7_port, B(6) => 
                           temp1_6_port, B(5) => temp1_5_port, B(4) => 
                           temp1_4_port, B(3) => temp1_3_port, B(2) => 
                           temp1_2_port, B(1) => temp1_1_port, B(0) => 
                           temp1_0_port, SEL => S(2), Y(15) => O(15), Y(14) => 
                           O(14), Y(13) => O(13), Y(12) => O(12), Y(11) => 
                           O(11), Y(10) => O(10), Y(9) => O(9), Y(8) => O(8), 
                           Y(7) => O(7), Y(6) => O(6), Y(5) => O(5), Y(4) => 
                           O(4), Y(3) => O(3), Y(2) => O(2), Y(1) => O(1), Y(0)
                           => O(0));

end SYN_mux51_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX51_GENERIC_NBIT16_1 is

   port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : in 
         std_logic_vector (2 downto 0);  O : out std_logic_vector (15 downto 0)
         );

end MUX51_GENERIC_NBIT16_1;

architecture SYN_mux51_struct of MUX51_GENERIC_NBIT16_1 is

   component MUX21_GENERIC_NBIT16_1
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_2
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_3
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_4
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   signal temp00_15_port, temp00_14_port, temp00_13_port, temp00_12_port, 
      temp00_11_port, temp00_10_port, temp00_9_port, temp00_8_port, 
      temp00_7_port, temp00_6_port, temp00_5_port, temp00_4_port, temp00_3_port
      , temp00_2_port, temp00_1_port, temp00_0_port, temp01_15_port, 
      temp01_14_port, temp01_13_port, temp01_12_port, temp01_11_port, 
      temp01_10_port, temp01_9_port, temp01_8_port, temp01_7_port, 
      temp01_6_port, temp01_5_port, temp01_4_port, temp01_3_port, temp01_2_port
      , temp01_1_port, temp01_0_port, temp1_15_port, temp1_14_port, 
      temp1_13_port, temp1_12_port, temp1_11_port, temp1_10_port, temp1_9_port,
      temp1_8_port, temp1_7_port, temp1_6_port, temp1_5_port, temp1_4_port, 
      temp1_3_port, temp1_2_port, temp1_1_port, temp1_0_port : std_logic;

begin
   
   mux00 : MUX21_GENERIC_NBIT16_4 port map( A(15) => IN2(15), A(14) => IN2(14),
                           A(13) => IN2(13), A(12) => IN2(12), A(11) => IN2(11)
                           , A(10) => IN2(10), A(9) => IN2(9), A(8) => IN2(8), 
                           A(7) => IN2(7), A(6) => IN2(6), A(5) => IN2(5), A(4)
                           => IN2(4), A(3) => IN2(3), A(2) => IN2(2), A(1) => 
                           IN2(1), A(0) => IN2(0), B(15) => IN1(15), B(14) => 
                           IN1(14), B(13) => IN1(13), B(12) => IN1(12), B(11) 
                           => IN1(11), B(10) => IN1(10), B(9) => IN1(9), B(8) 
                           => IN1(8), B(7) => IN1(7), B(6) => IN1(6), B(5) => 
                           IN1(5), B(4) => IN1(4), B(3) => IN1(3), B(2) => 
                           IN1(2), B(1) => IN1(1), B(0) => IN1(0), SEL => S(0),
                           Y(15) => temp00_15_port, Y(14) => temp00_14_port, 
                           Y(13) => temp00_13_port, Y(12) => temp00_12_port, 
                           Y(11) => temp00_11_port, Y(10) => temp00_10_port, 
                           Y(9) => temp00_9_port, Y(8) => temp00_8_port, Y(7) 
                           => temp00_7_port, Y(6) => temp00_6_port, Y(5) => 
                           temp00_5_port, Y(4) => temp00_4_port, Y(3) => 
                           temp00_3_port, Y(2) => temp00_2_port, Y(1) => 
                           temp00_1_port, Y(0) => temp00_0_port);
   mux01 : MUX21_GENERIC_NBIT16_3 port map( A(15) => IN4(15), A(14) => IN4(14),
                           A(13) => IN4(13), A(12) => IN4(12), A(11) => IN4(11)
                           , A(10) => IN4(10), A(9) => IN4(9), A(8) => IN4(8), 
                           A(7) => IN4(7), A(6) => IN4(6), A(5) => IN4(5), A(4)
                           => IN4(4), A(3) => IN4(3), A(2) => IN4(2), A(1) => 
                           IN4(1), A(0) => IN4(0), B(15) => IN3(15), B(14) => 
                           IN3(14), B(13) => IN3(13), B(12) => IN3(12), B(11) 
                           => IN3(11), B(10) => IN3(10), B(9) => IN3(9), B(8) 
                           => IN3(8), B(7) => IN3(7), B(6) => IN3(6), B(5) => 
                           IN3(5), B(4) => IN3(4), B(3) => IN3(3), B(2) => 
                           IN3(2), B(1) => IN3(1), B(0) => IN3(0), SEL => S(0),
                           Y(15) => temp01_15_port, Y(14) => temp01_14_port, 
                           Y(13) => temp01_13_port, Y(12) => temp01_12_port, 
                           Y(11) => temp01_11_port, Y(10) => temp01_10_port, 
                           Y(9) => temp01_9_port, Y(8) => temp01_8_port, Y(7) 
                           => temp01_7_port, Y(6) => temp01_6_port, Y(5) => 
                           temp01_5_port, Y(4) => temp01_4_port, Y(3) => 
                           temp01_3_port, Y(2) => temp01_2_port, Y(1) => 
                           temp01_1_port, Y(0) => temp01_0_port);
   mux1 : MUX21_GENERIC_NBIT16_2 port map( A(15) => temp01_15_port, A(14) => 
                           temp01_14_port, A(13) => temp01_13_port, A(12) => 
                           temp01_12_port, A(11) => temp01_11_port, A(10) => 
                           temp01_10_port, A(9) => temp01_9_port, A(8) => 
                           temp01_8_port, A(7) => temp01_7_port, A(6) => 
                           temp01_6_port, A(5) => temp01_5_port, A(4) => 
                           temp01_4_port, A(3) => temp01_3_port, A(2) => 
                           temp01_2_port, A(1) => temp01_1_port, A(0) => 
                           temp01_0_port, B(15) => temp00_15_port, B(14) => 
                           temp00_14_port, B(13) => temp00_13_port, B(12) => 
                           temp00_12_port, B(11) => temp00_11_port, B(10) => 
                           temp00_10_port, B(9) => temp00_9_port, B(8) => 
                           temp00_8_port, B(7) => temp00_7_port, B(6) => 
                           temp00_6_port, B(5) => temp00_5_port, B(4) => 
                           temp00_4_port, B(3) => temp00_3_port, B(2) => 
                           temp00_2_port, B(1) => temp00_1_port, B(0) => 
                           temp00_0_port, SEL => S(1), Y(15) => temp1_15_port, 
                           Y(14) => temp1_14_port, Y(13) => temp1_13_port, 
                           Y(12) => temp1_12_port, Y(11) => temp1_11_port, 
                           Y(10) => temp1_10_port, Y(9) => temp1_9_port, Y(8) 
                           => temp1_8_port, Y(7) => temp1_7_port, Y(6) => 
                           temp1_6_port, Y(5) => temp1_5_port, Y(4) => 
                           temp1_4_port, Y(3) => temp1_3_port, Y(2) => 
                           temp1_2_port, Y(1) => temp1_1_port, Y(0) => 
                           temp1_0_port);
   mux2 : MUX21_GENERIC_NBIT16_1 port map( A(15) => IN0(15), A(14) => IN0(14), 
                           A(13) => IN0(13), A(12) => IN0(12), A(11) => IN0(11)
                           , A(10) => IN0(10), A(9) => IN0(9), A(8) => IN0(8), 
                           A(7) => IN0(7), A(6) => IN0(6), A(5) => IN0(5), A(4)
                           => IN0(4), A(3) => IN0(3), A(2) => IN0(2), A(1) => 
                           IN0(1), A(0) => IN0(0), B(15) => temp1_15_port, 
                           B(14) => temp1_14_port, B(13) => temp1_13_port, 
                           B(12) => temp1_12_port, B(11) => temp1_11_port, 
                           B(10) => temp1_10_port, B(9) => temp1_9_port, B(8) 
                           => temp1_8_port, B(7) => temp1_7_port, B(6) => 
                           temp1_6_port, B(5) => temp1_5_port, B(4) => 
                           temp1_4_port, B(3) => temp1_3_port, B(2) => 
                           temp1_2_port, B(1) => temp1_1_port, B(0) => 
                           temp1_0_port, SEL => S(2), Y(15) => O(15), Y(14) => 
                           O(14), Y(13) => O(13), Y(12) => O(12), Y(11) => 
                           O(11), Y(10) => O(10), Y(9) => O(9), Y(8) => O(8), 
                           Y(7) => O(7), Y(6) => O(6), Y(5) => O(5), Y(4) => 
                           O(4), Y(3) => O(3), Y(2) => O(2), Y(1) => O(1), Y(0)
                           => O(0));

end SYN_mux51_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity BOOTH_ENCODER_3BIT_3 is

   port( B : in std_logic_vector (2 downto 0);  ENCODED : out std_logic_vector 
         (2 downto 0));

end BOOTH_ENCODER_3BIT_3;

architecture SYN_dataflow of BOOTH_ENCODER_3BIT_3 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n7, n1, n3, n4, n5 : std_logic;

begin
   
   U3 : INV_X1 port map( A => n7, ZN => n1);
   U4 : INV_X2 port map( A => n1, ZN => ENCODED(0));
   U5 : INV_X1 port map( A => n3, ZN => ENCODED(1));
   U6 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => ENCODED(2));
   U7 : XOR2_X1 port map( A => n5, B => B(2), Z => n4);
   U8 : AOI21_X1 port map( B1 => n3, B2 => n5, A => B(2), ZN => n7);
   U9 : XOR2_X1 port map( A => n5, B => B(1), Z => n3);
   U10 : INV_X1 port map( A => B(0), ZN => n5);

end SYN_dataflow;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity BOOTH_ENCODER_3BIT_2 is

   port( B : in std_logic_vector (2 downto 0);  ENCODED : out std_logic_vector 
         (2 downto 0));

end BOOTH_ENCODER_3BIT_2;

architecture SYN_dataflow of BOOTH_ENCODER_3BIT_2 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n7, n1, n3, n4, n5 : std_logic;

begin
   
   U3 : INV_X1 port map( A => n7, ZN => n1);
   U4 : INV_X2 port map( A => n1, ZN => ENCODED(0));
   U5 : INV_X1 port map( A => n3, ZN => ENCODED(1));
   U6 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => ENCODED(2));
   U7 : XOR2_X1 port map( A => n5, B => B(2), Z => n4);
   U8 : AOI21_X1 port map( B1 => n3, B2 => n5, A => B(2), ZN => n7);
   U9 : XOR2_X1 port map( A => n5, B => B(1), Z => n3);
   U10 : INV_X1 port map( A => B(0), ZN => n5);

end SYN_dataflow;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity BOOTH_ENCODER_3BIT_1 is

   port( B : in std_logic_vector (2 downto 0);  ENCODED : out std_logic_vector 
         (2 downto 0));

end BOOTH_ENCODER_3BIT_1;

architecture SYN_dataflow of BOOTH_ENCODER_3BIT_1 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n7, n1, n3, n4, n5 : std_logic;

begin
   
   U3 : INV_X1 port map( A => n7, ZN => n1);
   U4 : INV_X2 port map( A => n1, ZN => ENCODED(0));
   U5 : INV_X1 port map( A => n3, ZN => ENCODED(1));
   U6 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => ENCODED(2));
   U7 : XOR2_X1 port map( A => n5, B => B(2), Z => n4);
   U8 : AOI21_X1 port map( B1 => n3, B2 => n5, A => B(2), ZN => n7);
   U9 : XOR2_X1 port map( A => n5, B => B(1), Z => n3);
   U10 : INV_X1 port map( A => B(0), ZN => n5);

end SYN_dataflow;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX21_GENERIC_NBIT16_0 is

   port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y : 
         out std_logic_vector (15 downto 0));

end MUX21_GENERIC_NBIT16_0;

architecture SYN_BEH of MUX21_GENERIC_NBIT16_0 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : MUX2_X1 port map( A => A(9), B => B(9), S => SEL, Z => Y(9));
   U2 : MUX2_X1 port map( A => A(8), B => B(8), S => SEL, Z => Y(8));
   U3 : MUX2_X1 port map( A => A(7), B => B(7), S => SEL, Z => Y(7));
   U4 : MUX2_X1 port map( A => A(6), B => B(6), S => SEL, Z => Y(6));
   U5 : MUX2_X1 port map( A => A(5), B => B(5), S => SEL, Z => Y(5));
   U6 : MUX2_X1 port map( A => A(4), B => B(4), S => SEL, Z => Y(4));
   U7 : MUX2_X1 port map( A => A(3), B => B(3), S => SEL, Z => Y(3));
   U8 : MUX2_X1 port map( A => A(2), B => B(2), S => SEL, Z => Y(2));
   U9 : MUX2_X1 port map( A => A(1), B => B(1), S => SEL, Z => Y(1));
   U10 : MUX2_X1 port map( A => A(15), B => B(15), S => SEL, Z => Y(15));
   U11 : MUX2_X1 port map( A => A(14), B => B(14), S => SEL, Z => Y(14));
   U12 : MUX2_X1 port map( A => A(13), B => B(13), S => SEL, Z => Y(13));
   U13 : MUX2_X1 port map( A => A(12), B => B(12), S => SEL, Z => Y(12));
   U14 : MUX2_X1 port map( A => A(11), B => B(11), S => SEL, Z => Y(11));
   U15 : MUX2_X1 port map( A => A(10), B => B(10), S => SEL, Z => Y(10));
   U16 : MUX2_X1 port map( A => A(0), B => B(0), S => SEL, Z => Y(0));

end SYN_BEH;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity RCA_GENERIC_NBIT16_0 is

   port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : out
         std_logic_vector (15 downto 0);  Co : out std_logic);

end RCA_GENERIC_NBIT16_0;

architecture SYN_BEHAVIORAL of RCA_GENERIC_NBIT16_0 is

   component RCA_GENERIC_NBIT16_0_DW01_add_0
      port( A, B : in std_logic_vector (16 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (16 downto 0);  CO : out std_logic);
   end component;
   
   signal n1, n_1011 : std_logic;

begin
   
   n1 <= '0';
   add_1_root_add_23_2 : RCA_GENERIC_NBIT16_0_DW01_add_0 port map( A(16) => n1,
                           A(15) => A(15), A(14) => A(14), A(13) => A(13), 
                           A(12) => A(12), A(11) => A(11), A(10) => A(10), A(9)
                           => A(9), A(8) => A(8), A(7) => A(7), A(6) => A(6), 
                           A(5) => A(5), A(4) => A(4), A(3) => A(3), A(2) => 
                           A(2), A(1) => A(1), A(0) => A(0), B(16) => n1, B(15)
                           => B(15), B(14) => B(14), B(13) => B(13), B(12) => 
                           B(12), B(11) => B(11), B(10) => B(10), B(9) => B(9),
                           B(8) => B(8), B(7) => B(7), B(6) => B(6), B(5) => 
                           B(5), B(4) => B(4), B(3) => B(3), B(2) => B(2), B(1)
                           => B(1), B(0) => B(0), CI => Ci, SUM(16) => Co, 
                           SUM(15) => S(15), SUM(14) => S(14), SUM(13) => S(13)
                           , SUM(12) => S(12), SUM(11) => S(11), SUM(10) => 
                           S(10), SUM(9) => S(9), SUM(8) => S(8), SUM(7) => 
                           S(7), SUM(6) => S(6), SUM(5) => S(5), SUM(4) => S(4)
                           , SUM(3) => S(3), SUM(2) => S(2), SUM(1) => S(1), 
                           SUM(0) => S(0), CO => n_1011);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity MUX51_GENERIC_NBIT16_0 is

   port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : in 
         std_logic_vector (2 downto 0);  O : out std_logic_vector (15 downto 0)
         );

end MUX51_GENERIC_NBIT16_0;

architecture SYN_mux51_struct of MUX51_GENERIC_NBIT16_0 is

   component MUX21_GENERIC_NBIT16_13
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_14
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_15
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   component MUX21_GENERIC_NBIT16_0
      port( A, B : in std_logic_vector (15 downto 0);  SEL : in std_logic;  Y :
            out std_logic_vector (15 downto 0));
   end component;
   
   signal temp00_15_port, temp00_14_port, temp00_13_port, temp00_12_port, 
      temp00_11_port, temp00_10_port, temp00_9_port, temp00_8_port, 
      temp00_7_port, temp00_6_port, temp00_5_port, temp00_4_port, temp00_3_port
      , temp00_2_port, temp00_1_port, temp00_0_port, temp01_15_port, 
      temp01_14_port, temp01_13_port, temp01_12_port, temp01_11_port, 
      temp01_10_port, temp01_9_port, temp01_8_port, temp01_7_port, 
      temp01_6_port, temp01_5_port, temp01_4_port, temp01_3_port, temp01_2_port
      , temp01_1_port, temp01_0_port, temp1_15_port, temp1_14_port, 
      temp1_13_port, temp1_12_port, temp1_11_port, temp1_10_port, temp1_9_port,
      temp1_8_port, temp1_7_port, temp1_6_port, temp1_5_port, temp1_4_port, 
      temp1_3_port, temp1_2_port, temp1_1_port, temp1_0_port : std_logic;

begin
   
   mux00 : MUX21_GENERIC_NBIT16_0 port map( A(15) => IN2(15), A(14) => IN2(14),
                           A(13) => IN2(13), A(12) => IN2(12), A(11) => IN2(11)
                           , A(10) => IN2(10), A(9) => IN2(9), A(8) => IN2(8), 
                           A(7) => IN2(7), A(6) => IN2(6), A(5) => IN2(5), A(4)
                           => IN2(4), A(3) => IN2(3), A(2) => IN2(2), A(1) => 
                           IN2(1), A(0) => IN2(0), B(15) => IN1(15), B(14) => 
                           IN1(14), B(13) => IN1(13), B(12) => IN1(12), B(11) 
                           => IN1(11), B(10) => IN1(10), B(9) => IN1(9), B(8) 
                           => IN1(8), B(7) => IN1(7), B(6) => IN1(6), B(5) => 
                           IN1(5), B(4) => IN1(4), B(3) => IN1(3), B(2) => 
                           IN1(2), B(1) => IN1(1), B(0) => IN1(0), SEL => S(0),
                           Y(15) => temp00_15_port, Y(14) => temp00_14_port, 
                           Y(13) => temp00_13_port, Y(12) => temp00_12_port, 
                           Y(11) => temp00_11_port, Y(10) => temp00_10_port, 
                           Y(9) => temp00_9_port, Y(8) => temp00_8_port, Y(7) 
                           => temp00_7_port, Y(6) => temp00_6_port, Y(5) => 
                           temp00_5_port, Y(4) => temp00_4_port, Y(3) => 
                           temp00_3_port, Y(2) => temp00_2_port, Y(1) => 
                           temp00_1_port, Y(0) => temp00_0_port);
   mux01 : MUX21_GENERIC_NBIT16_15 port map( A(15) => IN4(15), A(14) => IN4(14)
                           , A(13) => IN4(13), A(12) => IN4(12), A(11) => 
                           IN4(11), A(10) => IN4(10), A(9) => IN4(9), A(8) => 
                           IN4(8), A(7) => IN4(7), A(6) => IN4(6), A(5) => 
                           IN4(5), A(4) => IN4(4), A(3) => IN4(3), A(2) => 
                           IN4(2), A(1) => IN4(1), A(0) => IN4(0), B(15) => 
                           IN3(15), B(14) => IN3(14), B(13) => IN3(13), B(12) 
                           => IN3(12), B(11) => IN3(11), B(10) => IN3(10), B(9)
                           => IN3(9), B(8) => IN3(8), B(7) => IN3(7), B(6) => 
                           IN3(6), B(5) => IN3(5), B(4) => IN3(4), B(3) => 
                           IN3(3), B(2) => IN3(2), B(1) => IN3(1), B(0) => 
                           IN3(0), SEL => S(0), Y(15) => temp01_15_port, Y(14) 
                           => temp01_14_port, Y(13) => temp01_13_port, Y(12) =>
                           temp01_12_port, Y(11) => temp01_11_port, Y(10) => 
                           temp01_10_port, Y(9) => temp01_9_port, Y(8) => 
                           temp01_8_port, Y(7) => temp01_7_port, Y(6) => 
                           temp01_6_port, Y(5) => temp01_5_port, Y(4) => 
                           temp01_4_port, Y(3) => temp01_3_port, Y(2) => 
                           temp01_2_port, Y(1) => temp01_1_port, Y(0) => 
                           temp01_0_port);
   mux1 : MUX21_GENERIC_NBIT16_14 port map( A(15) => temp01_15_port, A(14) => 
                           temp01_14_port, A(13) => temp01_13_port, A(12) => 
                           temp01_12_port, A(11) => temp01_11_port, A(10) => 
                           temp01_10_port, A(9) => temp01_9_port, A(8) => 
                           temp01_8_port, A(7) => temp01_7_port, A(6) => 
                           temp01_6_port, A(5) => temp01_5_port, A(4) => 
                           temp01_4_port, A(3) => temp01_3_port, A(2) => 
                           temp01_2_port, A(1) => temp01_1_port, A(0) => 
                           temp01_0_port, B(15) => temp00_15_port, B(14) => 
                           temp00_14_port, B(13) => temp00_13_port, B(12) => 
                           temp00_12_port, B(11) => temp00_11_port, B(10) => 
                           temp00_10_port, B(9) => temp00_9_port, B(8) => 
                           temp00_8_port, B(7) => temp00_7_port, B(6) => 
                           temp00_6_port, B(5) => temp00_5_port, B(4) => 
                           temp00_4_port, B(3) => temp00_3_port, B(2) => 
                           temp00_2_port, B(1) => temp00_1_port, B(0) => 
                           temp00_0_port, SEL => S(1), Y(15) => temp1_15_port, 
                           Y(14) => temp1_14_port, Y(13) => temp1_13_port, 
                           Y(12) => temp1_12_port, Y(11) => temp1_11_port, 
                           Y(10) => temp1_10_port, Y(9) => temp1_9_port, Y(8) 
                           => temp1_8_port, Y(7) => temp1_7_port, Y(6) => 
                           temp1_6_port, Y(5) => temp1_5_port, Y(4) => 
                           temp1_4_port, Y(3) => temp1_3_port, Y(2) => 
                           temp1_2_port, Y(1) => temp1_1_port, Y(0) => 
                           temp1_0_port);
   mux2 : MUX21_GENERIC_NBIT16_13 port map( A(15) => IN0(15), A(14) => IN0(14),
                           A(13) => IN0(13), A(12) => IN0(12), A(11) => IN0(11)
                           , A(10) => IN0(10), A(9) => IN0(9), A(8) => IN0(8), 
                           A(7) => IN0(7), A(6) => IN0(6), A(5) => IN0(5), A(4)
                           => IN0(4), A(3) => IN0(3), A(2) => IN0(2), A(1) => 
                           IN0(1), A(0) => IN0(0), B(15) => temp1_15_port, 
                           B(14) => temp1_14_port, B(13) => temp1_13_port, 
                           B(12) => temp1_12_port, B(11) => temp1_11_port, 
                           B(10) => temp1_10_port, B(9) => temp1_9_port, B(8) 
                           => temp1_8_port, B(7) => temp1_7_port, B(6) => 
                           temp1_6_port, B(5) => temp1_5_port, B(4) => 
                           temp1_4_port, B(3) => temp1_3_port, B(2) => 
                           temp1_2_port, B(1) => temp1_1_port, B(0) => 
                           temp1_0_port, SEL => S(2), Y(15) => O(15), Y(14) => 
                           O(14), Y(13) => O(13), Y(12) => O(12), Y(11) => 
                           O(11), Y(10) => O(10), Y(9) => O(9), Y(8) => O(8), 
                           Y(7) => O(7), Y(6) => O(6), Y(5) => O(5), Y(4) => 
                           O(4), Y(3) => O(3), Y(2) => O(2), Y(1) => O(1), Y(0)
                           => O(0));

end SYN_mux51_struct;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity BOOTH_ENCODER_3BIT_0 is

   port( B : in std_logic_vector (2 downto 0);  ENCODED : out std_logic_vector 
         (2 downto 0));

end BOOTH_ENCODER_3BIT_0;

architecture SYN_dataflow of BOOTH_ENCODER_3BIT_0 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component INV_X2
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal n7, n1, n3, n4, n5 : std_logic;

begin
   
   U3 : INV_X1 port map( A => n7, ZN => n1);
   U4 : INV_X2 port map( A => n1, ZN => ENCODED(0));
   U5 : INV_X1 port map( A => n3, ZN => ENCODED(1));
   U6 : NAND2_X1 port map( A1 => n4, A2 => n3, ZN => ENCODED(2));
   U7 : XOR2_X1 port map( A => n5, B => B(2), Z => n4);
   U8 : AOI21_X1 port map( B1 => n3, B2 => n5, A => B(2), ZN => n7);
   U9 : XOR2_X1 port map( A => n5, B => B(1), Z => n3);
   U10 : INV_X1 port map( A => B(0), ZN => n5);

end SYN_dataflow;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_BOOTHMUL_NBIT8.all;

entity BOOTHMUL_NBIT8 is

   port( A, B : in std_logic_vector (7 downto 0);  P : out std_logic_vector (15
         downto 0));

end BOOTHMUL_NBIT8;

architecture SYN_BOOTHMUL_STRUCT of BOOTHMUL_NBIT8 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X4
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component HA_X1
      port( A, B : in std_logic;  CO, S : out std_logic);
   end component;
   
   component RCA_GENERIC_NBIT16_1
      port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (15 downto 0);  Co : out std_logic);
   end component;
   
   component MUX51_GENERIC_NBIT16_1
      port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : 
            in std_logic_vector (2 downto 0);  O : out std_logic_vector (15 
            downto 0));
   end component;
   
   component BOOTH_ENCODER_3BIT_1
      port( B : in std_logic_vector (2 downto 0);  ENCODED : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component RCA_GENERIC_NBIT16_2
      port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (15 downto 0);  Co : out std_logic);
   end component;
   
   component MUX51_GENERIC_NBIT16_2
      port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : 
            in std_logic_vector (2 downto 0);  O : out std_logic_vector (15 
            downto 0));
   end component;
   
   component BOOTH_ENCODER_3BIT_2
      port( B : in std_logic_vector (2 downto 0);  ENCODED : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component RCA_GENERIC_NBIT16_0
      port( A, B : in std_logic_vector (15 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (15 downto 0);  Co : out std_logic);
   end component;
   
   component MUX51_GENERIC_NBIT16_3
      port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : 
            in std_logic_vector (2 downto 0);  O : out std_logic_vector (15 
            downto 0));
   end component;
   
   component BOOTH_ENCODER_3BIT_3
      port( B : in std_logic_vector (2 downto 0);  ENCODED : out 
            std_logic_vector (2 downto 0));
   end component;
   
   component MUX51_GENERIC_NBIT16_0
      port( IN0, IN1, IN2, IN3, IN4 : in std_logic_vector (15 downto 0);  S : 
            in std_logic_vector (2 downto 0);  O : out std_logic_vector (15 
            downto 0));
   end component;
   
   component BOOTH_ENCODER_3BIT_0
      port( B : in std_logic_vector (2 downto 0);  ENCODED : out 
            std_logic_vector (2 downto 0));
   end component;
   
   signal X_Logic0_port, negative_a_15_port, negative_a_7_port, 
      negative_a_6_port, negative_a_5_port, negative_a_4_port, 
      negative_a_3_port, negative_a_2_port, negative_a_1_port, 
      muxs_encoded_signals_0_2_port, muxs_encoded_signals_0_1_port, 
      muxs_encoded_signals_0_0_port, muxs_encoded_signals_1_2_port, 
      muxs_encoded_signals_1_1_port, muxs_encoded_signals_1_0_port, 
      muxs_encoded_signals_2_2_port, muxs_encoded_signals_2_1_port, 
      muxs_encoded_signals_2_0_port, muxs_encoded_signals_3_2_port, 
      muxs_encoded_signals_3_1_port, muxs_encoded_signals_3_0_port, 
      out_imux_0_15_port, out_imux_0_14_port, out_imux_0_13_port, 
      out_imux_0_12_port, out_imux_0_11_port, out_imux_0_10_port, 
      out_imux_0_9_port, out_imux_0_8_port, out_imux_0_7_port, 
      out_imux_0_6_port, out_imux_0_5_port, out_imux_0_4_port, 
      out_imux_0_3_port, out_imux_0_2_port, out_imux_0_1_port, 
      out_imux_0_0_port, out_imux_1_15_port, out_imux_1_14_port, 
      out_imux_1_13_port, out_imux_1_12_port, out_imux_1_11_port, 
      out_imux_1_10_port, out_imux_1_9_port, out_imux_1_8_port, 
      out_imux_1_7_port, out_imux_1_6_port, out_imux_1_5_port, 
      out_imux_1_4_port, out_imux_1_3_port, out_imux_1_2_port, 
      out_imux_1_1_port, out_imux_1_0_port, out_imux_2_15_port, 
      out_imux_2_14_port, out_imux_2_13_port, out_imux_2_12_port, 
      out_imux_2_11_port, out_imux_2_10_port, out_imux_2_9_port, 
      out_imux_2_8_port, out_imux_2_7_port, out_imux_2_6_port, 
      out_imux_2_5_port, out_imux_2_4_port, out_imux_2_3_port, 
      out_imux_2_2_port, out_imux_2_1_port, out_imux_2_0_port, 
      out_imux_3_15_port, out_imux_3_14_port, out_imux_3_13_port, 
      out_imux_3_12_port, out_imux_3_11_port, out_imux_3_10_port, 
      out_imux_3_9_port, out_imux_3_8_port, out_imux_3_7_port, 
      out_imux_3_6_port, out_imux_3_5_port, out_imux_3_4_port, 
      out_imux_3_3_port, out_imux_3_2_port, out_imux_3_1_port, 
      out_imux_3_0_port, predigest_product_1_15_port, 
      predigest_product_1_14_port, predigest_product_1_13_port, 
      predigest_product_1_12_port, predigest_product_1_11_port, 
      predigest_product_1_10_port, predigest_product_1_9_port, 
      predigest_product_1_8_port, predigest_product_1_7_port, 
      predigest_product_1_6_port, predigest_product_1_5_port, 
      predigest_product_1_4_port, predigest_product_1_3_port, 
      predigest_product_1_2_port, predigest_product_1_1_port, 
      predigest_product_1_0_port, predigest_product_2_15_port, 
      predigest_product_2_14_port, predigest_product_2_13_port, 
      predigest_product_2_12_port, predigest_product_2_11_port, 
      predigest_product_2_10_port, predigest_product_2_9_port, 
      predigest_product_2_8_port, predigest_product_2_7_port, 
      predigest_product_2_6_port, predigest_product_2_5_port, 
      predigest_product_2_4_port, predigest_product_2_3_port, 
      predigest_product_2_2_port, predigest_product_2_1_port, 
      predigest_product_2_0_port, add_66_carry_2_port, add_66_carry_3_port, 
      add_66_carry_4_port, add_66_carry_5_port, add_66_carry_6_port, 
      add_66_carry_7_port, add_66_A_0_port, add_66_A_1_port, add_66_A_2_port, 
      add_66_A_3_port, add_66_A_4_port, add_66_A_5_port, add_66_A_6_port, n9, 
      n_1012, n_1013, n_1014 : std_logic;

begin
   
   X_Logic0_port <= '0';
   ENC_0_0 : BOOTH_ENCODER_3BIT_0 port map( B(2) => B(1), B(1) => B(0), B(0) =>
                           X_Logic0_port, ENCODED(2) => 
                           muxs_encoded_signals_0_2_port, ENCODED(1) => 
                           muxs_encoded_signals_0_1_port, ENCODED(0) => 
                           muxs_encoded_signals_0_0_port);
   MUX_00_0 : MUX51_GENERIC_NBIT16_0 port map( IN0(15) => X_Logic0_port, 
                           IN0(14) => X_Logic0_port, IN0(13) => X_Logic0_port, 
                           IN0(12) => X_Logic0_port, IN0(11) => X_Logic0_port, 
                           IN0(10) => X_Logic0_port, IN0(9) => X_Logic0_port, 
                           IN0(8) => X_Logic0_port, IN0(7) => X_Logic0_port, 
                           IN0(6) => X_Logic0_port, IN0(5) => X_Logic0_port, 
                           IN0(4) => X_Logic0_port, IN0(3) => X_Logic0_port, 
                           IN0(2) => X_Logic0_port, IN0(1) => X_Logic0_port, 
                           IN0(0) => X_Logic0_port, IN1(15) => A(7), IN1(14) =>
                           A(7), IN1(13) => A(7), IN1(12) => A(7), IN1(11) => 
                           A(7), IN1(10) => A(7), IN1(9) => A(7), IN1(8) => 
                           A(7), IN1(7) => A(7), IN1(6) => A(6), IN1(5) => A(5)
                           , IN1(4) => A(4), IN1(3) => A(3), IN1(2) => A(2), 
                           IN1(1) => A(1), IN1(0) => A(0), IN2(15) => 
                           negative_a_15_port, IN2(14) => negative_a_15_port, 
                           IN2(13) => negative_a_15_port, IN2(12) => 
                           negative_a_15_port, IN2(11) => negative_a_15_port, 
                           IN2(10) => negative_a_15_port, IN2(9) => 
                           negative_a_15_port, IN2(8) => negative_a_15_port, 
                           IN2(7) => negative_a_7_port, IN2(6) => 
                           negative_a_6_port, IN2(5) => negative_a_5_port, 
                           IN2(4) => negative_a_4_port, IN2(3) => 
                           negative_a_3_port, IN2(2) => negative_a_2_port, 
                           IN2(1) => negative_a_1_port, IN2(0) => A(0), IN3(15)
                           => A(7), IN3(14) => A(7), IN3(13) => A(7), IN3(12) 
                           => A(7), IN3(11) => A(7), IN3(10) => A(7), IN3(9) =>
                           A(7), IN3(8) => A(7), IN3(7) => A(6), IN3(6) => A(5)
                           , IN3(5) => A(4), IN3(4) => A(3), IN3(3) => A(2), 
                           IN3(2) => A(1), IN3(1) => A(0), IN3(0) => 
                           X_Logic0_port, IN4(15) => negative_a_15_port, 
                           IN4(14) => negative_a_15_port, IN4(13) => 
                           negative_a_15_port, IN4(12) => negative_a_15_port, 
                           IN4(11) => negative_a_15_port, IN4(10) => 
                           negative_a_15_port, IN4(9) => negative_a_15_port, 
                           IN4(8) => negative_a_7_port, IN4(7) => 
                           negative_a_6_port, IN4(6) => negative_a_5_port, 
                           IN4(5) => negative_a_4_port, IN4(4) => 
                           negative_a_3_port, IN4(3) => negative_a_2_port, 
                           IN4(2) => negative_a_1_port, IN4(1) => A(0), IN4(0) 
                           => X_Logic0_port, S(2) => 
                           muxs_encoded_signals_0_2_port, S(1) => 
                           muxs_encoded_signals_0_1_port, S(0) => 
                           muxs_encoded_signals_0_0_port, O(15) => 
                           out_imux_0_15_port, O(14) => out_imux_0_14_port, 
                           O(13) => out_imux_0_13_port, O(12) => 
                           out_imux_0_12_port, O(11) => out_imux_0_11_port, 
                           O(10) => out_imux_0_10_port, O(9) => 
                           out_imux_0_9_port, O(8) => out_imux_0_8_port, O(7) 
                           => out_imux_0_7_port, O(6) => out_imux_0_6_port, 
                           O(5) => out_imux_0_5_port, O(4) => out_imux_0_4_port
                           , O(3) => out_imux_0_3_port, O(2) => 
                           out_imux_0_2_port, O(1) => out_imux_0_1_port, O(0) 
                           => out_imux_0_0_port);
   ENC_i_1 : BOOTH_ENCODER_3BIT_3 port map( B(2) => B(3), B(1) => B(2), B(0) =>
                           B(1), ENCODED(2) => muxs_encoded_signals_1_2_port, 
                           ENCODED(1) => muxs_encoded_signals_1_1_port, 
                           ENCODED(0) => muxs_encoded_signals_1_0_port);
   MUX_i_1 : MUX51_GENERIC_NBIT16_3 port map( IN0(15) => X_Logic0_port, IN0(14)
                           => X_Logic0_port, IN0(13) => X_Logic0_port, IN0(12) 
                           => X_Logic0_port, IN0(11) => X_Logic0_port, IN0(10) 
                           => X_Logic0_port, IN0(9) => X_Logic0_port, IN0(8) =>
                           X_Logic0_port, IN0(7) => X_Logic0_port, IN0(6) => 
                           X_Logic0_port, IN0(5) => X_Logic0_port, IN0(4) => 
                           X_Logic0_port, IN0(3) => X_Logic0_port, IN0(2) => 
                           X_Logic0_port, IN0(1) => X_Logic0_port, IN0(0) => 
                           X_Logic0_port, IN1(15) => A(7), IN1(14) => A(7), 
                           IN1(13) => A(7), IN1(12) => A(7), IN1(11) => A(7), 
                           IN1(10) => A(7), IN1(9) => A(7), IN1(8) => A(6), 
                           IN1(7) => A(5), IN1(6) => A(4), IN1(5) => A(3), 
                           IN1(4) => A(2), IN1(3) => A(1), IN1(2) => A(0), 
                           IN1(1) => X_Logic0_port, IN1(0) => X_Logic0_port, 
                           IN2(15) => negative_a_15_port, IN2(14) => 
                           negative_a_15_port, IN2(13) => negative_a_15_port, 
                           IN2(12) => negative_a_15_port, IN2(11) => 
                           negative_a_15_port, IN2(10) => negative_a_15_port, 
                           IN2(9) => negative_a_7_port, IN2(8) => 
                           negative_a_6_port, IN2(7) => negative_a_5_port, 
                           IN2(6) => negative_a_4_port, IN2(5) => 
                           negative_a_3_port, IN2(4) => negative_a_2_port, 
                           IN2(3) => negative_a_1_port, IN2(2) => A(0), IN2(1) 
                           => X_Logic0_port, IN2(0) => X_Logic0_port, IN3(15) 
                           => A(7), IN3(14) => A(7), IN3(13) => A(7), IN3(12) 
                           => A(7), IN3(11) => A(7), IN3(10) => A(7), IN3(9) =>
                           A(6), IN3(8) => A(5), IN3(7) => A(4), IN3(6) => A(3)
                           , IN3(5) => A(2), IN3(4) => A(1), IN3(3) => A(0), 
                           IN3(2) => X_Logic0_port, IN3(1) => X_Logic0_port, 
                           IN3(0) => X_Logic0_port, IN4(15) => 
                           negative_a_15_port, IN4(14) => negative_a_15_port, 
                           IN4(13) => negative_a_15_port, IN4(12) => 
                           negative_a_15_port, IN4(11) => negative_a_15_port, 
                           IN4(10) => negative_a_7_port, IN4(9) => 
                           negative_a_6_port, IN4(8) => negative_a_5_port, 
                           IN4(7) => negative_a_4_port, IN4(6) => 
                           negative_a_3_port, IN4(5) => negative_a_2_port, 
                           IN4(4) => negative_a_1_port, IN4(3) => A(0), IN4(2) 
                           => X_Logic0_port, IN4(1) => X_Logic0_port, IN4(0) =>
                           X_Logic0_port, S(2) => muxs_encoded_signals_1_2_port
                           , S(1) => muxs_encoded_signals_1_1_port, S(0) => 
                           muxs_encoded_signals_1_0_port, O(15) => 
                           out_imux_1_15_port, O(14) => out_imux_1_14_port, 
                           O(13) => out_imux_1_13_port, O(12) => 
                           out_imux_1_12_port, O(11) => out_imux_1_11_port, 
                           O(10) => out_imux_1_10_port, O(9) => 
                           out_imux_1_9_port, O(8) => out_imux_1_8_port, O(7) 
                           => out_imux_1_7_port, O(6) => out_imux_1_6_port, 
                           O(5) => out_imux_1_5_port, O(4) => out_imux_1_4_port
                           , O(3) => out_imux_1_3_port, O(2) => 
                           out_imux_1_2_port, O(1) => out_imux_1_1_port, O(0) 
                           => out_imux_1_0_port);
   ADD64_i_1 : RCA_GENERIC_NBIT16_0 port map( A(15) => out_imux_0_15_port, 
                           A(14) => out_imux_0_14_port, A(13) => 
                           out_imux_0_13_port, A(12) => out_imux_0_12_port, 
                           A(11) => out_imux_0_11_port, A(10) => 
                           out_imux_0_10_port, A(9) => out_imux_0_9_port, A(8) 
                           => out_imux_0_8_port, A(7) => out_imux_0_7_port, 
                           A(6) => out_imux_0_6_port, A(5) => out_imux_0_5_port
                           , A(4) => out_imux_0_4_port, A(3) => 
                           out_imux_0_3_port, A(2) => out_imux_0_2_port, A(1) 
                           => out_imux_0_1_port, A(0) => out_imux_0_0_port, 
                           B(15) => out_imux_1_15_port, B(14) => 
                           out_imux_1_14_port, B(13) => out_imux_1_13_port, 
                           B(12) => out_imux_1_12_port, B(11) => 
                           out_imux_1_11_port, B(10) => out_imux_1_10_port, 
                           B(9) => out_imux_1_9_port, B(8) => out_imux_1_8_port
                           , B(7) => out_imux_1_7_port, B(6) => 
                           out_imux_1_6_port, B(5) => out_imux_1_5_port, B(4) 
                           => out_imux_1_4_port, B(3) => out_imux_1_3_port, 
                           B(2) => out_imux_1_2_port, B(1) => out_imux_1_1_port
                           , B(0) => out_imux_1_0_port, Ci => X_Logic0_port, 
                           S(15) => predigest_product_1_15_port, S(14) => 
                           predigest_product_1_14_port, S(13) => 
                           predigest_product_1_13_port, S(12) => 
                           predigest_product_1_12_port, S(11) => 
                           predigest_product_1_11_port, S(10) => 
                           predigest_product_1_10_port, S(9) => 
                           predigest_product_1_9_port, S(8) => 
                           predigest_product_1_8_port, S(7) => 
                           predigest_product_1_7_port, S(6) => 
                           predigest_product_1_6_port, S(5) => 
                           predigest_product_1_5_port, S(4) => 
                           predigest_product_1_4_port, S(3) => 
                           predigest_product_1_3_port, S(2) => 
                           predigest_product_1_2_port, S(1) => 
                           predigest_product_1_1_port, S(0) => 
                           predigest_product_1_0_port, Co => n_1012);
   ENC_i_2 : BOOTH_ENCODER_3BIT_2 port map( B(2) => B(5), B(1) => B(4), B(0) =>
                           B(3), ENCODED(2) => muxs_encoded_signals_2_2_port, 
                           ENCODED(1) => muxs_encoded_signals_2_1_port, 
                           ENCODED(0) => muxs_encoded_signals_2_0_port);
   MUX_i_2 : MUX51_GENERIC_NBIT16_2 port map( IN0(15) => X_Logic0_port, IN0(14)
                           => X_Logic0_port, IN0(13) => X_Logic0_port, IN0(12) 
                           => X_Logic0_port, IN0(11) => X_Logic0_port, IN0(10) 
                           => X_Logic0_port, IN0(9) => X_Logic0_port, IN0(8) =>
                           X_Logic0_port, IN0(7) => X_Logic0_port, IN0(6) => 
                           X_Logic0_port, IN0(5) => X_Logic0_port, IN0(4) => 
                           X_Logic0_port, IN0(3) => X_Logic0_port, IN0(2) => 
                           X_Logic0_port, IN0(1) => X_Logic0_port, IN0(0) => 
                           X_Logic0_port, IN1(15) => A(7), IN1(14) => A(7), 
                           IN1(13) => A(7), IN1(12) => A(7), IN1(11) => A(7), 
                           IN1(10) => A(6), IN1(9) => A(5), IN1(8) => A(4), 
                           IN1(7) => A(3), IN1(6) => A(2), IN1(5) => A(1), 
                           IN1(4) => A(0), IN1(3) => X_Logic0_port, IN1(2) => 
                           X_Logic0_port, IN1(1) => X_Logic0_port, IN1(0) => 
                           X_Logic0_port, IN2(15) => negative_a_15_port, 
                           IN2(14) => negative_a_15_port, IN2(13) => 
                           negative_a_15_port, IN2(12) => negative_a_15_port, 
                           IN2(11) => negative_a_7_port, IN2(10) => 
                           negative_a_6_port, IN2(9) => negative_a_5_port, 
                           IN2(8) => negative_a_4_port, IN2(7) => 
                           negative_a_3_port, IN2(6) => negative_a_2_port, 
                           IN2(5) => negative_a_1_port, IN2(4) => A(0), IN2(3) 
                           => X_Logic0_port, IN2(2) => X_Logic0_port, IN2(1) =>
                           X_Logic0_port, IN2(0) => X_Logic0_port, IN3(15) => 
                           A(7), IN3(14) => A(7), IN3(13) => A(7), IN3(12) => 
                           A(7), IN3(11) => A(6), IN3(10) => A(5), IN3(9) => 
                           A(4), IN3(8) => A(3), IN3(7) => A(2), IN3(6) => A(1)
                           , IN3(5) => A(0), IN3(4) => X_Logic0_port, IN3(3) =>
                           X_Logic0_port, IN3(2) => X_Logic0_port, IN3(1) => 
                           X_Logic0_port, IN3(0) => X_Logic0_port, IN4(15) => 
                           negative_a_15_port, IN4(14) => negative_a_15_port, 
                           IN4(13) => negative_a_15_port, IN4(12) => 
                           negative_a_7_port, IN4(11) => negative_a_6_port, 
                           IN4(10) => negative_a_5_port, IN4(9) => 
                           negative_a_4_port, IN4(8) => negative_a_3_port, 
                           IN4(7) => negative_a_2_port, IN4(6) => 
                           negative_a_1_port, IN4(5) => A(0), IN4(4) => 
                           X_Logic0_port, IN4(3) => X_Logic0_port, IN4(2) => 
                           X_Logic0_port, IN4(1) => X_Logic0_port, IN4(0) => 
                           X_Logic0_port, S(2) => muxs_encoded_signals_2_2_port
                           , S(1) => muxs_encoded_signals_2_1_port, S(0) => 
                           muxs_encoded_signals_2_0_port, O(15) => 
                           out_imux_2_15_port, O(14) => out_imux_2_14_port, 
                           O(13) => out_imux_2_13_port, O(12) => 
                           out_imux_2_12_port, O(11) => out_imux_2_11_port, 
                           O(10) => out_imux_2_10_port, O(9) => 
                           out_imux_2_9_port, O(8) => out_imux_2_8_port, O(7) 
                           => out_imux_2_7_port, O(6) => out_imux_2_6_port, 
                           O(5) => out_imux_2_5_port, O(4) => out_imux_2_4_port
                           , O(3) => out_imux_2_3_port, O(2) => 
                           out_imux_2_2_port, O(1) => out_imux_2_1_port, O(0) 
                           => out_imux_2_0_port);
   ADD64_i_2 : RCA_GENERIC_NBIT16_2 port map( A(15) => 
                           predigest_product_1_15_port, A(14) => 
                           predigest_product_1_14_port, A(13) => 
                           predigest_product_1_13_port, A(12) => 
                           predigest_product_1_12_port, A(11) => 
                           predigest_product_1_11_port, A(10) => 
                           predigest_product_1_10_port, A(9) => 
                           predigest_product_1_9_port, A(8) => 
                           predigest_product_1_8_port, A(7) => 
                           predigest_product_1_7_port, A(6) => 
                           predigest_product_1_6_port, A(5) => 
                           predigest_product_1_5_port, A(4) => 
                           predigest_product_1_4_port, A(3) => 
                           predigest_product_1_3_port, A(2) => 
                           predigest_product_1_2_port, A(1) => 
                           predigest_product_1_1_port, A(0) => 
                           predigest_product_1_0_port, B(15) => 
                           out_imux_2_15_port, B(14) => out_imux_2_14_port, 
                           B(13) => out_imux_2_13_port, B(12) => 
                           out_imux_2_12_port, B(11) => out_imux_2_11_port, 
                           B(10) => out_imux_2_10_port, B(9) => 
                           out_imux_2_9_port, B(8) => out_imux_2_8_port, B(7) 
                           => out_imux_2_7_port, B(6) => out_imux_2_6_port, 
                           B(5) => out_imux_2_5_port, B(4) => out_imux_2_4_port
                           , B(3) => out_imux_2_3_port, B(2) => 
                           out_imux_2_2_port, B(1) => out_imux_2_1_port, B(0) 
                           => out_imux_2_0_port, Ci => X_Logic0_port, S(15) => 
                           predigest_product_2_15_port, S(14) => 
                           predigest_product_2_14_port, S(13) => 
                           predigest_product_2_13_port, S(12) => 
                           predigest_product_2_12_port, S(11) => 
                           predigest_product_2_11_port, S(10) => 
                           predigest_product_2_10_port, S(9) => 
                           predigest_product_2_9_port, S(8) => 
                           predigest_product_2_8_port, S(7) => 
                           predigest_product_2_7_port, S(6) => 
                           predigest_product_2_6_port, S(5) => 
                           predigest_product_2_5_port, S(4) => 
                           predigest_product_2_4_port, S(3) => 
                           predigest_product_2_3_port, S(2) => 
                           predigest_product_2_2_port, S(1) => 
                           predigest_product_2_1_port, S(0) => 
                           predigest_product_2_0_port, Co => n_1013);
   ENC_i_3 : BOOTH_ENCODER_3BIT_1 port map( B(2) => B(7), B(1) => B(6), B(0) =>
                           B(5), ENCODED(2) => muxs_encoded_signals_3_2_port, 
                           ENCODED(1) => muxs_encoded_signals_3_1_port, 
                           ENCODED(0) => muxs_encoded_signals_3_0_port);
   MUX_i_3 : MUX51_GENERIC_NBIT16_1 port map( IN0(15) => X_Logic0_port, IN0(14)
                           => X_Logic0_port, IN0(13) => X_Logic0_port, IN0(12) 
                           => X_Logic0_port, IN0(11) => X_Logic0_port, IN0(10) 
                           => X_Logic0_port, IN0(9) => X_Logic0_port, IN0(8) =>
                           X_Logic0_port, IN0(7) => X_Logic0_port, IN0(6) => 
                           X_Logic0_port, IN0(5) => X_Logic0_port, IN0(4) => 
                           X_Logic0_port, IN0(3) => X_Logic0_port, IN0(2) => 
                           X_Logic0_port, IN0(1) => X_Logic0_port, IN0(0) => 
                           X_Logic0_port, IN1(15) => A(7), IN1(14) => A(7), 
                           IN1(13) => A(7), IN1(12) => A(6), IN1(11) => A(5), 
                           IN1(10) => A(4), IN1(9) => A(3), IN1(8) => A(2), 
                           IN1(7) => A(1), IN1(6) => A(0), IN1(5) => 
                           X_Logic0_port, IN1(4) => X_Logic0_port, IN1(3) => 
                           X_Logic0_port, IN1(2) => X_Logic0_port, IN1(1) => 
                           X_Logic0_port, IN1(0) => X_Logic0_port, IN2(15) => 
                           negative_a_15_port, IN2(14) => negative_a_15_port, 
                           IN2(13) => negative_a_7_port, IN2(12) => 
                           negative_a_6_port, IN2(11) => negative_a_5_port, 
                           IN2(10) => negative_a_4_port, IN2(9) => 
                           negative_a_3_port, IN2(8) => negative_a_2_port, 
                           IN2(7) => negative_a_1_port, IN2(6) => A(0), IN2(5) 
                           => X_Logic0_port, IN2(4) => X_Logic0_port, IN2(3) =>
                           X_Logic0_port, IN2(2) => X_Logic0_port, IN2(1) => 
                           X_Logic0_port, IN2(0) => X_Logic0_port, IN3(15) => 
                           A(7), IN3(14) => A(7), IN3(13) => A(6), IN3(12) => 
                           A(5), IN3(11) => A(4), IN3(10) => A(3), IN3(9) => 
                           A(2), IN3(8) => A(1), IN3(7) => A(0), IN3(6) => 
                           X_Logic0_port, IN3(5) => X_Logic0_port, IN3(4) => 
                           X_Logic0_port, IN3(3) => X_Logic0_port, IN3(2) => 
                           X_Logic0_port, IN3(1) => X_Logic0_port, IN3(0) => 
                           X_Logic0_port, IN4(15) => negative_a_15_port, 
                           IN4(14) => negative_a_7_port, IN4(13) => 
                           negative_a_6_port, IN4(12) => negative_a_5_port, 
                           IN4(11) => negative_a_4_port, IN4(10) => 
                           negative_a_3_port, IN4(9) => negative_a_2_port, 
                           IN4(8) => negative_a_1_port, IN4(7) => A(0), IN4(6) 
                           => X_Logic0_port, IN4(5) => X_Logic0_port, IN4(4) =>
                           X_Logic0_port, IN4(3) => X_Logic0_port, IN4(2) => 
                           X_Logic0_port, IN4(1) => X_Logic0_port, IN4(0) => 
                           X_Logic0_port, S(2) => muxs_encoded_signals_3_2_port
                           , S(1) => muxs_encoded_signals_3_1_port, S(0) => 
                           muxs_encoded_signals_3_0_port, O(15) => 
                           out_imux_3_15_port, O(14) => out_imux_3_14_port, 
                           O(13) => out_imux_3_13_port, O(12) => 
                           out_imux_3_12_port, O(11) => out_imux_3_11_port, 
                           O(10) => out_imux_3_10_port, O(9) => 
                           out_imux_3_9_port, O(8) => out_imux_3_8_port, O(7) 
                           => out_imux_3_7_port, O(6) => out_imux_3_6_port, 
                           O(5) => out_imux_3_5_port, O(4) => out_imux_3_4_port
                           , O(3) => out_imux_3_3_port, O(2) => 
                           out_imux_3_2_port, O(1) => out_imux_3_1_port, O(0) 
                           => out_imux_3_0_port);
   ADD64_i_3 : RCA_GENERIC_NBIT16_1 port map( A(15) => 
                           predigest_product_2_15_port, A(14) => 
                           predigest_product_2_14_port, A(13) => 
                           predigest_product_2_13_port, A(12) => 
                           predigest_product_2_12_port, A(11) => 
                           predigest_product_2_11_port, A(10) => 
                           predigest_product_2_10_port, A(9) => 
                           predigest_product_2_9_port, A(8) => 
                           predigest_product_2_8_port, A(7) => 
                           predigest_product_2_7_port, A(6) => 
                           predigest_product_2_6_port, A(5) => 
                           predigest_product_2_5_port, A(4) => 
                           predigest_product_2_4_port, A(3) => 
                           predigest_product_2_3_port, A(2) => 
                           predigest_product_2_2_port, A(1) => 
                           predigest_product_2_1_port, A(0) => 
                           predigest_product_2_0_port, B(15) => 
                           out_imux_3_15_port, B(14) => out_imux_3_14_port, 
                           B(13) => out_imux_3_13_port, B(12) => 
                           out_imux_3_12_port, B(11) => out_imux_3_11_port, 
                           B(10) => out_imux_3_10_port, B(9) => 
                           out_imux_3_9_port, B(8) => out_imux_3_8_port, B(7) 
                           => out_imux_3_7_port, B(6) => out_imux_3_6_port, 
                           B(5) => out_imux_3_5_port, B(4) => out_imux_3_4_port
                           , B(3) => out_imux_3_3_port, B(2) => 
                           out_imux_3_2_port, B(1) => out_imux_3_1_port, B(0) 
                           => out_imux_3_0_port, Ci => X_Logic0_port, S(15) => 
                           P(15), S(14) => P(14), S(13) => P(13), S(12) => 
                           P(12), S(11) => P(11), S(10) => P(10), S(9) => P(9),
                           S(8) => P(8), S(7) => P(7), S(6) => P(6), S(5) => 
                           P(5), S(4) => P(4), S(3) => P(3), S(2) => P(2), S(1)
                           => P(1), S(0) => P(0), Co => n_1014);
   add_66_U1_1_1 : HA_X1 port map( A => add_66_A_1_port, B => add_66_A_0_port, 
                           CO => add_66_carry_2_port, S => negative_a_1_port);
   add_66_U1_1_2 : HA_X1 port map( A => add_66_A_2_port, B => 
                           add_66_carry_2_port, CO => add_66_carry_3_port, S =>
                           negative_a_2_port);
   add_66_U1_1_3 : HA_X1 port map( A => add_66_A_3_port, B => 
                           add_66_carry_3_port, CO => add_66_carry_4_port, S =>
                           negative_a_3_port);
   add_66_U1_1_4 : HA_X1 port map( A => add_66_A_4_port, B => 
                           add_66_carry_4_port, CO => add_66_carry_5_port, S =>
                           negative_a_4_port);
   add_66_U1_1_5 : HA_X1 port map( A => add_66_A_5_port, B => 
                           add_66_carry_5_port, CO => add_66_carry_6_port, S =>
                           negative_a_5_port);
   add_66_U1_1_6 : HA_X1 port map( A => add_66_A_6_port, B => 
                           add_66_carry_6_port, CO => add_66_carry_7_port, S =>
                           negative_a_6_port);
   U11 : NOR2_X4 port map( A1 => A(7), A2 => add_66_carry_7_port, ZN => 
                           negative_a_15_port);
   U12 : INV_X1 port map( A => n9, ZN => negative_a_7_port);
   U13 : AOI21_X1 port map( B1 => A(7), B2 => add_66_carry_7_port, A => 
                           negative_a_15_port, ZN => n9);
   U14 : INV_X1 port map( A => A(6), ZN => add_66_A_6_port);
   U15 : INV_X1 port map( A => A(5), ZN => add_66_A_5_port);
   U16 : INV_X1 port map( A => A(4), ZN => add_66_A_4_port);
   U17 : INV_X1 port map( A => A(3), ZN => add_66_A_3_port);
   U18 : INV_X1 port map( A => A(2), ZN => add_66_A_2_port);
   U19 : INV_X1 port map( A => A(1), ZN => add_66_A_1_port);
   U20 : INV_X1 port map( A => A(0), ZN => add_66_A_0_port);

end SYN_BOOTHMUL_STRUCT;
