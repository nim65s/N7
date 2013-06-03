LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_etalonnage IS
END TB_etalonnage;
 
ARCHITECTURE behavior OF TB_etalonnage IS 
    COMPONENT compteur_etalonnage
    PORT(
         entree : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         nombre : OUT  std_logic_vector(26 downto 0);
         depassement_sup : OUT  std_logic;
         depassement_inf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entree : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1'; 

 	--Outputs
   signal nombre : std_logic_vector(26 downto 0);
   signal depassement_sup : std_logic;
   signal depassement_inf : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant entree_period : time := 200 us;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: compteur_etalonnage PORT MAP (
          entree => entree,
          clk => clk,
          rst => rst,
          nombre => nombre,
          depassement_sup => depassement_sup,
          depassement_inf => depassement_inf
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
		entree <= '0';
		wait for entree_period/2;
		entree <= '1';
		wait for entree_period/2;
   end process;
	
	rst_proc: process
	begin
		rst <= '0' after 50 ns;
		wait;
	end process; 

END;
