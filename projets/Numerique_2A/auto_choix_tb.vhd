LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY auto_choix_tb IS
END auto_choix_tb;
 
ARCHITECTURE behavior OF auto_choix_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT choix_etal_echant
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dep_inf_echant : IN  std_logic;
         dep_sup_etal : IN  std_logic;
         etalonnage_on : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dep_inf_echant : std_logic := '0';
   signal dep_sup_etal : std_logic := '0';

 	--Outputs
   signal etalonnage_on : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: choix_etal_echant PORT MAP (
          clk => clk,
          rst => rst,
          dep_inf_echant => dep_inf_echant,
          dep_sup_etal => dep_sup_etal,
          etalonnage_on => etalonnage_on
        );


clk <= not clk after 10 ns;
dep_sup_etal <= '0', '1' after 50 ns, '0' after 150 ns;
dep_inf_echant <= '0', '1' after 100 ns;

END;
