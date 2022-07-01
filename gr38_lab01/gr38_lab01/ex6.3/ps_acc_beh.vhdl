
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_ACC_N4 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_ACC_N4;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ACC_N4.all;

entity ACC_N4 is

   port( A, B : in std_logic_vector (3 downto 0);  CLK, RST_n, ACCUMULATE, 
         ACC_EN_n : in std_logic;  Y : out std_logic_vector (3 downto 0));

end ACC_N4;

architecture SYN_ACC_BEHAVIORAL of ACC_N4 is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component MUX2_X1
      port( A, B, S : in std_logic;  Z : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DLH_X1
      port( G, D : in std_logic;  Q : out std_logic);
   end component;
   
   signal Y_3_port, Y_2_port, Y_1_port, Y_0_port, NEXT_REGISTER_3_port, 
      NEXT_REGISTER_2_port, NEXT_REGISTER_1_port, NEXT_REGISTER_0_port, N4, N5,
      N6, N7, n34, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, 
      n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63
      , n64, n65, n_1000, n_1001 : std_logic;

begin
   Y <= ( Y_3_port, Y_2_port, Y_1_port, Y_0_port );
   
   NEXT_REGISTER_reg_1_inst : DLH_X1 port map( G => RST_n, D => N5, Q => 
                           NEXT_REGISTER_1_port);
   NEXT_REGISTER_reg_2_inst : DLH_X1 port map( G => RST_n, D => N6, Q => 
                           NEXT_REGISTER_2_port);
   NEXT_REGISTER_reg_3_inst : DLH_X1 port map( G => RST_n, D => N7, Q => 
                           NEXT_REGISTER_3_port);
   NEXT_REGISTER_reg_0_inst : DLH_X1 port map( G => RST_n, D => N4, Q => 
                           NEXT_REGISTER_0_port);
   CURR_REGISTER_reg_0_inst : DFFR_X1 port map( D => n41, CK => CLK, RN => 
                           RST_n, Q => Y_0_port, QN => n37);
   CURR_REGISTER_reg_1_inst : DFFR_X1 port map( D => n40, CK => CLK, RN => 
                           RST_n, Q => Y_1_port, QN => n_1000);
   CURR_REGISTER_reg_2_inst : DFFR_X1 port map( D => n39, CK => CLK, RN => 
                           RST_n, Q => Y_2_port, QN => n_1001);
   CURR_REGISTER_reg_3_inst : DFFR_X1 port map( D => n38, CK => CLK, RN => 
                           RST_n, Q => Y_3_port, QN => n34);
   U41 : MUX2_X1 port map( A => NEXT_REGISTER_0_port, B => Y_0_port, S => 
                           ACC_EN_n, Z => n41);
   U42 : MUX2_X1 port map( A => NEXT_REGISTER_1_port, B => Y_1_port, S => 
                           ACC_EN_n, Z => n40);
   U43 : MUX2_X1 port map( A => NEXT_REGISTER_2_port, B => Y_2_port, S => 
                           ACC_EN_n, Z => n39);
   U44 : MUX2_X1 port map( A => NEXT_REGISTER_3_port, B => Y_3_port, S => 
                           ACC_EN_n, Z => n38);
   U45 : OAI22_X1 port map( A1 => ACC_EN_n, A2 => n42, B1 => n34, B2 => n43, ZN
                           => N7);
   U46 : AOI21_X1 port map( B1 => ACCUMULATE, B2 => n44, A => ACC_EN_n, ZN => 
                           n43);
   U47 : MUX2_X1 port map( A => n45, B => n46, S => n47, Z => n42);
   U48 : XOR2_X1 port map( A => B(3), B => n44, Z => n46);
   U49 : OR2_X1 port map( A1 => Y_3_port, A2 => n44, ZN => n45);
   U50 : XOR2_X1 port map( A => n48, B => A(3), Z => n44);
   U51 : AOI21_X1 port map( B1 => n49, B2 => n50, A => n51, ZN => n48);
   U52 : INV_X1 port map( A => n52, ZN => n51);
   U53 : OAI21_X1 port map( B1 => n50, B2 => n49, A => A(2), ZN => n52);
   U54 : MUX2_X1 port map( A => n53, B => Y_2_port, S => ACC_EN_n, Z => N6);
   U55 : XNOR2_X1 port map( A => n50, B => n54, ZN => n53);
   U56 : XNOR2_X1 port map( A => A(2), B => n49, ZN => n54);
   U57 : OAI21_X1 port map( B1 => n55, B2 => n56, A => n57, ZN => n49);
   U58 : OAI21_X1 port map( B1 => n58, B2 => n59, A => A(1), ZN => n57);
   U59 : INV_X1 port map( A => n59, ZN => n55);
   U60 : MUX2_X1 port map( A => Y_2_port, B => B(2), S => n47, Z => n50);
   U61 : MUX2_X1 port map( A => n60, B => Y_1_port, S => ACC_EN_n, Z => N5);
   U62 : XOR2_X1 port map( A => n59, B => n61, Z => n60);
   U63 : XOR2_X1 port map( A => A(1), B => n58, Z => n61);
   U64 : MUX2_X1 port map( A => Y_1_port, B => B(1), S => n47, Z => n59);
   U65 : OAI21_X1 port map( B1 => n37, B2 => n62, A => n63, ZN => N4);
   U66 : OR3_X1 port map( A1 => n58, A2 => ACC_EN_n, A3 => n64, ZN => n63);
   U67 : AOI21_X1 port map( B1 => n47, B2 => B(0), A => A(0), ZN => n64);
   U68 : INV_X1 port map( A => n56, ZN => n58);
   U69 : AOI21_X1 port map( B1 => ACCUMULATE, B2 => n56, A => ACC_EN_n, ZN => 
                           n62);
   U70 : NAND2_X1 port map( A1 => n65, A2 => A(0), ZN => n56);
   U71 : MUX2_X1 port map( A => Y_0_port, B => B(0), S => n47, Z => n65);
   U72 : INV_X1 port map( A => ACCUMULATE, ZN => n47);

end SYN_ACC_BEHAVIORAL;
