LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY main_sch_main_sch_sch_tb IS
END main_sch_main_sch_sch_tb;
ARCHITECTURE behavioral OF main_sch_main_sch_sch_tb IS 

   COMPONENT main_sch
   PORT( clk	:	IN	STD_LOGIC; 
          rst	:	IN	STD_LOGIC; 
          entree	:	IN	STD_LOGIC; 
          quatre_aff	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          sept_seg	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          point	:	OUT	STD_LOGIC; 
          leds_gamme	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          depassement_inf	:	OUT	STD_LOGIC; 
          depassement_sup	:	OUT	STD_LOGIC);
   END COMPONENT;

   --Inputs
   signal entree : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1'; 
   SIGNAL quatre_aff	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL sept_seg	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL point	:	STD_LOGIC;
   SIGNAL leds_gamme	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL depassement_inf	:	STD_LOGIC;
   SIGNAL depassement_sup	:	STD_LOGIC;
	
   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant entree_period : time := 20 ms;
BEGIN

   UUT: main_sch PORT MAP(
		clk => clk, 
		rst => rst, 
		entree => entree, 
		quatre_aff => quatre_aff, 
		sept_seg => sept_seg, 
		point => point, 
		leds_gamme => leds_gamme, 
		depassement_inf => depassement_inf, 
		depassement_sup => depassement_sup
   );
	
   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	entree_process :process
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
