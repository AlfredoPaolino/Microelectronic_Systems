
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_REGISTER_GENERIC_N4_1 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_REGISTER_GENERIC_N4_1;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4_1.all;

entity FD_7 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_7;

architecture SYN_FD_ASYNC_BEHAV of FD_7 is

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

use work.CONV_PACK_REGISTER_GENERIC_N4_1.all;

entity FD_6 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_6;

architecture SYN_FD_ASYNC_BEHAV of FD_6 is

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

use work.CONV_PACK_REGISTER_GENERIC_N4_1.all;

entity FD_5 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_5;

architecture SYN_FD_ASYNC_BEHAV of FD_5 is

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

use work.CONV_PACK_REGISTER_GENERIC_N4_1.all;

entity FD_4 is

   port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);

end FD_4;

architecture SYN_FD_ASYNC_BEHAV of FD_4 is

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

use work.CONV_PACK_REGISTER_GENERIC_N4_1.all;

entity REGISTER_GENERIC_N4_1 is

   port( CK, RESET_n, ACC_ENABLE_n : in std_logic;  DATA_IN : in 
         std_logic_vector (3 downto 0);  DATA_OUT : out std_logic_vector (3 
         downto 0));

end REGISTER_GENERIC_N4_1;

architecture SYN_REG_GEN_STRUCT_ASYNC of REGISTER_GENERIC_N4_1 is

   component FD_5
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_6
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_7
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_4
      port( D, CK, RESET_n, ENABLE_n : in std_logic;  Q : out std_logic);
   end component;

begin
   
   FD_i_3 : FD_4 port map( D => DATA_IN(3), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(3));
   FD_i_2 : FD_7 port map( D => DATA_IN(2), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(2));
   FD_i_1 : FD_6 port map( D => DATA_IN(1), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(1));
   FD_i_0 : FD_5 port map( D => DATA_IN(0), CK => CK, RESET_n => RESET_n, 
                           ENABLE_n => ACC_ENABLE_n, Q => DATA_OUT(0));

end SYN_REG_GEN_STRUCT_ASYNC;
