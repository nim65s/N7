LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY wait_2ms_tb IS
END wait_2ms_tb;
 
ARCHITECTURE behavior OF wait_2ms_tb IS  
    COMPONENT wait_2ms
    PORT(
         rst : IN  std_logic;
         clk_in : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    
   signal rst : std_logic := '0';
   signal clk_in : std_logic := '0';

   signal output : std_logic;

   constant clk_in_period : time := 20 ns;
 
BEGIN
   uut: wait_2ms PORT MAP (
          rst => rst,
          clk_in => clk_in,
          output => output
        );

	clk_in <= not clk_in after clk_in_period/2;
	rst <= not rst after 11ms;
	
END;