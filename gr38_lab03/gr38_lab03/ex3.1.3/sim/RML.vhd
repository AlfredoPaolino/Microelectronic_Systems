library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.functions.all;

entity RML is
  generic (M : integer := 8;            --number of regs in GLOBAL
           N : integer := 8;            --number of regs in IN, LOCAL, OUT
           F : integer := 8             --number of windows
           );
  port (
    CLK       : in  std_logic;
    RST       : in  std_logic;
    EN        : in  std_logic;
    CALL      : in  std_logic;
    RET       : in  std_logic;
    BASE_ADDR : out std_logic_vector(log2(2*N*F)-1 downto 0);  --used to get the address needed
    SPILL     : out std_logic;
    FILL      : out std_logic
    );
end RML;

architecture beh of RML is
  signal CWP        : std_logic_vector(log2(2*N*F)-1 downto 0);
  signal SWP        : std_logic_vector(log2(2*N*F)-1 downto 0);
  signal CANSAVE    : std_logic_vector(log2(F)-1 downto 0);
  signal CANRESTORE : std_logic_vector(log2(F)-1 downto 0);
  signal regSPILL   : std_logic;        --internal signal to permit updates
  signal regFILL    : std_logic;        --internal signal to permit updates
  constant ALLONES  : std_logic_vector(log2(2*N)-1 downto 0) := (others => '1');
begin

  SPILL <= regSPILL;                    --concurrent assignment
  FILL  <= regFILL;                     --concurrent assignment

  BASE_ADDR <= CWP when (regSPILL = '0' and regFILL = '0') else SWP;  --when BASE_ADDR==CWP we can naviagate inside the window (IN, LOCAL, OUT)
                                                                      --We use BASE_ADDR==SWP when we are updating SWP in order to spill or fill the reg pointed by SWP

  process(CLK)
  begin
    if (rising_edge(CLK)) then
      if (RST = '1') then               --reset and clear
        CWP        <= (others => '0');
        CANSAVE    <= std_logic_vector(to_unsigned(F, CANSAVE'length) - 2);  --not -1 but -2 because when writing into the last window we still need to save the first one
        CANRESTORE <= (others => '0');
        regSPILL   <= '0';
        regFILL    <= '0';
        SWP        <= (others => '0');
      elsif (EN = '1') then
        if (regSPILL = '1') then        --take care of spilling
          if (SWP(log2(2*N)-1 downto 0) = ALLONES) then  --while regSPILL is 1, the last bits of SWP indicate what register is being spilled
            --When all 0's it means the window is completely spilled and then sets regSPILL to 0
            regSPILL <= '0';
            SWP      <= std_logic_vector(unsigned(SWP) + 1);  --increments SWP for
                                                              --the last time
          -- stop reading from RF
          else
            SWP <= std_logic_vector(unsigned(SWP) + 1);  --increments SWP by 1 in order to spill every single register
          -- the MMU reads the SPILL status and correctly drives the memory
          end if;


        elsif (regFILL = '1') then

          if (unsigned(SWP(log2(2*N)-1 downto 0)) = 0) then  --while regFILL is 1, the last bits of SWP indicate what register is being filled
                                               --When all 0's it means the window is completely filland then sets regFIll to 0
            regFILL <= '0';
          else
            SWP <= std_logic_vector(unsigned(SWP) - 1);  --decrements SWP by 1 in order to fill every single register
          -- the MMU reads the FILL status and correctly drives the memory
          end if;


        else
          if (CALL = '1') then
            -- for each CALL increase CWP of 1 window
            CWP <= std_logic_vector(unsigned(CWP) + 2*N);  --2*N is the dimension of IN+LOCAL regs. So it shifts forward to the new window
            if (unsigned(CANSAVE) /= 0) then  --CANSAVE/=0 means that there are still windows completely free that do not require spilling to memory
              regSPILL   <= '0';
              CANSAVE    <= std_logic_vector(unsigned(CANSAVE) - 1);
              CANRESTORE <= std_logic_vector(unsigned(CANRESTORE) + 1);
            else
              --SWP      <= std_logic_vector(unsigned(SWP) + 1);  --increment needed here to start spilling immediately
              -- the MMU reads the SPILL status and correctly drives the memory
              regSPILL <= '1';
            end if;
          end if;
          if (RET = '1') then
            --for each RET move CWP back of 1 window
            CWP <= std_logic_vector(unsigned(CWP) - 2*N);  --2*N is the dimension of IN+LOCAL regs. So it shifts back to the old window
            if (unsigned(CANRESTORE) /= 0) then  --CANRESTORE/=0 means that there are still windows that hold consinstent data and so we don't need to fill from memory to read them
              regFILL    <= '0';
              CANSAVE    <= std_logic_vector(unsigned(CANSAVE) + 1);
              CANRESTORE <= std_logic_vector(unsigned(CANRESTORE) - 1);
            else
              SWP     <= std_logic_vector(unsigned(SWP)-1);  --decrement needed here to start filling immediately
              -- the MMU reads the FILL status and correctly drives the memory
              regFILL <= '1';
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;



end beh;
