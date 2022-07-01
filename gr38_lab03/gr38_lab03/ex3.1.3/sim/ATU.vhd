library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.functions.all;

entity ATU is
  generic (M : integer := 8;            -- M : Number of global registers
           N : integer := 8;  -- N : Number of registers for IN/LOCAL/OUT
           F : integer := 8             -- F : Number of windows
           );
  -- the entity receives the CWP in input as well as the logical addresses from
  -- the external interface. It provides as output, the converted physical
  -- addresses to the phsyical register file
  port (CWP        : in  std_logic_vector(log2(2*N*F)-1 downto 0);
        ADDR_WR_i  : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        ADDR_RD1_i : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        ADDR_RD2_i : in  std_logic_vector(log2(3*N+M)-1 downto 0);
        ADDR_WR_o  : out std_logic_vector(log2(2*N*F+M)-1 downto 0);
        ADDR_RD1_o : out std_logic_vector(log2(2*N*F+M)-1 downto 0);
        ADDR_RD2_o : out std_logic_vector(log2(2*N*F+M)-1 downto 0)
        );
end ATU;

architecture beh of ATU is
  signal temp_allones : std_logic_vector(log2(3*N+M)-1 - log2(N) downto 0);
begin
  temp_allones <= (others => '1');  -- used for the comparison in the if statement

  -- there are 3 processes, they all do the same thing and therefore they are
  -- redundant but they operate on the different addresses in input. Therefore,
  -- there will be a process for write address and two processes for the two
  -- read addresses in input
  WR_generate_addr : process (ADDR_WR_i, CWP)
  begin
    -- this if statement checks if the upper bits of the logical address are
    -- all '1's. If so, it means we are accessing the global registers and
    -- therefore the address is manipulated by adding a '1' to the MSB and all
    -- '0's except the lower part of the address that it is used to move in the
    -- global registers section.
    if (temp_allones = ADDR_WR_i(log2(3*N+M)-1 downto log2(N))) then
      ADDR_WR_o (log2(2*N*F+M)-1 downto log2(M)) <= (others => '0');
      ADDR_WR_o(log2(2*N*F+M)-1)                 <= '1';
      ADDR_WR_o(log2(M)-1 downto 0)              <= ADDR_WR_i(log2(M)-1 downto 0);
    else
      -- if we are not accessing the global registers, then we only need to
      -- place a '0' at the MSB of the address (this allows us to access the
      -- lower half of the physical register file) and then we concatenate with
      -- the sum of the CWP + the logical address. This approach, although
      -- slowered by the sum, ensures more flexibility in the parametrization
      -- choices for the whole windowingRF.
      ADDR_WR_o <= '0'&std_logic_vector(unsigned(CWP) + unsigned(ADDR_WR_i));
    end if;
  end process WR_generate_addr;

  RD1_generate_addr : process (ADDR_RD1_i, CWP)
  begin
    if (temp_allones = ADDR_RD1_i(log2(3*N+M)-1 downto log2(N))) then
      ADDR_RD1_o (log2(2*N*F+M)-1 downto log2(M)) <= (others => '0');
      ADDR_RD1_o(log2(2*N*F+M)-1)                 <= '1';
      ADDR_RD1_o(log2(M)-1 downto 0)              <= ADDR_RD1_i(log2(M)-1 downto 0);
    else
      ADDR_RD1_o <= '0'&std_logic_vector(unsigned(CWP) + unsigned(ADDR_RD1_i));
    end if;
  end process RD1_generate_addr;

  RD2_generate_addr : process (ADDR_RD2_i, CWP)
  begin
    if (temp_allones = ADDR_RD2_i(log2(3*N+M)-1 downto log2(N)))then
      ADDR_RD2_o (log2(2*N*F+M)-1 downto log2(M)) <= (others => '0');
      ADDR_RD2_o(log2(2*N*F+M)-1)                 <= '1';
      ADDR_RD2_o(log2(M)-1 downto 0)              <= ADDR_RD2_i(log2(M)-1 downto 0);
    else
      ADDR_RD2_o <= '0'&std_logic_vector(unsigned(CWP) + unsigned(ADDR_RD2_i));
    end if;
  end process RD2_generate_addr;


end beh;
