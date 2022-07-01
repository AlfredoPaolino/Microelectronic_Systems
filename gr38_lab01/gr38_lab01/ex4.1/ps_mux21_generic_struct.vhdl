
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_MUX21_GENERIC_NBIT4_1 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_MUX21_GENERIC_NBIT4_1;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_11 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_11;

architecture SYN_ARCH2 of ND2_11 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_10 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_10;

architecture SYN_ARCH2 of ND2_10 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_9 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_9;

architecture SYN_ARCH2 of ND2_9 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_8 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_8;

architecture SYN_ARCH2 of ND2_8 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_7 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_7;

architecture SYN_ARCH2 of ND2_7 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_6 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_6;

architecture SYN_ARCH2 of ND2_6 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_5 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_5;

architecture SYN_ARCH2 of ND2_5 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_4 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_4;

architecture SYN_ARCH2 of ND2_4 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_3 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_3;

architecture SYN_ARCH2 of ND2_3 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_2 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_2;

architecture SYN_ARCH2 of ND2_2 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_1 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_1;

architecture SYN_ARCH2 of ND2_1 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity ND2_0 is

   port( A, B : in std_logic;  Y : out std_logic);

end ND2_0;

architecture SYN_ARCH2 of ND2_0 is

   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : NAND2_X1 port map( A1 => B, A2 => A, ZN => Y);

end SYN_ARCH2;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity IV is

   port( A : in std_logic;  Y : out std_logic);

end IV;

architecture SYN_BEHAVIORAL of IV is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;

begin
   
   U1 : INV_X1 port map( A => A, ZN => Y);

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_MUX21_GENERIC_NBIT4_1.all;

entity MUX21_GENERIC_NBIT4_1 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_GENERIC_NBIT4_1;

architecture SYN_STRUCT of MUX21_GENERIC_NBIT4_1 is

   component ND2_1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_3
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_4
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_5
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_6
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_7
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_8
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_9
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_10
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_11
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ND2_0
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component IV
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   signal S_INV, NAND_OUT_A_3_port, NAND_OUT_A_2_port, NAND_OUT_A_1_port, 
      NAND_OUT_A_0_port, NAND_OUT_B_3_port, NAND_OUT_B_2_port, 
      NAND_OUT_B_1_port, NAND_OUT_B_0_port : std_logic;

begin
   
   INV : IV port map( A => SEL, Y => S_INV);
   A_NAND_i_0 : ND2_0 port map( A => SEL, B => B(0), Y => NAND_OUT_A_0_port);
   B_NAND_i_0 : ND2_11 port map( A => S_INV, B => A(0), Y => NAND_OUT_B_0_port)
                           ;
   NAND_OUT_i_0 : ND2_10 port map( A => NAND_OUT_A_0_port, B => 
                           NAND_OUT_B_0_port, Y => Y(0));
   A_NAND_i_1 : ND2_9 port map( A => SEL, B => B(1), Y => NAND_OUT_A_1_port);
   B_NAND_i_1 : ND2_8 port map( A => S_INV, B => A(1), Y => NAND_OUT_B_1_port);
   NAND_OUT_i_1 : ND2_7 port map( A => NAND_OUT_A_1_port, B => 
                           NAND_OUT_B_1_port, Y => Y(1));
   A_NAND_i_2 : ND2_6 port map( A => SEL, B => B(2), Y => NAND_OUT_A_2_port);
   B_NAND_i_2 : ND2_5 port map( A => S_INV, B => A(2), Y => NAND_OUT_B_2_port);
   NAND_OUT_i_2 : ND2_4 port map( A => NAND_OUT_A_2_port, B => 
                           NAND_OUT_B_2_port, Y => Y(2));
   A_NAND_i_3 : ND2_3 port map( A => SEL, B => B(3), Y => NAND_OUT_A_3_port);
   B_NAND_i_3 : ND2_2 port map( A => S_INV, B => A(3), Y => NAND_OUT_B_3_port);
   NAND_OUT_i_3 : ND2_1 port map( A => NAND_OUT_A_3_port, B => 
                           NAND_OUT_B_3_port, Y => Y(3));

end SYN_STRUCT;
