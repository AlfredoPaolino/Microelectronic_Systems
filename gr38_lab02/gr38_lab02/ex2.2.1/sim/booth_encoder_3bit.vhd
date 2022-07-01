library IEEE;
use IEEE.std_logic_1164.all;

-- 3-bit encoder specific for Booth's algorithm
entity BOOTH_ENCODER_3BIT is

  port (
    B       : in  std_logic_vector(2 downto 0);
    ENCODED : out std_logic_vector(2 downto 0));  -- encoded values are 0, +/-A, +/-2A

end entity BOOTH_ENCODER_3BIT;

-- dataflow architecture description of the encoder
architecture dataflow of BOOTH_ENCODER_3BIT is
  -- constant (output) selection signal definition
  constant ZERO     : std_logic_vector(2 downto 0) := "000";
  constant plus_A   : std_logic_vector(2 downto 0) := "111";
  constant minus_A  : std_logic_vector(2 downto 0) := "110";
  constant plus_2A  : std_logic_vector(2 downto 0) := "101";
  constant minus_2A : std_logic_vector(2 downto 0) := "100";
begin  -- architecture dataflow

  -- output signal is assigned according to Booth's algorithm
  --  (multiplier's bit group)-to-(partial value) mapping
  ENCODED <= ZERO when (B = "000" or B = "111") else
             plus_A   when (B = "001" or B = "010") else
             plus_2A  when (B = "011") else
             minus_2A when (B = "100") else
             minus_A;

end architecture dataflow;

-- dataflow configuration for encoder description
configuration CGF_BOOTH_ENC_3BIT_RTL of BOOTH_ENCODER_3BIT is
    for dataflow
    end for;
end configuration CGF_BOOTH_ENC_3BIT_RTL;
