library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio13 is
port(	in1 : in std_logic_vector(31 downto 0);
	    clk, rst : in std_logic;
	    out1 : out std_logic_vector(31 downto 0)
);
end esempio13;

architecture behavioral of esempio13 is
begin
  process(clk, rst)
  begin
    if rst = '1' then
      out1 <= (others => '0');
    elsif rising_edge(clk) then 
      out1 <= in1;
    end if;
  end process;	
end behavioral;
