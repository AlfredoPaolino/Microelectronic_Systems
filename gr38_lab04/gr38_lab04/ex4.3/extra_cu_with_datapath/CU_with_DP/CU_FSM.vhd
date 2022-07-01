library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.myTypes.all;

entity CU_FSM is
generic (
    OPCODE_SIZE : integer := 6;      -- Op Code Size
    FUNC_SIZE : integer := 11    -- Func Field Size for R-Type Ops
    );
port (  
    OPCODE : in std_logic_vector(OPCODE_SIZE-1 downto 0);
    FUNC : in std_logic_vector(FUNC_SIZE-1 downto 0);
    CLK, RST : in std_logic;
    -- FIRST PIPE STAGE OUTPUTS
    EN1    : out std_logic;               -- enables the register file and the pipeline registers
    RF1    : out std_logic;               -- enables the read port 1 of the register file
    RF2    : out std_logic;               -- enables the read port 2 of the register file
    WF1    : out std_logic;               -- enables the write port of the register file
    -- SECOND PIPE STAGE OUTPUTS
    EN2    : out std_logic;               -- enables the pipe registers
    S1     : out std_logic;               -- input selection of the first multiplexer
    S2     : out std_logic;               -- input selection of the second multiplexer
    ALU1   : out std_logic;               -- alu control bit
    ALU2   : out std_logic;               -- alu control bit
    -- THIRD PIPE STAGE OUTPUTS
    EN3    : out std_logic;               -- enables the memory and the pipeline registers
    RM     : out std_logic;               -- enables the read-out of the memory
    WM     : out std_logic;               -- enables the write-in of the memory
    S3     : out std_logic               -- input selection of the multiplexer
    );
end CU_FSM;

architecture behavioural of CU_FSM is

    type StateType is (S_rst, S_oper, S_exec, S_mem);
    signal CurrState, NextState : StateType;
    
begin

    stateReg : process (CLK, RST)
    begin
        if (RST = '1') then
            CurrState <= S_rst;
        elsif (rising_edge(CLK)) then
            CurrState <= NextState;
        end if;
    end process;
    
    combLogic : process (CurrState, OPCODE, FUNC)
    begin
        case CurrState is
            when S_rst =>
                            EN1 <= '0';
                            RF1 <= '0';
                            RF2 <= '0';
                            WF1 <= '0';
                            EN2 <= '0';
                            S1 <= '0';
                            S2 <= '0';
                            ALU1 <= '0';
                            ALU2 <= '0';
                            EN3 <= '0';
                            RM <= '0';
                            WM <= '0';
                            S3 <= '0';
                            NextState <= S_oper;
            when S_oper =>
                            EN1 <= '1';
                            EN2 <= '0';
                            EN3 <= '0';
                            RF1 <= '1';
                            RF2 <= '1';
                            WF1 <= '0';
                            S1 <= '0';
                            S2 <= '0';
                            ALU1 <= '0';
                            ALU2 <= '0';
                            RM <= '0';
                            WM <= '0';
                            S3 <= '0';
                            NextState <= S_exec;
                            
            when S_exec =>
                            EN1 <= '0';
                            EN2 <= '1';
                            EN3 <= '0';
                            RF1 <= '0';
                            RF2 <= '0';
                            WF1 <= '0';
                            S1 <= OPCODE(4);
                            S2 <= OPCODE(5);
                            if (unsigned(OPCODE) = 0) then
                                ALU1 <= FUNC(1);
                                ALU2 <= FUNC(0);
                            else
                                ALU1 <= OPCODE(1);
                                ALU2 <= OPCODE(0);
                            end if;
                            RM <= '0';
                            WM <= '0';
                            S3 <= '0';
                            NextState <= S_mem;
            when S_mem => 
                            EN1 <= '1';		--EN1 = 1 to activate the writing on RF
                            EN2 <= '0';
                            EN3 <= '1';
                            RF1 <= '0';
                            RF2 <= '0';
                            WF1 <= not OPCODE(3);
                            S1 <= '0';
                            S2 <= '0';
                            ALU1 <= '0';
                            ALU2 <= '0';
                            WM <= OPCODE(3);
                            RM <= OPCODE(2);
                            S3 <= OPCODE(2);
                            NextState <= S_oper;
        end case;
    end process;
end behavioural;
