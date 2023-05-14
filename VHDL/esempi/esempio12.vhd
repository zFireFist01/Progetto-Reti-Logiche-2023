library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio12 is
port( in1 : in std_logic;
      clk, rst : in std_logic;
      out1 : out std_logic
);
end esempio12;

architecture behavioral of esempio12 is
begin
  process(clk, rst)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        out1 <= '0';
      else
        out1 <= in1;
      end if;
    end if;
  end process;	
end behavioral;

