library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mytypes.all;

entity cu is
  port (
    -- FIRST PIPE STAGE OUTPUTS
    EN1    : out std_logic;  -- enables the register file and the pipeline registers
    RF1    : out std_logic;  -- enables the read port 1 of the register file
    RF2    : out std_logic;  -- enables the read port 2 of the register file
    WF1    : out std_logic;  -- enables the write port of the register file
    -- SECOND PIPE STAGE OUTPUTS
    EN2    : out std_logic;             -- enables the pipe registers
    S1     : out std_logic;  -- input selection of the first multiplexer
    S2     : out std_logic;  -- input selection of the second multiplexer
    ALU1   : out std_logic;             -- alu control bit
    ALU2   : out std_logic;             -- alu control bit
    -- THIRD PIPE STAGE OUTPUTS
    EN3    : out std_logic;  -- enables the memory and the pipeline registers
    RM     : out std_logic;             -- enables the read-out of the memory
    WM     : out std_logic;             -- enables the write-in of the memory
    S3     : out std_logic;             -- input selection of the multiplexer
    -- INPUTS
    OPCODE : in  std_logic_vector(OP_CODE_SIZE - 1 downto 0);
    FUNC   : in  std_logic_vector(FUNC_SIZE - 1 downto 0);
    Clk    : in  std_logic;
    Rst    : in  std_logic);            -- Active Low
end cu;

architecture beh of cu is
-- control word has 11 output signals, ALU1/ALU2 requires extra handling
  subtype control_word is std_logic_vector(10 downto 0);
-- define LUT type with 16 entries, which reflects the number of opcodes
-- defined in myType.vhd
  type lut_t is array (0 to 14) of control_word;
-- declare a lookup table and initialize it
-- control word follows the same order as in the entity port declaration
-- the MSB is 'EN1' and the LSB is 'S3'
  signal lookup_table : lut_t := (
    -- the bits are split into stages starting from 1st on the left to the 3rd
    -- on the right
    --ALU instructions using immediate INP1
    "1111"&"101"&"1000",                --RTYPE instruction
    "1011"&"111"&"1000",                --ADDI1
    "1011"&"111"&"1000",                --SUBI1
    "1011"&"111"&"1000",                --ANDI1
    "1011"&"111"&"1000",                --ORI1
    --ALU instructions using immediate INP2
    "1101"&"100"&"1000",                --ADDI2
    "1101"&"100"&"1000",                --SUBI2
    "1101"&"100"&"1000",                --ANDI2
    "1101"&"100"&"1000",                --ORI2

    "1101"&"001"&"1000",                --MOV, like an ADD with INP2 = 0
    "1001"&"111"&"1000",                --SREG1, like an ADD but using R0
    "1001"&"100"&"1000",                --SREG2, like an ADD but using R0
    "1110"&"100"&"1010",                --SMEM2
    "1101"&"111"&"1101",                --LMEM1
    "1101"&"100"&"1101"                 --LMEM2
    );

-- registers for delaying control signals
  signal wire_cw1             : std_logic_vector(10 downto 0);
  signal curr_cw2, next_cw2   : std_logic_vector(7 downto 0);  -- it gets stripped by 3 signals
  signal curr_cw3, next_cw3   : std_logic_vector(4 downto 0);  --it gets stripped by 3 signals again
  signal curr_alu2, next_alu2 : std_logic_vector(1 downto 0);  --delays of 1 cycle the inputs ALU1,ALU2


begin  -- architecture beh

  -- perform updates of registers and takes care of clock and reset signals
  reg_update : process(Clk, Rst, next_alu2, next_cw3, next_cw2)
  begin
    if (Rst = '1') then
      curr_cw2  <= (others => '0');
      curr_cw3  <= (others => '0');
      curr_alu2 <= (others => '0');
    elsif(rising_edge(Clk))then
      curr_cw2  <= next_cw2;
      curr_cw3  <= next_cw3;
      curr_alu2 <= next_alu2;
    end if;
  end process;

  -- takes care of OPCODE and the wiring of cw* registers
  cwreg_pipeline : process(OPCODE, wire_cw1, curr_cw2)
  begin
    wire_cw1 <= lookup_table(to_integer(unsigned(OPCODE)));
    next_cw2 <= wire_cw1(7 downto 0);              -- strip of 3 bits
    next_cw3 <= curr_cw2(7)&curr_cw2(3 downto 0);  -- preserve the WRF signal
  end process;

  -- takes care of generating proper inputs to the ALU
  alureg_pipeline : process(OPCODE, FUNC)
  begin
    case to_integer(unsigned(OPCODE)) is
      when 0 =>
        -- r type operations, directly forward the func
        next_alu2 <= FUNC(1)&FUNC(0);
      when 1 | 5 | 9 | 10 | 11 | 12 | 13 | 14 =>
        -- ADDI1, ADDI2
        -- SREG1,SREG2 are converted into ADD using R0 either on A or B for the
        -- INP1,INP2
        -- SMEM2 is an addition
        -- LMEM1,LMEM2 use both addition
        next_alu2 <= "00";
      when 2 | 6=>
        -- SUBI1,SUBI2
        next_alu2 <= "01";
      when 3 | 7=>
        -- ANDI1,ANDI2
        next_alu2 <= "10";
      when others =>                    --4 and 8
        -- ORI1,ORI2
        next_alu2 <= "11";
    end case;
  end process;

  --map the output of the control word and ALU
  EN1  <= wire_cw1(10);
  RF1  <= wire_cw1(9);
  RF2  <= wire_cw1(8);
  WF1  <= curr_cw3(4);                  --write is delayed
  -- 2nd stage
  EN2  <= curr_cw2(6);
  S1   <= curr_cw2(5);
  S2   <= curr_cw2(4);
  ALU1 <= curr_alu2(0);
  ALU2 <= curr_alu2(1);
  --3rd stage
  EN3  <= curr_cw3(3);
  RM   <= curr_cw3(2);
  WM   <= curr_cw3(1);
  S3   <= curr_cw3(0);

end architecture beh;
