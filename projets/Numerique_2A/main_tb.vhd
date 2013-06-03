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
          quatre_aff	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          sept_seg	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 0); 
          point	:	OUT	STD_LOGIC; 
          leds_gamme	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          rst	:	IN	STD_LOGIC; 
          auto_on	:	OUT	STD_LOGIC; 
          manu_etal	:	IN	STD_LOGIC; 
          mode_auto	:	IN	STD_LOGIC; 
          etal_on	:	OUT	STD_LOGIC; 
          depassement_sup	:	OUT	STD_LOGIC; 
          depassement_inf	:	OUT	STD_LOGIC; 
          entree	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL clk	:	STD_LOGIC := '0';
   SIGNAL quatre_aff	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL sept_seg	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
   SIGNAL point	:	STD_LOGIC;
   SIGNAL leds_gamme	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL rst	:	STD_LOGIC;
   SIGNAL auto_on	:	STD_LOGIC;
   SIGNAL manu_etal	:	STD_LOGIC;
   SIGNAL mode_auto	:	STD_LOGIC;
   SIGNAL etal_on	:	STD_LOGIC;
   SIGNAL depassement_sup	:	STD_LOGIC;
   SIGNAL depassement_inf	:	STD_LOGIC;
   SIGNAL entree	:	STD_LOGIC := '0';

BEGIN

   UUT: main_sch PORT MAP(
		clk => clk, 
		quatre_aff => quatre_aff, 
		sept_seg => sept_seg, 
		point => point, 
		leds_gamme => leds_gamme, 
		rst => rst, 
		auto_on => auto_on, 
		manu_etal => manu_etal, 
		mode_auto => mode_auto, 
		etal_on => etal_on, 
		depassement_sup => depassement_sup, 
		depassement_inf => depassement_inf, 
		entree => entree
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

clk <= not clk after 10 ns;
entree <= not entree after 500 ns;
rst <= '1', '0' after 50 ns;
mode_auto <= '0', '1' after 500 ns;

END;
