library ieee;
use ieee.std_logic_1164.all;
use work.myTypes.all;

entity TopLevelTB is
end TopLevelTB;

architecture TBarch of TopLevelTB is

    component TopLevel is
    generic (
        ADDR_BITS : integer := 5;
        DATA_BITS : integer := 32;
        IMM_BITS : integer := 16;
        OPCODE_SIZE : integer := 6;
        FUNC_SIZE : integer := 11
        );
    port (
        CLK, RST : in std_logic;
        INSTRUCTION : in std_logic_vector(31 downto 0);
        O : out std_logic_vector(DATA_BITS-1 downto 0)
        );
    end component;
    
    constant ClockPeriod : time := 10 ns;
    
    signal CLK_s, RST_s : std_logic := '0';
    signal INSTRUCTION_s : std_logic_vector(31 downto 0);
    signal O_s : std_logic_vector(31 downto 0);
    
begin

    DUT : TopLevel 
        generic map (5, 32, 16, 6, 11)
        port map (CLK_s, RST_s, INSTRUCTION_s, O_s);
               
    clkProcess : process
    begin
        CLK_s <= not CLK_s;
        wait for ClockPeriod/2;
    end process;
    
    vectProcess : process
    begin
        RST_s <= '1';
        wait for ClockPeriod;
        RST_s <= '0';
        INSTRUCTION_s <= "01000000001000010000000000000001";
        wait for ClockPeriod;
        wait for ClockPeriod;
        wait for ClockPeriod;
        wait;
    end process;
end TBarch;