library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity esempio3 is 
  port(
    in1, in2: in std_logic_vector(31 downto 0);
    out1 : out std_logic_vector(31 downto 0);
    ovf : out std_logic
  );
end esempio3;

architecture dataflow of esempio3 is
  signal sum : SIGNED(31 downto 0);
  signal msb : std_logic;
begin
  sum <=  SIGNED(in1) + SIGNED(in2);
  out1 <= std_logic_vector(sum);
  msb <= std_logic(sum(31)); 
  ovf <= (in1(31) and in2(31) and not msb) or 
         (not in1(31) and not in2(31) and msb);
end dataflow;



