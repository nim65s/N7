LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_un_hertz IS
END TB_un_hertz;
 
ARCHITECTURE behavior OF TB_un_hertz IS 
    COMPONENT un_hertz
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         etalon : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal etalon : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: un_hertz PORT MAP (
          clk => clk,
          rst => rst,
          etalon => etalon
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      rst <= '0' after 13 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
