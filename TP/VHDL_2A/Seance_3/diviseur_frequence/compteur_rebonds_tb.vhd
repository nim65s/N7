LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY compteur_rebonds_tb IS
END compteur_rebonds_tb;
 
ARCHITECTURE behavior OF compteur_rebonds_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT compteur_rebonds
    PORT(
         bp : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         cmpt_avec_rebond : OUT  std_logic_vector(3 downto 0);
         cmpt_anti_rebond : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   signal bp : std_logic := '0';
   signal rst : std_logic := '1';
   signal clk : std_logic := '0';

   signal cmpt_avec_rebond : std_logic_vector(3 downto 0);
   signal cmpt_anti_rebond : std_logic_vector(3 downto 0);

   constant clk_period : time := 20 ns;
 
BEGIN
   uut: compteur_rebonds PORT MAP (
          bp => bp,
          rst => rst,
          clk => clk,
          cmpt_avec_rebond => cmpt_avec_rebond,
          cmpt_anti_rebond => cmpt_anti_rebond
        );

	clk <= not clk after clk_period/2;
	bp <= not bp after 0.6ms;
	rst <= '0' after 2ms;
END;
