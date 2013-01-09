LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY anti_rebond_tb IS
END anti_rebond_tb;
 
ARCHITECTURE behavior OF anti_rebond_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT anti_rebond
    PORT(
         bp : IN  std_logic;
         clk : IN  std_logic;
         bp_ar : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal bp : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal bp_ar : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: anti_rebond PORT MAP (
          bp => bp,
          clk => clk,
          bp_ar => bp_ar
        );

	clk <= not clk after clk_period/2;
	bp <= not bp after 1.5 ms;
	
END;