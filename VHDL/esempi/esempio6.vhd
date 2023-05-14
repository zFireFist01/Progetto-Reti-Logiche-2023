library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity esempio6 is 
  port(
    in1, in2, in3 : in std_logic_vector(31 downto 0);
    ctrl : in std_logic;
    out1 : out std_logic_vector(31 downto 0)
);
end esempio6;


architecture structural of esempio6 is
  signal tmp : std_logic_vector(31 downto 0);

  component esempio5 is 
    generic (N : integer := 5);
    port(
      in1, in2 : in std_logic_vector(N-1 downto 0);
      ctrl : in std_logic;
      out1 : out std_logic_vector(N-1 downto 0)
    );
  end component;

begin
  es1 : esempio5
    generic map(32)
    port map(in1, in2, ctrl, tmp);
    
  es2 : esempio5
    generic map(N => 32)
    port map(in1 => tmp, in2 => in3, 
             ctrl => ctrl, out1 => out1);
end structural;


