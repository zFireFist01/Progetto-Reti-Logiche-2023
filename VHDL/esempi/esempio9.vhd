library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio9 is 
  generic (
    N : integer := 5
  );
  port(
    in1: in std_logic_vector(N-1 downto 0);
    out1: out std_logic
  );
end esempio9;

architecture behavioral of esempio9 is
begin
  process(in1)
    variable tmp : std_logic;
  begin
    tmp := in1(0);
    for i in 1 to N-1 loop
      tmp := tmp and in1(i);
    end loop;
    out1 <= tmp;
  end process;
end architecture;

