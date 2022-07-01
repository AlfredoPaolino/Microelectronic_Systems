
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_SIPISOALU is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_SIPISOALU;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_SIPISOALU.all;

entity sipisoAluControl is

   port( clk, rst, strobeA, strobeB : in std_logic;  shiftA, loadB, loadC, 
         shiftC, startC : out std_logic);

end sipisoAluControl;

architecture SYN_FSM_OPC of sipisoAluControl is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR4_X1
      port( A1, A2, A3, A4 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI33_X1
      port( A1, A2, A3, B1, B2, B3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X2
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal NEXT_STATE_4_port, NEXT_STATE_2_port, NEXT_STATE_1_port, 
      NEXT_STATE_0_port, net8004, net8005, net8010, net8025, net8029, n398, n1,
      n2, n3, n4, loadB_port, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, 
      n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45
      , n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, startC_port, n_1000 :
      std_logic;

begin
   loadB <= loadB_port;
   startC <= startC_port;
   
   CURRENT_STATE_reg_2_inst : DFFR_X2 port map( D => NEXT_STATE_2_port, CK => 
                           clk, RN => n1, Q => net8025, QN => n_1000);
   CURRENT_STATE_reg_3_inst : DFFR_X2 port map( D => n398, CK => clk, RN => n1,
                           Q => n11, QN => net8010);
   CURRENT_STATE_reg_0_inst : DFFR_X2 port map( D => NEXT_STATE_0_port, CK => 
                           clk, RN => n1, Q => n14, QN => net8029);
   CURRENT_STATE_reg_1_inst : DFFR_X2 port map( D => NEXT_STATE_1_port, CK => 
                           clk, RN => n1, Q => net8005, QN => n15);
   CURRENT_STATE_reg_4_inst : DFFR_X2 port map( D => NEXT_STATE_4_port, CK => 
                           clk, RN => n1, Q => net8004, QN => n16);
   U19 : NAND2_X1 port map( A1 => n17, A2 => n18, ZN => n398);
   U20 : NOR2_X1 port map( A1 => startC_port, A2 => n19, ZN => n18);
   U21 : NOR3_X1 port map( A1 => n9, A2 => net8029, A3 => net8010, ZN => n19);
   U22 : AOI22_X1 port map( A1 => n20, A2 => n21, B1 => n22, B2 => n23, ZN => 
                           n17);
   U23 : OAI21_X1 port map( B1 => n10, B2 => n14, A => n24, ZN => n20);
   U24 : NOR2_X1 port map( A1 => net8029, A2 => n25, ZN => NEXT_STATE_4_port);
   U25 : NAND2_X1 port map( A1 => n26, A2 => n27, ZN => NEXT_STATE_2_port);
   U26 : NOR2_X1 port map( A1 => startC_port, A2 => n28, ZN => n27);
   U27 : NOR4_X1 port map( A1 => net8029, A2 => n2, A3 => n15, A4 => n9, ZN => 
                           n28);
   U28 : AOI22_X1 port map( A1 => n6, A2 => n30, B1 => n3, B2 => n31, ZN => n26
                           );
   U29 : OAI21_X1 port map( B1 => net8010, B2 => n13, A => n32, ZN => n30);
   U30 : OR2_X1 port map( A1 => n33, A2 => n34, ZN => n32);
   U31 : OR2_X1 port map( A1 => n35, A2 => n36, ZN => NEXT_STATE_1_port);
   U32 : OAI21_X1 port map( B1 => n37, B2 => n38, A => n7, ZN => n36);
   U33 : NOR4_X1 port map( A1 => net8029, A2 => net8010, A3 => net8005, A4 => 
                           n39, ZN => startC_port);
   U34 : AOI22_X1 port map( A1 => n40, A2 => n41, B1 => n23, B2 => n21, ZN => 
                           n38);
   U35 : NOR2_X1 port map( A1 => n34, A2 => n11, ZN => n40);
   U36 : AOI21_X1 port map( B1 => n15, B2 => n14, A => n22, ZN => n37);
   U37 : AOI21_X1 port map( B1 => n42, B2 => n43, A => n21, ZN => n35);
   U38 : OAI21_X1 port map( B1 => n22, B2 => net8010, A => n6, ZN => n43);
   U39 : NAND2_X1 port map( A1 => n44, A2 => n45, ZN => NEXT_STATE_0_port);
   U40 : NOR2_X1 port map( A1 => n46, A2 => n47, ZN => n45);
   U41 : OAI33_X1 port map( A1 => n39, A2 => n3, A3 => n33, B1 => n21, B2 => 
                           n22, B3 => n48, ZN => n47);
   U42 : NOR2_X1 port map( A1 => n49, A2 => loadB_port, ZN => n48);
   U43 : NOR3_X1 port map( A1 => n14, A2 => net8025, A3 => n11, ZN => n49);
   U44 : AOI21_X1 port map( B1 => n15, B2 => net8010, A => net8029, ZN => n33);
   U45 : AOI21_X1 port map( B1 => n13, B2 => n29, A => n9, ZN => n46);
   U46 : OAI21_X1 port map( B1 => n34, B2 => n11, A => n50, ZN => n29);
   U47 : NAND2_X1 port map( A1 => n21, A2 => n11, ZN => n50);
   U48 : NAND2_X1 port map( A1 => strobeB, A2 => n4, ZN => n21);
   U49 : AOI22_X1 port map( A1 => n34, A2 => n31, B1 => n22, B2 => n23, ZN => 
                           n44);
   U50 : NOR2_X1 port map( A1 => net8004, A2 => net8010, ZN => n23);
   U51 : NOR2_X1 port map( A1 => n14, A2 => n15, ZN => n22);
   U52 : NAND2_X1 port map( A1 => n24, A2 => n42, ZN => n31);
   U53 : NAND2_X1 port map( A1 => n51, A2 => n52, ZN => n42);
   U54 : OAI21_X1 port map( B1 => net8025, B2 => n11, A => net8004, ZN => n52);
   U55 : NAND2_X1 port map( A1 => n53, A2 => net8010, ZN => n24);
   U56 : NOR2_X1 port map( A1 => n39, A2 => n15, ZN => n53);
   U57 : NOR2_X1 port map( A1 => n4, A2 => strobeB, ZN => n34);
   U58 : NAND2_X1 port map( A1 => n8, A2 => n25, ZN => shiftC);
   U59 : NAND2_X1 port map( A1 => n54, A2 => net8005, ZN => n25);
   U60 : NOR2_X1 port map( A1 => net8010, A2 => n39, ZN => n54);
   U61 : NAND2_X1 port map( A1 => net8025, A2 => n16, ZN => n39);
   U62 : NOR4_X1 port map( A1 => net8025, A2 => n11, A3 => n16, A4 => n12, ZN 
                           => n55);
   U63 : NOR2_X1 port map( A1 => n51, A2 => n9, ZN => shiftA);
   U64 : NOR2_X1 port map( A1 => net8025, A2 => net8004, ZN => n41);
   U65 : NOR2_X1 port map( A1 => n14, A2 => net8005, ZN => n51);
   U3 : INV_X1 port map( A => n22, ZN => n13);
   U4 : INV_X1 port map( A => n29, ZN => n2);
   U5 : INV_X1 port map( A => n24, ZN => loadB_port);
   U6 : INV_X1 port map( A => n23, ZN => n10);
   U7 : INV_X1 port map( A => n41, ZN => n9);
   U8 : INV_X1 port map( A => n39, ZN => n6);
   U9 : INV_X1 port map( A => n51, ZN => n12);
   U10 : INV_X1 port map( A => n21, ZN => n3);
   U11 : INV_X1 port map( A => n55, ZN => n8);
   U12 : INV_X1 port map( A => rst, ZN => n1);
   U13 : INV_X1 port map( A => strobeA, ZN => n4);
   U14 : INV_X1 port map( A => n7, ZN => loadC);
   U15 : INV_X1 port map( A => startC_port, ZN => n7);

end SYN_FSM_OPC;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_SIPISOALU.all;

entity SIPISOALU is

   port( CLK, RESET, STARTA, A, LOADB : in std_logic;  B : in std_logic_vector 
         (3 downto 0);  STARTC, C : out std_logic);

end SIPISOALU;

architecture SYN_A of SIPISOALU is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component OR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component XNOR2_X1
      port( A, B : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X2
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component sipisoAluControl
      port( clk, rst, strobeA, strobeB : in std_logic;  shiftA, loadB, loadC, 
            shiftC, startC : out std_logic);
   end component;
   
   signal EA, LDB, LDC, SHIFTC, n31, n39, n40, n41, n42, n43, n44, n46, n48, 
      n49, n50, n51, n73, n74, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89
      , n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, 
      n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, 
      n115, n116, n117, n118, n119, n120, n121, n122, n_1001, n_1002, n_1003, 
      n_1004 : std_logic;

begin
   
   control : sipisoAluControl port map( clk => CLK, rst => RESET, strobeA => 
                           STARTA, strobeB => LOADB, shiftA => EA, loadB => LDB
                           , loadC => LDC, shiftC => SHIFTC, startC => STARTC);
   SIPO_reg_0_inst : DFFR_X2 port map( D => n46, CK => CLK, RN => n82, Q => n84
                           , QN => n90);
   SIPO_reg_1_inst : DFFR_X2 port map( D => n44, CK => CLK, RN => n82, Q => n74
                           , QN => n85);
   SIPO_reg_2_inst : DFFR_X2 port map( D => n43, CK => CLK, RN => n82, Q => 
                           n_1001, QN => n91);
   PIPO_reg_3_inst : DFFR_X2 port map( D => n42, CK => CLK, RN => n82, Q => 
                           n_1002, QN => n92);
   PIPO_reg_2_inst : DFFR_X2 port map( D => n41, CK => CLK, RN => n82, Q => n73
                           , QN => n86);
   PIPO_reg_1_inst : DFFR_X2 port map( D => n40, CK => CLK, RN => n82, Q => n87
                           , QN => n93);
   PIPO_reg_0_inst : DFFR_X2 port map( D => n39, CK => CLK, RN => n82, Q => 
                           n_1003, QN => n94);
   PISO_reg_3_inst : DFFR_X2 port map( D => n49, CK => CLK, RN => n82, Q => n95
                           , QN => n_1004);
   PISO_reg_2_inst : DFFR_X2 port map( D => n50, CK => CLK, RN => n82, Q => n96
                           , QN => n88);
   PISO_reg_1_inst : DFFR_X2 port map( D => n51, CK => CLK, RN => n82, Q => n97
                           , QN => n89);
   PISO_reg_0_inst : DFFR_X2 port map( D => n48, CK => CLK, RN => n82, Q => C, 
                           QN => n31);
   U51 : OAI21_X1 port map( B1 => n80, B2 => n89, A => n98, ZN => n51);
   U52 : AOI22_X1 port map( A1 => LDC, A2 => n99, B1 => n96, B2 => n100, ZN => 
                           n98);
   U53 : XOR2_X1 port map( A => n101, B => n102, Z => n99);
   U54 : XNOR2_X1 port map( A => n87, B => n90, ZN => n102);
   U55 : OAI21_X1 port map( B1 => n88, B2 => n80, A => n103, ZN => n50);
   U56 : AOI22_X1 port map( A1 => n95, A2 => n100, B1 => n104, B2 => LDC, ZN =>
                           n103);
   U57 : XNOR2_X1 port map( A => n105, B => n106, ZN => n104);
   U58 : XNOR2_X1 port map( A => n73, B => n74, ZN => n105);
   U59 : OAI21_X1 port map( B1 => n81, B2 => n107, A => n108, ZN => n49);
   U60 : NAND2_X1 port map( A1 => n95, A2 => n109, ZN => n108);
   U61 : XOR2_X1 port map( A => n110, B => n111, Z => n107);
   U62 : XOR2_X1 port map( A => n92, B => n91, Z => n111);
   U63 : AOI22_X1 port map( A1 => n74, A2 => n112, B1 => n73, B2 => n106, ZN =>
                           n110);
   U64 : OR2_X1 port map( A1 => n106, A2 => n73, ZN => n112);
   U65 : OAI21_X1 port map( B1 => n90, B2 => n93, A => n113, ZN => n106);
   U66 : OAI21_X1 port map( B1 => n87, B2 => n84, A => n101, ZN => n113);
   U67 : OAI21_X1 port map( B1 => n31, B2 => n80, A => n114, ZN => n48);
   U68 : AOI22_X1 port map( A1 => n97, A2 => n100, B1 => n115, B2 => LDC, ZN =>
                           n114);
   U69 : AOI21_X1 port map( B1 => n94, B2 => n83, A => n101, ZN => n115);
   U70 : NOR2_X1 port map( A1 => n83, A2 => n94, ZN => n101);
   U71 : NOR2_X1 port map( A1 => n109, A2 => LDC, ZN => n100);
   U72 : NOR2_X1 port map( A1 => LDC, A2 => SHIFTC, ZN => n109);
   U73 : OAI21_X1 port map( B1 => n90, B2 => EA, A => n116, ZN => n46);
   U74 : NAND2_X1 port map( A1 => EA, A2 => A, ZN => n116);
   U75 : OAI21_X1 port map( B1 => EA, B2 => n85, A => n117, ZN => n44);
   U76 : NAND2_X1 port map( A1 => EA, A2 => n84, ZN => n117);
   U77 : OAI21_X1 port map( B1 => n91, B2 => EA, A => n118, ZN => n43);
   U78 : NAND2_X1 port map( A1 => EA, A2 => n74, ZN => n118);
   U79 : OAI21_X1 port map( B1 => n92, B2 => LDB, A => n119, ZN => n42);
   U80 : NAND2_X1 port map( A1 => LDB, A2 => B(3), ZN => n119);
   U81 : OAI21_X1 port map( B1 => LDB, B2 => n86, A => n120, ZN => n41);
   U82 : NAND2_X1 port map( A1 => B(2), A2 => LDB, ZN => n120);
   U83 : OAI21_X1 port map( B1 => n93, B2 => LDB, A => n121, ZN => n40);
   U84 : NAND2_X1 port map( A1 => B(1), A2 => LDB, ZN => n121);
   U85 : OAI21_X1 port map( B1 => n94, B2 => LDB, A => n122, ZN => n39);
   U86 : NAND2_X1 port map( A1 => B(0), A2 => LDB, ZN => n122);
   U87 : INV_X1 port map( A => n109, ZN => n80);
   U88 : INV_X1 port map( A => LDC, ZN => n81);
   U89 : INV_X1 port map( A => RESET, ZN => n82);
   U90 : INV_X1 port map( A => A, ZN => n83);

end SYN_A;
