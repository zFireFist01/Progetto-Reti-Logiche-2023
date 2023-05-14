library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity esempio8 is 
  generic (
    N : integer := 5
  );
  port(
    in1, in2: in std_logic_vector(N-1 downto 0);
    ctrl: in std_logic_vector(2 downto 0);
    out1: out std_logic_vector(N-1 downto 0)
  );
end esempio8;

architecture behavioral of esempio8 is
begin
  process(in1, in2, ctrl)
    constant GROUND : std_logic_vector(N-1 downto 0) 
                              := (others => '0');
  begin
    if ctrl = "000" then
      out1 <= in1 and in2;
    elsif ctrl = "001" then
      out1 <= in1 or in2;
    elsif ctrl = "010" then
      out1 <= std_logic_vector(SIGNED(in1) + SIGNED(in2));
    elsif ctrl = "011" then
      out1 <= std_logic_vector(SIGNED(in1) - SIGNED(in2));
    elsif ctrl = "100" then
      if in1 = in2 then
        out1 <= (0 => '1', others => '0');
      else
        out1 <= (others => '0');
      end if;
    else
      out1 <= GROUND;
    end if;
  end process;
end behavioral;

--Variante 1
--architecture behavioral of esempio8 is
--begin
--  process(in1, in2, ctrl)
--    constant GROUND : std_logic_vector(N-1 downto 0) := (others => '0');
--  begin
--    case ctrl is
--      when "000" =>
--        out1 <= in1 and in2;
--      when "001" =>
--        out1 <= in1 or in2;
--      when "010" =>
--        out1 <= std_logic_vector(SIGNED(in1) + SIGNED(in2));
--      when "011" =>
--        out1 <= std_logic_vector(SIGNED(in1) - SIGNED(in2));
--      when "100" =>
--        if in1 = in2 then
--          out1 <= (0 => '1', others => '0');
--        else
--          out1 <= (others => '0');
--       end if;
--      when others =>
--        out1 <= GROUND;
--    end case;
--  end process;
--end behavioral;

