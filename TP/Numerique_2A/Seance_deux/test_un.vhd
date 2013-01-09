-- Vhdl test bench created from schematic D:\2EN\Nim\TP_Num_2\compteur_decade.sch - Fri Dec 14 10:00:10 2012
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
ENTITY compteur_decade_compteur_decade_sch_tb IS
END compteur_decade_compteur_decade_sch_tb;
ARCHITECTURE behavioral OF compteur_decade_compteur_decade_sch_tb IS 

   COMPONENT compteur_decade
   PORT( CLK	:	IN	STD_LOGIC; 
          Q	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0));
   END COMPONENT;

   SIGNAL CLK	:	STD_LOGIC := '0';
   SIGNAL Q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

   UUT: compteur_decade PORT MAP(
		CLK => CLK, 
		Q => Q
   );

-- *** Test Bench - User Defined Section ***
      CLK <= not CLK after 5ns;
-- *** End Test Bench - User Defined Section ***

END;
