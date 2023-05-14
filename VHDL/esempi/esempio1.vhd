library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio1 is 
  port(
    in1, in2, in3: in std_logic;
    out1 : out std_logic;
    out2 : out std_logic
  );
end esempio1;

architecture dataflow of esempio1 is

begin
  out1 <= in1 and in2 and in3;
  out2 <= (in1 and in2) or in3;  
end dataflow;

--Variante 1
--architecture dataflow of esempio1 is
--  signal tmp : std_logic := '0';
--begin
--  tmp <= in1 and in2;
--  out1 <= tmp and in3;
--  out2 <= tmp or in3;
--end dataflow;

--Variante 2
--architecture dataflow of esempio1 is
--  signal tmp : std_logic := '0';
--begin
--  tmp <= in1 and in2 after 50 ns;
--  out1 <=  tmp and in3 after 50 ns;
--  out2 <= tmp or in3 after 50 ns;
--end dataflow;

