library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use WORK.constants.all;

entity TB_REGISTER_GENERIC is
end TB_REGISTER_GENERIC;

architecture TB_REG_GEN_ARCH of TB_REGISTER_GENERIC is

    -- generic register component declaration
    component REGISTER_GENERIC is

        -- generic declaration for multi-bit register
        generic (N : integer := numBit);
      
        port (
          CK: in std_logic;
          RESET_n: in std_logic;
          ACC_ENABLE_n: in std_logic;
          DATA_IN: in std_logic_vector (N-1 downto 0);
          DATA_OUT: out std_logic_vector (N-1 downto 0)
        ) ;

    end component;

    constant Nbit: integer := 8;    -- testing register width
    constant MAX_VAL: integer := 255;   -- register maximum value
    constant CK_PERIOD: time := 1 ns;   -- clock period value
    signal CK_S, RESET_n_S, ACC_ENABLE_n_S: std_logic;  -- testing signals
    signal DATA_IN_S, DATA_OUT_S: std_logic_vector (Nbit-1 downto 0);   -- testing signals cont'd

begin

    -- generic register instance, port mapping to testing signals
    RG_N: REGISTER_GENERIC generic map (N=>Nbit)
                            port map (CK=>CK_S, RESET_n=>RESET_n_S, ACC_ENABLE_n=>ACC_ENABLE_n_S,
                                        DATA_IN=>DATA_IN_S, DATA_OUT=>DATA_OUT_S);

    -- Clock Process: generates clock signal according to CK_PERIOD value
    CK_PROC : process
    begin
        CK_S <= '0';
        wait for CK_PERIOD/2;
        CK_S <= '1';
        wait for CK_PERIOD/2;
    end process ; -- CK_PROC

    -- Vector Process: generates testing signals and asserts correct register functionality
    VECTOR_PROC : process
    begin

        wait for CK_PERIOD/4;

        -- reset (active low) is on, enable (active low) is off, DATA_IN_S set to zero
        RESET_n_S <= '0';
        ACC_ENABLE_n_S <= '1';
        DATA_IN_S <= (OTHERS => '0');

        wait for CK_PERIOD;

        -- reset (active low) off, enable (active low) is off, DATA_IN_S is set to all 1s
        RESET_n_S <= '1';
        ACC_ENABLE_n_S <= '1';
        DATA_IN_S <= std_logic_vector(to_unsigned(MAX_VAL, DATA_IN_S'length));
        
        wait for CK_PERIOD;
        
        -- asserts that when enable (active low) is off the register does not store current input data
        assert (DATA_OUT_S = std_logic_vector(to_unsigned(0, DATA_OUT_S'length)))
            report "Expected DATA_OUT_S = 0, received " & integer'image(to_integer(unsigned(DATA_OUT_S)));
        
        -- register content testing loop
        REG8_TEST : for i in 0 to MAX_VAL loop
            
            -- 1) generates all possible patterns which can be stored into the register
            --      (enable is here always on)
            RESET_n_S <= '1';
            ACC_ENABLE_n_S <= '0';
            DATA_IN_S <= std_logic_vector(to_unsigned(i, DATA_IN_S'length));
            
            wait for CK_PERIOD;
            
            -- 2) asserts that the patterns are correctly stored at the rising endge of CK
            assert (DATA_OUT_S = std_logic_vector(to_unsigned(i, DATA_OUT_S'length)))
                report "Expected DATA_OUT_S = " & integer'image(i) & ", received "
                            & integer'image(to_integer(unsigned(DATA_OUT_S)));

        end loop ; -- REG8_TEST

        -- wait statement to stop Vector Process execution
        wait;

    end process ; -- VECTOR_PROC

end TB_REG_GEN_ARCH ; -- TB_REG_GEN_ARCH

-- configuration to test an asynchronous reset register instance
configuration CFG_TEST_REG_GEN_ASYNC of TB_REGISTER_GENERIC is
    for TB_REG_GEN_ARCH
        for RG_N: REGISTER_GENERIC
            use configuration WORK.CFG_REG_GEN_ASYNC; -- asynchronous
        end for;
    end for;
end CFG_TEST_REG_GEN_ASYNC;

-- configuration to test a synchronous reset register instance
configuration CFG_TEST_REG_GEN_SYNC of TB_REGISTER_GENERIC is
    for TB_REG_GEN_ARCH
        for RG_N: REGISTER_GENERIC
            use configuration WORK.CFG_REG_GEN_SYNC; -- synchronous
        end for;
    end for;
end CFG_TEST_REG_GEN_SYNC;
