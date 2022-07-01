
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_ACC_N4 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_ACC_N4;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity FD_3 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_3;

architecture SYN_FD_ASYNC_BEHAV of FD_3 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_port, n1, n_1000 : std_logic;

begin
   Q <= Q_port;
   
   Q_reg : DFFR_X1 port map( D => n1, CK => CK, RN => RESET_n, Q => Q_port, QN 
                           => n_1000);
   U2 : MUX2_X1 port map( A => D, B => Q_port, S => ENABLE_n, Z => n1);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity FD_2 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_2;

architecture SYN_FD_ASYNC_BEHAV of FD_2 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_port, n1, n_1001 : std_logic;

begin
   Q <= Q_port;
   
   Q_reg : DFFR_X1 port map( D => n1, CK => CK, RN => RESET_n, Q => Q_port, QN 
                           => n_1001);
   U2 : MUX2_X1 port map( A => D, B => Q_port, S => ENABLE_n, Z => n1);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity FD_1 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_1;

architecture SYN_FD_ASYNC_BEHAV of FD_1 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_port, n1, n_1002 : std_logic;

begin
   Q <= Q_port;
   
   Q_reg : DFFR_X1 port map( D => n1, CK => CK, RN => RESET_n, Q => Q_port, QN 
                           => n_1002);
   U2 : MUX2_X1 port map( A => D, B => Q_port, S => ENABLE_n, Z => n1);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

entity FD_0 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_0;

architecture SYN_FD_ASYNC_BEHAV of FD_0 is

   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_port, n4, n_1003 : std_logic;

begin
   Q <= Q_port;
   
   Q_reg : DFFR_X1 port map( D => n4, CK => CK, RN => RESET_n, Q => Q_port, QN 
                           => n_1003);
   U2 : MUX2_X1 port map( A => D, B => Q_port, S => ENABLE_n, Z => n4);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

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

use work.CONV_PACK_ACC_N4.all;

entity REGISTER_GENERIC_N4 is

   port( CK, RESET_n, ACC_ENABLE_n : in std_logic;  DATA_IN : in 
         std_logic_vector (3 downto 0);  DATA_OUT : out std_logic_vector (3 
         downto 0));

end REGISTER_GENERIC_N4;

architecture SYN_REG_GEN_STRUCT_SYNC of REGISTER_GENERIC_N4 is

   component FD_1
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_2
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_3
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_0
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;

begin
   
   FD_i_3 : FD_0 port map( D => DATA_IN(3), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(3));
   FD_i_2 : FD_3 port map( D => DATA_IN(2), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(2));
   FD_i_1 : FD_2 port map( D => DATA_IN(1), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(1));
   FD_i_0 : FD_1 port map( D => DATA_IN(0), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(0));

end SYN_REG_GEN_STRUCT_SYNC;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity RCA_GENERIC_NBIT4 is

   port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : out 
         std_logic_vector (3 downto 0);  Co : out std_logic);

end RCA_GENERIC_NBIT4;

architecture SYN_BEHAVIORAL of RCA_GENERIC_NBIT4 is

   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal add_55_carry_2_port, add_55_carry_3_port, n1 : std_logic;

begin
   
   add_55_U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => n1, CO => 
                           add_55_carry_2_port, S => S(1));
   add_55_U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => 
                           add_55_carry_2_port, CO => add_55_carry_3_port, S =>
                           S(2));
   add_55_U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => 
                           add_55_carry_3_port, CO => Co, S => S(3));
   U1 : AND2_X1 port map( A1 => B(0), A2 => A(0), ZN => n1);
   U2 : XOR2_X1 port map( A => B(0), B => A(0), Z => S(0));

end SYN_BEHAVIORAL;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity MUX21_GENERIC_NBIT4 is

   port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : out
         std_logic_vector (3 downto 0));

end MUX21_GENERIC_NBIT4;

architecture SYN_STRUCT of MUX21_GENERIC_NBIT4 is

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

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity ACC_N4 is

   port( A, B : in std_logic_vector (3 downto 0);  CLK, RST_n, ACCUMULATE, 
         ACC_EN_n : in std_logic;  Y : out std_logic_vector (3 downto 0));

end ACC_N4;

architecture SYN_ACC_STRUCTURAL of ACC_N4 is

   component REGISTER_GENERIC_N4
      port( CK, RESET_n, ACC_ENABLE_n : in std_logic;  DATA_IN : in 
            std_logic_vector (3 downto 0);  DATA_OUT : out std_logic_vector (3 
            downto 0));
   end component;
   
   component RCA_GENERIC_NBIT4
      port( A, B : in std_logic_vector (3 downto 0);  Ci : in std_logic;  S : 
            out std_logic_vector (3 downto 0);  Co : out std_logic);
   end component;
   
   component MUX21_GENERIC_NBIT4
      port( A, B : in std_logic_vector (3 downto 0);  SEL : in std_logic;  Y : 
            out std_logic_vector (3 downto 0));
   end component;
   
   signal X_Logic0_port, Y_3_port, Y_2_port, Y_1_port, Y_0_port, OUT_MUX_3_port
      , OUT_MUX_2_port, OUT_MUX_1_port, OUT_MUX_0_port, OUT_ADD_3_port, 
      OUT_ADD_2_port, OUT_ADD_1_port, OUT_ADD_0_port, n_1004 : std_logic;

begin
   Y <= ( Y_3_port, Y_2_port, Y_1_port, Y_0_port );
   
   X_Logic0_port <= '0';
   UMUX21 : MUX21_GENERIC_NBIT4 port map( A(3) => B(3), A(2) => B(2), A(1) => 
                           B(1), A(0) => B(0), B(3) => Y_3_port, B(2) => 
                           Y_2_port, B(1) => Y_1_port, B(0) => Y_0_port, SEL =>
                           ACCUMULATE, Y(3) => OUT_MUX_3_port, Y(2) => 
                           OUT_MUX_2_port, Y(1) => OUT_MUX_1_port, Y(0) => 
                           OUT_MUX_0_port);
   UADDER : RCA_GENERIC_NBIT4 port map( A(3) => A(3), A(2) => A(2), A(1) => 
                           A(1), A(0) => A(0), B(3) => OUT_MUX_3_port, B(2) => 
                           OUT_MUX_2_port, B(1) => OUT_MUX_1_port, B(0) => 
                           OUT_MUX_0_port, Ci => X_Logic0_port, S(3) => 
                           OUT_ADD_3_port, S(2) => OUT_ADD_2_port, S(1) => 
                           OUT_ADD_1_port, S(0) => OUT_ADD_0_port, Co => n_1004
                           );
   UREG : REGISTER_GENERIC_N4 port map( CK => CLK, RESET_n => RST_n, 
                           ACC_ENABLE_n => ACC_EN_n, DATA_IN(3) => 
                           OUT_ADD_3_port, DATA_IN(2) => OUT_ADD_2_port, 
                           DATA_IN(1) => OUT_ADD_1_port, DATA_IN(0) => 
                           OUT_ADD_0_port, DATA_OUT(3) => Y_3_port, DATA_OUT(2)
                           => Y_2_port, DATA_OUT(1) => Y_1_port, DATA_OUT(0) =>
                           Y_0_port);

end SYN_ACC_STRUCTURAL;
