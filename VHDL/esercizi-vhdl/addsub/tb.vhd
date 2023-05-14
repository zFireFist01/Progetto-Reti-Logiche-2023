library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE testbench_arch OF tb IS
  
  component addsub_4 is
   port(A, B : in  std_logic_vector(3 downto 0);
        notAdd_sub : in std_logic;
        RIS : out std_logic_vector(3 downto 0);
        OVF: out std_logic);
  end component;

  SIGNAL in1 : std_logic_vector (3 DownTo 0);
  SIGNAL in2 : std_logic_vector (3 DownTo 0);
  SIGNAL notAdd_sub : std_logic;
  SIGNAL ovf : std_logic;
  SIGNAL out1 : std_logic_vector (3 DownTo 0);

BEGIN

  UUT : addsub_4
  PORT MAP (
      a => in1,
      b => in2,
      notAdd_sub => notAdd_sub,
      RIs => out1,
      OVF => ovf
  );

  PROCESS
  BEGIN
    in1 <= "0000";
    in2 <= "0000";
    notAdd_sub <= '0';
    -- -------------  Current Time:  100ns
    WAIT FOR 100 ns;
    in1 <= "0001";
    in2 <= "0100";
    notAdd_sub <= '0';
    -- -------------  Current Time:  300ns
    WAIT FOR 200 ns;
    notAdd_sub <= '1';
    -- -------------  Current Time:  500ns
    WAIT FOR 200 ns;
    in1 <= "0001";
    in2 <= "0001";
    notAdd_sub <= '0';
    -- -------------------------------------
    WAIT FOR 200 ns;
    notAdd_sub <= '1';
    -- -------------------------------------
    WAIT FOR 1500 ns;
    ASSERT(FALSE) REPORT "Simulation OK." SEVERITY FAILURE;
  END PROCESS;

END testbench_arch;
