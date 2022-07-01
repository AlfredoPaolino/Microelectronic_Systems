library IEEE;
use IEEE.std_logic_1164.all; 

entity FD is
	Port (	D:	In	std_logic;
		CK:	In	std_logic;
		RESET_n:	In	std_logic;
		ENABLE_n: in std_logic;
		Q:	Out	std_logic);
end FD;


architecture FD_SYNC_BEHAV of FD is -- flip flop D with syncronous reset

begin
	PSYNCH: process(CK,RESET_n)
	begin
	  if CK'event and CK='1' then -- positive edge triggered:
	    if RESET_n='0' then -- active low reset 
	      Q <= '0'; 
	    else
			if(ENABLE_n = '0') then
				Q <= D; -- input is written on output
			end if;
	    end if;
	  end if;
	end process;

end FD_SYNC_BEHAV;

architecture FD_ASYNC_BEHAV of FD is -- flip flop D with asyncronous reset

begin
	
	PASYNCH: process(CK,RESET_n)
	begin
	  if RESET_n='0' then	-- active low reset
	    Q <= '0';
	  elsif CK'event and CK='1' then -- positive edge triggered:
			if(ENABLE_n = '0') then
				Q <= D; -- input is written on output
			end if;
	  end if;
	end process;

end FD_ASYNC_BEHAV;

-- syncronous reset FF configuration
configuration CFG_FD_SYNC of FD is
	for FD_SYNC_BEHAV
	end for;
end CFG_FD_SYNC;

-- asyncronous reset FF configuration
configuration CFG_FD_ASYNC of FD is
	for FD_ASYNC_BEHAV
	end for;
end CFG_FD_ASYNC;


