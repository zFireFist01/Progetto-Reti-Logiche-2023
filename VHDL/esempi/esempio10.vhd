library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio10 is
port( in1 : in std_logic;
      enable : in std_logic;
      out1 : out std_logic
);
end esempio10;

architecture behavioral of esempio10 is
begin
  process(in1, enable)
  begin
    if enable = '1' then
      out1 <= in1';
    end if;
  end process;
end behavioral;

