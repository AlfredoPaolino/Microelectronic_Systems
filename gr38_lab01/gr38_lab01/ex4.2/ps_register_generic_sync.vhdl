
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_REGISTER_GENERIC_N4 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_REGISTER_GENERIC_N4;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4.all;

entity FD_3 is

   port( D, CK, RESET_n : in std_logic;  Q : out std_logic);

end FD_3;

architecture SYN_FD_ASYNC_BEHAV of FD_3 is

   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n_1000 : std_logic;

begin
   
   Q_reg : DFFR_X1 port map( D => D, CK => CK, RN => RESET_n, Q => Q, QN => 
                           n_1000);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4.all;

entity FD_2 is

   port( D, CK, RESET_n : in std_logic;  Q : out std_logic);

end FD_2;

architecture SYN_FD_ASYNC_BEHAV of FD_2 is

   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n_1001 : std_logic;

begin
   
   Q_reg : DFFR_X1 port map( D => D, CK => CK, RN => RESET_n, Q => Q, QN => 
                           n_1001);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4.all;

entity FD_1 is

   port( D, CK, RESET_n : in std_logic;  Q : out std_logic);

end FD_1;

architecture SYN_FD_ASYNC_BEHAV of FD_1 is

   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n_1002 : std_logic;

begin
   
   Q_reg : DFFR_X1 port map( D => D, CK => CK, RN => RESET_n, Q => Q, QN => 
                           n_1002);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4.all;

entity FD_0 is

   port( D, CK, RESET_n : in std_logic;  Q : out std_logic);

end FD_0;

architecture SYN_FD_ASYNC_BEHAV of FD_0 is

   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n_1003 : std_logic;

begin
   
   Q_reg : DFFR_X1 port map( D => D, CK => CK, RN => RESET_n, Q => Q, QN => 
                           n_1003);

end SYN_FD_ASYNC_BEHAV;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_REGISTER_GENERIC_N4.all;

entity REGISTER_GENERIC_N4 is

   port( CK, RESET_n, ACC_ENABLE_n : in std_logic;  DATA_IN : in 
         std_logic_vector (3 downto 0);  DATA_OUT : out std_logic_vector (3 
         downto 0));

end REGISTER_GENERIC_N4;

architecture SYN_REG_GEN_STRUCT_SYNC of REGISTER_GENERIC_N4 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component FD_1
      port( D, CK, RESET_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_2
      port( D, CK, RESET_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_3
      port( D, CK, RESET_n : in std_logic;  Q : out std_logic);
   end component;
   
   component FD_0
      port( D, CK, RESET_n : in std_logic;  Q : out std_logic);
   end component;
   
   signal CK_EN_SYNC_n, n2 : std_logic;

begin
   
   FD_i_3 : FD_0 port map( D => DATA_IN(3), CK => CK_EN_SYNC_n, RESET_n => 
                           RESET_n, Q => DATA_OUT(3));
   FD_i_2 : FD_3 port map( D => DATA_IN(2), CK => CK_EN_SYNC_n, RESET_n => 
                           RESET_n, Q => DATA_OUT(2));
   FD_i_1 : FD_2 port map( D => DATA_IN(1), CK => CK_EN_SYNC_n, RESET_n => 
                           RESET_n, Q => DATA_OUT(1));
   FD_i_0 : FD_1 port map( D => DATA_IN(0), CK => CK_EN_SYNC_n, RESET_n => 
                           RESET_n, Q => DATA_OUT(0));
   U3 : AOI21_X1 port map( B1 => RESET_n, B2 => ACC_ENABLE_n, A => n2, ZN => 
                           CK_EN_SYNC_n);
   U4 : INV_X1 port map( A => CK, ZN => n2);

end SYN_REG_GEN_STRUCT_SYNC;
