-- Vhdl test bench created from schematic D:\2EN\Bai-Saurel\Projet_numerique_bai_saurel\main_sch.sch - Tue Apr 16 09:19:15 2013
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY main_sch_main_sch_sch_tb_un IS
END main_sch_main_sch_sch_tb_un;
ARCHITECTURE behavioral OF main_sch_main_sch_sch_tb_un IS 

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

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

clk <= not clk after 10 ns;
entree <= not entree after 10 ms;
rst <= '1', '0' after 50 ns;

END;
