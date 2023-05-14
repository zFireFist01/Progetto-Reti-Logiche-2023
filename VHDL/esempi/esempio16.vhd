library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY esempio16 IS
END esempio16;

ARCHITECTURE testbench_arch OF esempio16 IS
  COMPONENT esempio8
    generic (
      N : integer := 5
    );
    port(
      in1, in2: in std_logic_vector(N-1 downto 0);
      ctrl: in std_logic_vector(2 downto 0);
      out1: out std_logic_vector(N-1 downto 0)
    );
  END COMPONENT;

  SIGNAL in1 : std_logic_vector (4 DownTo 0) := "00000";
  SIGNAL in2 : std_logic_vector (4 DownTo 0) := "00000";
  SIGNAL ctrl : std_logic_vector (2 DownTo 0) := "000";
  SIGNAL out1 : std_logic_vector (4 DownTo 0) := "00000";

BEGIN

  UUT : esempio8
  PORT MAP (
      in1 => in1,
      in2 => in2,
      ctrl => ctrl,
      out1 => out1
  );

  PROCESS
  BEGIN
    -- -------------  Current Time:  100ns
    WAIT FOR 100 ns;
    in1 <= "00001";
    in2 <= "00100";
    ctrl <= "001";
    -- -------------  Current Time:  300ns
    WAIT FOR 200 ns;
    ctrl <= "010";
    -- -------------  Current Time:  500ns
    WAIT FOR 200 ns;
    ctrl <= "011";
    -- -------------------------------------
    WAIT FOR 1500 ns;
    ASSERT(FALSE) REPORT "Simulation OK." SEVERITY FAILURE;
  END PROCESS;

END testbench_arch;
