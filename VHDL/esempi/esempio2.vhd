library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio2 is 
  port(
    in1, in2, in3, in4: in std_logic_vector(31 downto 0);
    ctrl1: in std_logic_vector(1 downto 0);
    out1 : out std_logic_vector(31 downto 0)
  );
end esempio2;

architecture dataflow of esempio2 is
begin
 
  out1 <= in1 when ctrl1 = "00" else
          in2 when ctrl1 = "01" else
          in3 when ctrl1 = "10" else
          in4;        
end dataflow;

--architecture dataflow of esempio2 is
--begin
--  with ctrl1 select 
--    out1 <= in1 when "00",
--            in2 when "01",
--            in3 when "10",
--            in4 when others;        
--end dataflow;

