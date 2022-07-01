library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use WORK.all;
use work.constants.all;

entity ACC is

    -- generic definition for data parallelism
    generic (N: integer := numBit);

    port (
      A          : in  std_logic_vector(N - 1 downto 0);
      B          : in  std_logic_vector(N - 1 downto 0);
      CLK        : in  std_logic;
      RST_n      : in  std_logic;
      ACCUMULATE : in  std_logic;
      ACC_EN_n   : in  std_logic;  -- optional use of the enable
      Y          : out std_logic_vector(N - 1 downto 0));
end ACC;

-- structural accumulator architecture
architecture ACC_STRUCTURAL of ACC is

    -- 2-to-1 multiplexer component definition
    component MUX21_GENERIC is
        generic (NBIT      : integer := numBit;
                 DELAY_MUX : time    := tp_mux);
      port (A   : in  std_logic_vector(NBIT-1 downto 0);
            B   : in  std_logic_vector(NBIT-1 downto 0);
            SEL : in  std_logic;
            Y   : out std_logic_vector(NBIT-1 downto 0));
    end component;

    -- adder component definition
    component RCA_GENERIC is
        generic (NBIT  : integer := 6;
                    DRCAS : time    := 0 ns;
                    DRCAC : time    := 0 ns);
        port (A  : in  std_logic_vector(NBIT-1 downto 0);
                B  : in  std_logic_vector(NBIT-1 downto 0);
                Ci : in  std_logic;
                S  : out std_logic_vector(NBIT-1 downto 0);
                Co : out std_logic);
    end component;

    -- Nbit register component definition
    component REGISTER_GENERIC is

	  -- generic definition for multi-bit register, default value defined in constants.vhd
	  generic (N : integer := numBit);

	  port (
		 CK: in std_logic;
		 RESET_n: in std_logic;
		 ACC_ENABLE_n: in std_logic;
		 DATA_IN: in std_logic_vector (N-1 downto 0);
		 DATA_OUT: out std_logic_vector (N-1 downto 0)
	  ) ;
	end component;
    
    -- internal signal for structural components interconection
    signal FEED_BACK_IN_MUX: std_logic_vector(N-1 downto 0);
    signal OUT_MUX: std_logic_vector(N-1 downto 0);
    signal OUT_ADD: std_logic_vector(N-1 downto 0);
    signal Co_internal: std_logic;

begin

    -- 2-to-1 multiplexer component instance
    UMUX21: MUX21_GENERIC generic map (NBIT=>N, DELAY_MUX=>0 ns)
                    port map (A=>B, B=>FEED_BACK_IN_MUX, SEL=>ACCUMULATE, Y=>OUT_MUX);

    -- adder component instance
    UADDER: RCA_GENERIC generic map (NBIT=>N, DRCAS=>0 ns, DRCAC=>0 ns)
            port map(A=>A, B=>OUT_MUX, Ci=>'0', S=>OUT_ADD, Co=>Co_internal);

    -- N-bit register component instance
    UREG: REGISTER_GENERIC generic map (N=>N)
                        port map(CK=>CLK, RESET_n=>RST_n, ACC_ENABLE_n=>ACC_EN_n, DATA_IN=>OUT_ADD, DATA_OUT=>FEED_BACK_IN_MUX);

    -- lateches register output to Y output port
    Y <= FEED_BACK_IN_MUX;

end ACC_STRUCTURAL ; -- ACC_STRUCTURAL


-- behavioral accumulator architecture
architecture ACC_BEHAVIORAL of ACC is

    signal FEED_BACK_IN_MUX: std_logic_vector(N-1 downto 0);
    signal OUT_MUX: std_logic_vector(N-1 downto 0);
    signal OUT_ADD: std_logic_vector(N-1 downto 0);
    signal CURR_REGISTER, NEXT_REGISTER: std_logic_vector(N-1 downto 0);

begin

    -- 2-to-1 multiplexer process
    MUX_PROC : process( ACCUMULATE, B, FEED_BACK_IN_MUX )
    begin
        
        if (ACCUMULATE = '0') then
            
            -- when ACCUMULATE selection is '0' signal B goes through
            OUT_MUX <= B;

        else

            -- when ACCUMULATE selection is '1' signal FEED_BACK_IN_MUX goes through
            OUT_MUX <= FEED_BACK_IN_MUX;

        end if ;

    end process ; -- MUX_PROC

    -- 2 inputs adder process
    ADD_PROC : process( A, OUT_MUX )
    begin
        
        -- performs addition
        OUT_ADD <= std_logic_vector(unsigned(A) + unsigned(OUT_MUX));

    end process ; -- ADD_PROC

    -- N-bit register process
    REGISTER_PROC : process( RST_n, CLK, ACC_EN_n, OUT_ADD, CURR_REGISTER, FEED_BACK_IN_MUX )
    begin
    
        if (RST_n = '0') then
        
            -- reset behavior (asynchronous)
            CURR_REGISTER <= (others => '0');
            
        else
        
            -- standard behavior
            if (ACC_EN_n = '0') then
            
                -- id enable is on (low) register latches new addition value
                --      at the rising edge of the clock
                NEXT_REGISTER <= OUT_ADD;
                
                if (rising_edge(CLK)) then
    
						  -- latches new value into register on rising edge of CLK
                    CURR_REGISTER <= NEXT_REGISTER;
                  
                end if ;
            
            else
            
                -- if enable is off (high) register keeps current value
                NEXT_REGISTER <= CURR_REGISTER;
            
            end if;
        
        end if;
    
        -- latches current register value into FEED_BACK_IN_MUX
        FEED_BACK_IN_MUX <= CURR_REGISTER;
        
        -- lateches current register value to Y output port
        Y <= CURR_REGISTER;
        
    end process ; -- REGISTER_PROC

end ACC_BEHAVIORAL ; -- ACC_BEHAVIORAL

-- structural configuration
configuration CFG_ACC_STRUCT of ACC is
    for ACC_STRUCTURAL
        for UMUX21: MUX21_GENERIC
            use configuration WORK.CFG_MUX21_GEN_BEHAVIORAL;
        end for;
        for UADDER: RCA_GENERIC 
            --use configuration WORK.CFG_RCA_GENERIC_BEHAVIORAL;
			use configuration WORK.CFG_RCA_GENERIC_STRUCT;
		  end for;
        for UREG : REGISTER_GENERIC
            use configuration WORK.CFG_REG_GEN_ASYNC;
        end for;
    end for;
end CFG_ACC_STRUCT;

-- behavioral configuration
configuration CFG_ACC_BEHAV of ACC is
    for ACC_BEHAVIORAL
    end for;
end CFG_ACC_BEHAV;
