-- functions package declaration
-- contains useful custom functions to be used within designs
package functions is
function log2 (value : positive) return integer;
end functions;

-- package body description
package body functions is
  
  function log2 (value : positive) return integer is

    -- variable to hold temporary log2 value
    variable temp_log : integer := 0;

  begin

    -- computes the logarithm in base 2 of a value considering the ceiling value
    while(2**(temp_log) < value) and temp_log < 31 loop
      temp_log := temp_log + 1;
    end loop;

    -- returns computed log2 value
    return temp_log;

  end function;
  
end functions;
