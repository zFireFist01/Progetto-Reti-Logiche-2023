library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity esempio4 is 
  port(
    in1: in std_logic_vector(31 downto 0);
    out1 : out std_logic_vector(31 downto 0)
);
end esempio4;


architecture dataflow of esempio4 is
  signal cpl1, inv1 : std_logic_vector(31 downto 0);
  constant vdd32 : 
    std_logic_vector(31 downto 0) := (others => '1');
begin
  cpl1 <= vdd32 xor ('0' & in1(30 downto 0));
  inv1 <= std_logic_vector(signed(cpl1) + 1);
  out1 <= in1 when in1(31) = '0' else
          inv1;        
end dataflow;



