library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- generic multiplier based on Booth's algoritm
entity BOOTHMUL is
  generic (NBIT : integer := 8);
  port (
    A : in  std_logic_vector(NBIT-1 downto 0);
    B : in  std_logic_vector(NBIT-1 downto 0);
    P : out std_logic_vector(2*NBIT-1 downto 0)
    );
end entity BOOTHMUL;

-- Booth's multiplier architecture described structurally
architecture BOOTHMUL_STRUCT of BOOTHMUL is

  -- 3bit encoder declaration for multiplier term recoding
  component BOOTH_ENCODER_3BIT is
    port (
      B       : in  std_logic_vector(2 downto 0);
      ENCODED : out std_logic_vector(2 downto 0)
      );
  end component;

  -- 5-to-1 NBIT multiplexer declaration
  component MUX51_GENERIC is
    generic (NBIT : integer := 16);
    port (
      IN0 : in  std_logic_vector(NBIT-1 downto 0);  --0
      IN1 : in  std_logic_vector(NBIT-1 downto 0);  --nA
      IN2 : in  std_logic_vector(NBIT-1 downto 0);  ---nA
      IN3 : in  std_logic_vector(NBIT-1 downto 0);  --+2nA
      IN4 : in  std_logic_vector(NBIT-1 downto 0);  ---2nA
      S   : in  std_logic_vector(2 downto 0);
      O   : out std_logic_vector(NBIT-1 downto 0)
      );
  end component;

  -- generic Ripple Carry Adder declaration
  component RCA_GENERIC is
    generic (NBIT : integer := 4);
    port (A  : in  std_logic_vector(NBIT-1 downto 0);
          B  : in  std_logic_vector(NBIT-1 downto 0);
          Ci : in  std_logic;
          S  : out std_logic_vector(NBIT-1 downto 0);
          Co : out std_logic);
  end component;

  type EncodedSignalVector is array (0 to (NBIT/2)-1) of std_logic_vector(2 downto 0);  -- declares an array of 3-bit signals type
  type DataSignalVector is array (0 to (NBIT/2)-1) of std_logic_vector(2*NBIT-1 downto 0);  -- declares an array of 2*NBIT-bit signals type
  type FloatingCoutVector is array (0 to (NBIT/2)-1) of std_logic;  -- declares an array of std_logic_vector signals
  signal muxs_encoded_signals                                           : EncodedSignalVector;  -- carry encoded selection signal from Encoder(ENCODED) to 5-to-1 MUXs(S)
  signal straight_a, negative_a, straight_2a, negative_2a               : std_logic_vector(2*NBIT-1 downto 0);  -- 2*NBIT-bit signals carrying input of the first 5-to-1 MUX
  signal straight_ia, negative_ia, straight_2ia, negative_2ia, out_imux : DataSignalVector; -- carry the input signals (multiplied by powers of 2) to 5-to-1 MUXes
  signal predigest_product                                              : DataSignalVector; -- carry all 'predigested' products from an RCA's output to the successive RCA's input
  signal floating_cout                                                  : FloatingCoutVector; -- carry all RCAs carry outs (left floating on purpose)
  signal initial_b                                                      : std_logic_vector(2 downto 0); -- carries the first 3-bit encoder input (a '0' concatenated with the multiplier's first two bits)
begin

  --REFERENCE NOTATION
  --    A: multiplicand
  --    B: multiplier
  --    RCA: Ripple Carry Adder
  --    All shift operations and power of 2 multiplications are performed
  --      'hard-wired' for efficiency purposes

  -- assignes initial MUX signals values A, -A, 2A, -2A (0 is hard-wired to GND)
  straight_a  <= std_logic_vector(resize(signed(A), straight_a'length));
  negative_a  <= std_logic_vector(signed(not(straight_a)) + 1);
  straight_2a <= straight_a(2*NBIT-2 downto 0)&'0';
  negative_2a <= negative_a(2*NBIT-2 downto 0)&'0';

  -- for-generate loop for entire Booth multiplier internal structure
  mul_level_generation : for i in 0 to (NBIT/2)-1 generate
    -- if-generate: the first level contains 2 MUXes w.r.t. only one needed in middle levels,
    --              so a specific generate block is needed to describe the additional MUX and its Encoder
    ENC_0 : if (i = 0) generate
      straight_ia(i)  <= straight_a;
      negative_ia(i)  <= negative_a;
      straight_2ia(i) <= straight_2a;
      negative_2ia(i) <= negative_2a;
      initial_b       <= B(1 downto 0)&'0';

      -- first encoder taking as inputs bits (-1, 0, 1)
      ENC_0 : BOOTH_ENCODER_3BIT port map(B => initial_b, ENCODED => muxs_encoded_signals(i));

      -- first additional MUX
      MUX_00 : MUX51_GENERIC generic map (NBIT => NBIT*2)
        port map (IN0 => (others => '0'), IN1 => straight_a, IN2 => negative_a, IN3 => straight_2a,
                  IN4 => negative_2a, S => muxs_encoded_signals(i), O => out_imux(i));
    end generate ENC_0;

    -- if-generate: the first RCA takes as input two 2*NBIT signals coming from 2 MUXes (since there is no
    --              'previous' RCA at this stage), so it needs a specific description
    ENC_1 : if (i = 1) generate
      -- multiplies by 4 the previous stage MUX's input signal to be fed to current stage MUX
      straight_ia(i)  <= straight_ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_ia(i)  <= negative_ia(i-1)(2*NBIT-3 downto 0)&"00";
      straight_2ia(i) <= straight_2ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_2ia(i) <= negative_2ia(i-1)(2*NBIT-3 downto 0)&"00";

      -- encoder taking as input successive multiplier's 3-bit group
      --  (regular on the level i, multiplier's bits considered are: B(2*i - 1), B(2*i), and B(2*i + 1))
      ENC_i : BOOTH_ENCODER_3BIT port map(B => B((2*i + 1) downto (2*i -1)), ENCODED => muxs_encoded_signals(i));

      -- stage i 5-to-1 MUX
      MUX_i : MUX51_GENERIC generic map (NBIT => NBIT*2)
        port map (IN0 => (others => '0'), IN1 => straight_ia(i), IN2 => negative_ia(i), IN3 => straight_2ia(i),
                  IN4 => negative_2ia(i), S => muxs_encoded_signals(i), O => out_imux(i));

      -- stage 1 RCA, takes as input the two 2*NBIT signals coming from two MUXes
      ADD64_i : RCA_GENERIC generic map (NBIT => NBIT*2) port map(A => out_imux(i-1), B => out_imux(i), Ci => '0', Co => floating_cout(i), S => predigest_product(i));
    end generate ENC_1;

    -- if-generate: middle stages (not the first or last ones) have a regular structure,
    --              so they can all be described by this generate block
    ENC_i : if ((i > 1) and (i < (NBIT/2)-1)) generate
      -- multiplies by 4 the previous stage MUX's input signal to be fed to current stage MUX
      straight_ia(i)  <= straight_ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_ia(i)  <= negative_ia(i-1)(2*NBIT-3 downto 0)&"00";
      straight_2ia(i) <= straight_2ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_2ia(i) <= negative_2ia(i-1)(2*NBIT-3 downto 0)&"00";

      -- encoder taking as input successive multiplier's 3-bit group
      --  (regular on the level i, multiplier's bits considered are: B(2*i - 1), B(2*i), and B(2*i + 1))
      ENC_i : BOOTH_ENCODER_3BIT port map(B => B((2*i + 1) downto (2*i -1)), ENCODED => muxs_encoded_signals(i));

      -- stage i 5-to-1 MUX
      MUX_i : MUX51_GENERIC generic map (NBIT => NBIT*2)
        port map (IN0 => (others => '0'), IN1 => straight_ia(i), IN2 => negative_ia(i), IN3 => straight_2ia(i),
                  IN4 => negative_2ia(i), S => muxs_encoded_signals(i), O => out_imux(i));

      -- stage i RCA, takes as input the 2*NBIT signal from the ith stage MUX and the 2*NBIT signal
      --    output by the (i - 1)th stage RCA
      ADD64_i : RCA_GENERIC generic map(NBIT => NBIT*2) port map(A => predigest_product(i-1), B => out_imux(i), Ci => '0', Co => floating_cout(i), S => predigest_product(i));
    end generate ENC_i;
    ENC_last : if (i = (NBIT/2)-1) generate
      -- multiplies by 4 the previous stage MUX's input signal to be fed to current stage MUX
      straight_ia(i)  <= straight_ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_ia(i)  <= negative_ia(i-1)(2*NBIT-3 downto 0)&"00";
      straight_2ia(i) <= straight_2ia(i-1)(2*NBIT-3 downto 0)&"00";
      negative_2ia(i) <= negative_2ia(i-1)(2*NBIT-3 downto 0)&"00";

      -- encoder taking as input successive multiplier's 3-bit group
      --  (regular on the level i, multiplier's bits considered are: B(2*i - 1), B(2*i), and B(2*i + 1))
      ENC_i : BOOTH_ENCODER_3BIT port map(B => B((2*i + 1) downto (2*i -1)), ENCODED => muxs_encoded_signals(i));

      -- stage i 5-to-1 MUX
      MUX_i : MUX51_GENERIC generic map (NBIT => NBIT*2)
        port map (IN0 => (others => '0'), IN1 => straight_ia(i), IN2 => negative_ia(i), IN3 => straight_2ia(i),
                  IN4 => negative_2ia(i), S => muxs_encoded_signals(i), O => out_imux(i));

      -- last stage (i = (NBIT/2)-1)th RCA's output is mapped on the output port of the Booth's multiplier
      --    instead of being mapped on an intermediate signal, so it needs a specific description
      ADD64_i : RCA_GENERIC generic map (NBIT => NBIT*2) port map(A => predigest_product(i-1), B => out_imux(i), Ci => '0', Co => floating_cout(i), S => P);
    end generate ENC_last;
  end generate mul_level_generation;

end architecture BOOTHMUL_STRUCT;

-- structural Booth's multiplier configuration
configuration CFG_BOOTHMUL_STRUCT of BOOTHMUL is
  for BOOTHMUL_STRUCT
  end for;
end configuration CFG_BOOTHMUL_STRUCT;
