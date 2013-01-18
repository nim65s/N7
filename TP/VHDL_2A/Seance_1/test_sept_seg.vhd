--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:34:10 12/19/2012
-- Design Name:   
-- Module Name:   D:/Saurel/TP_VHDL/test_sept_seg.vhd
-- Project Name:  TP_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sept_seg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_sept_seg IS
END test_sept_seg;
 
ARCHITECTURE behavior OF test_sept_seg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sept_seg
    PORT(
         valeur : IN  std_logic_vector(3 downto 0);
         affich : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal valeur : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal affich : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sept_seg PORT MAP (
          valeur => valeur,
          affich => affich
        );

		valeur <= valeur + 1 after 10ns;

END;
