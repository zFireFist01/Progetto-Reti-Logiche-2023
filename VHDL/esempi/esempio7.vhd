library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio7 is 
  port(
    in1, in2, in3: in std_logic;
    out1 : out std_logic;
    out2 : out std_logic
  );
end esempio7;

architecture behavioral of esempio7 is
  
begin
  process(in1, in2, in3)
    variable tmp1, tmp2 : std_logic;
  begin
    tmp1 := in1 and in2;
    out1 <= tmp1 and in3;
    tmp2 := in1 and in2;
    out2 <= tmp2 or in3;
  end process;
end architecture;

--Variante 1
--architecture behavioral of esempio7 is
--signal tmp2 : std_logic;   
--begin
--  process(in1, in2, in3)
--    variable tmp1 : std_logic;
--  begin
--    tmp1 := in1 and in2;
--    out1 <= tmp1 and in3;
--    tmp2 <= tmp1;
--  end process;
--  out2 <= tmp2 or in3;
--end architecture;


