library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio14 is
port( in1, in2 : in std_logic;
      clk, rst : in std_logic;
      out1, out2 : out std_logic
);
end esempio14;

architecture behavioral of esempio14 is
begin
  process(clk, rst)
  begin
    if rst = '1' then
      out1 <= '0';
      out2 <= '0';
    elsif rising_edge(clk) then
      out1 <= not in1;
      out2 <= not in1 and in2;
    end if;
  end process;	
end behavioral;

