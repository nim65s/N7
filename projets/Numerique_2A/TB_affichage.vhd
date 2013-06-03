LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_affichage IS
END TB_affichage;
 
ARCHITECTURE behavior OF TB_affichage IS 
    COMPONENT afficheur
    PORT(
         hex_un : IN  std_logic_vector(3 downto 0);
         hex_deux : IN  std_logic_vector(3 downto 0);
         hex_trois : IN  std_logic_vector(3 downto 0);
         hex_quatre : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         sept_seg : OUT  std_logic_vector(6 downto 0);
         quatre_aff : OUT  std_logic_vector(3 downto 0);
         point : OUT  std_logic;
         leds_gamme : OUT  std_logic_vector(2 downto 0);
         gamme : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal hex_un : std_logic_vector(3 downto 0) := (others => '0');
   signal hex_deux : std_logic_vector(3 downto 0) := (others => '0');
   signal hex_trois : std_logic_vector(3 downto 0) := (others => '0');
   signal hex_quatre : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal gamme : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal sept_seg : std_logic_vector(6 downto 0);
   signal quatre_aff : std_logic_vector(3 downto 0);
   signal point : std_logic;
   signal leds_gamme : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: afficheur PORT MAP (
          hex_un => hex_un,
          hex_deux => hex_deux,
          hex_trois => hex_trois,
          hex_quatre => hex_quatre,
          clk => clk,
          rst => rst,
          sept_seg => sept_seg,
          quatre_aff => quatre_aff,
          point => point,
          leds_gamme => leds_gamme,
          gamme => gamme
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
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
