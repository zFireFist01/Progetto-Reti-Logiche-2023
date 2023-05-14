library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio5 is 
  generic (
    N : integer := 5
  );
  port(
    in1, in2 : in std_logic_vector(N-1 downto 0);
    ctrl : in std_logic;
    out1 : out std_logic_vector(N-1 downto 0)
);
end esempio5;


architecture dataflow of esempio5 is
begin
  out1 <= in1 and in2 when ctrl = '0' else
          in1 or in2; 
end dataflow;




