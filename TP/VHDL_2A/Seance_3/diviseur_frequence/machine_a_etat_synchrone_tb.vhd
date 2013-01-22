LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY machine_a_etat_synchrone_tb IS
END machine_a_etat_synchrone_tb;
 
ARCHITECTURE behavior OF machine_a_etat_synchrone_tb IS 

    COMPONENT machine_a_etat_synchrone
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         sens : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';
   signal sens : std_logic := '0';

   signal Q : std_logic_vector(3 downto 0);

   constant clk_period : time := 20 ns;
 
BEGIN

   uut: machine_a_etat_synchrone PORT MAP (
          clk => clk,
          rst => rst,
          sens => sens,
          Q => Q
        );
		  
	clk <= not clk after clk_period/2;
	rst <= '0' after 30ns;

END;
