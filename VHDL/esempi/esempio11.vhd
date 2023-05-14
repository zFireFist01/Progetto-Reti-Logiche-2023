library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio11 is
port( in1 : in std_logic;
      clk, rst : in std_logic;
      out1 : out std_logic
);
end esempio11;

architecture behavioral of esempio11 is
begin
  process(clk, rst)
  begin
    if rst = '1' then
      out1 <= '0';
    elsif rising_edge(clk) then
      out1 <= in1;
    end if;
  end process;
end behavioral;
