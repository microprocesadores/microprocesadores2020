LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RAM_4_TESTBENCH IS
END RAM_4_TESTBENCH;

ARCHITECTURE arch OF RAM_4_TESTBENCH IS

  SIGNAL CLK, WE : STD_LOGIC;
  SIGNAL ADDR : UNSIGNED(1 DOWNTO 0);
  SIGNAL DATA_IN, DATA_OUT : UNSIGNED(3 DOWNTO 0);

  COMPONENT RAM_4BITS IS PORT (
    CLK, WE : IN STD_LOGIC;
    ADDR : IN UNSIGNED(1 DOWNTO 0);
    DATA_IN : IN UNSIGNED(3 DOWNTO 0);
    DATA_OUT : OUT UNSIGNED(3 DOWNTO 0)
    );
  END COMPONENT;
BEGIN
  RAM : RAM_4BITS PORT MAP(CLK => CLK, WE => WE, ADDR => ADDR, DATA_IN => DATA_IN, DATA_OUT => DATA_OUT);
  CLK_PROCESS : PROCESS
  BEGIN
    CLK <= '1';
    WAIT FOR 0.5 ns;
    CLK <= '0';
    WAIT FOR 0.5 ns;
  END PROCESS;

  INP_PROCESS : PROCESS
  BEGIN
    WE <= '0';
    ADDR <= "00";
    WAIT FOR 5 ns;
    WE <= '0';
    ADDR <= "01";
    WAIT FOR 5 ns;
    WE <= '1';
    ADDR <= "11";
    DATA_IN <= "1111";
    WAIT;
  END PROCESS;
END arch;