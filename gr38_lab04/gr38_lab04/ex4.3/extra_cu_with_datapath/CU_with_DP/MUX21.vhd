library ieee;
use ieee.std_logic_1164.all;

entity MUX is
generic (
    DATA_BITS : integer := 32
    );
port (
    IN0, IN1 : in std_logic_vector(DATA_BITS-1 downto 0);
    S : in std_logic;
    O : out std_logic_vector(DATA_BITS-1 downto 0)
    );
end MUX;

architecture beh of MUX is
begin
    process (IN0, IN1, S)
    begin
        if (S = '0') then
            O <= IN0;
        else
            O <= IN1;
        end if;
    end process;
end beh;