LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY anti_rebond_tb IS
END anti_rebond_tb;
 
ARCHITECTURE behavior OF anti_rebond_tb IS 
  
    COMPONENT anti_rebond
    PORT(
			rst : in std_logic;
         bp : IN  std_logic;
         clk : IN  std_logic;
         bp_ar : OUT  std_logic
        );
    END COMPONENT;
    
	signal rst : std_logic := '1';
   signal bp : std_logic := '0';
   signal clk : std_logic := '0';

   signal bp_ar : std_logic;

   constant clk_period : time := 20 ns;
 
BEGIN
   uut: anti_rebond PORT MAP (
			 rst => rst,
          bp => bp,
          clk => clk,
          bp_ar => bp_ar
        );

	clk <= not clk after clk_period/2;
	bp <= not bp after 0.75 ms;
	rst <= '0' after 3ms;

END;