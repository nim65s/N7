LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY machine_a_etats_tb IS
END machine_a_etats_tb;
 
ARCHITECTURE behavior OF machine_a_etats_tb IS 
    COMPONENT machine_a_etats
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         sens : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal sens : std_logic := '0';

   signal Q : std_logic_vector(3 downto 0);

   constant clk_period : time := 20 ns;
 
BEGIN
   uut: machine_a_etats PORT MAP (
          clk => clk,
          rst => rst,
          sens => sens,
          Q => Q
        );
	clk <= not clk after clk_period/2;
END;
