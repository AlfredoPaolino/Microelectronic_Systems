library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
generic (
    DATA_BITS : integer :=  32
    );
port (
    OP1, OP2 : in std_logic_vector(DATA_BITS-1 downto 0);
    S1, S2 : in std_logic;
    RES : out std_logic_vector(DATA_BITS-1 downto 0)
    );
end ALU;

architecture beh of ALU is
begin
    process (OP1, OP2, S1, S2)
    begin
        if (S1 = '0' and S2 = '0') then
            RES <= std_logic_vector(unsigned(OP1) + unsigned(OP2));
        elsif (S1 = '0' and S2 = '1') then
            RES <= std_logic_vector(unsigned(OP1) - unsigned(OP2));
        elsif (S1 = '1' and S2 = '0') then
            RES <= OP1 and OP2;
        else
            RES <= OP1 or OP2;
        end if;
    end process;
end beh;