-- Vhdl test bench created from schematic D:\2EN\Bai-Saurel\Projet_numerique_bai_saurel\selection_mode.sch - Tue May 21 12:20:49 2013
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
ENTITY selection_mode_selection_mode_sch_tb IS
END selection_mode_selection_mode_sch_tb;
ARCHITECTURE behavioral OF selection_mode_selection_mode_sch_tb IS 

   COMPONENT selection_mode
   PORT( clk	:	IN	STD_LOGIC; 
          rst	:	IN	STD_LOGIC; 
          dep_sup_echant	:	IN	STD_LOGIC; 
          dep_inf_echant	:	IN	STD_LOGIC; 
          nombre_echant	:	IN	STD_LOGIC_VECTOR (13 DOWNTO 0); 
          dep_sup_etal	:	IN	STD_LOGIC; 
          dep_inf_etal	:	IN	STD_LOGIC; 
          nombre_etal	:	IN	STD_LOGIC_VECTOR (13 DOWNTO 0); 
          mode_auto	:	IN	STD_LOGIC; 
          manu_etal	:	IN	STD_LOGIC; 
          depassement_inf	:	OUT	STD_LOGIC; 
          depassement_sup	:	OUT	STD_LOGIC; 
          etal_on	:	OUT	STD_LOGIC; 
          nombre	:	OUT	STD_LOGIC_VECTOR (13 DOWNTO 0); 
          gamme	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL clk	:	STD_LOGIC;
   SIGNAL rst	:	STD_LOGIC;
   SIGNAL dep_sup_echant	:	STD_LOGIC;
   SIGNAL dep_inf_echant	:	STD_LOGIC;
   SIGNAL nombre_echant	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
   SIGNAL dep_sup_etal	:	STD_LOGIC;
   SIGNAL dep_inf_etal	:	STD_LOGIC;
   SIGNAL nombre_etal	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
   SIGNAL mode_auto	:	STD_LOGIC;
   SIGNAL manu_etal	:	STD_LOGIC;
   SIGNAL depassement_inf	:	STD_LOGIC;
   SIGNAL depassement_sup	:	STD_LOGIC;
   SIGNAL etal_on	:	STD_LOGIC;
   SIGNAL nombre	:	STD_LOGIC_VECTOR (13 DOWNTO 0);
   SIGNAL gamme	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: selection_mode PORT MAP(
		clk => clk, 
		rst => rst, 
		dep_sup_echant => dep_sup_echant, 
		dep_inf_echant => dep_inf_echant, 
		nombre_echant => nombre_echant, 
		dep_sup_etal => dep_sup_etal, 
		dep_inf_etal => dep_inf_etal, 
		nombre_etal => nombre_etal, 
		mode_auto => mode_auto, 
		manu_etal => manu_etal, 
		depassement_inf => depassement_inf, 
		depassement_sup => depassement_sup, 
		etal_on => etal_on, 
		nombre => nombre, 
		gamme => gamme
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

clk <= not clk after 10 ns;
dep_sup_etal <= '1', '0' after 50 ns;
dep_inf_echant <= '1', '0' after 150 ns;
mode_auto <= '1';

END;
