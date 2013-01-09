LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY div_tb IS
END div_tb;
 
ARCHITECTURE behavior OF div_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div
    PORT(
         clk_in : IN  std_logic;
         rst : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div PORT MAP (
          clk_in => clk_in,
          rst => rst,
          clk_out => clk_out
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;

   -- Stimulus process

END;