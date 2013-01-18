--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:11:14 12/19/2012
-- Design Name:   
-- Module Name:   D:/Saurel/TP_VHDL/test_add.vhd
-- Project Name:  TP_VHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: additionneur
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
 
ENTITY test_add IS
END test_add;
 
ARCHITECTURE behavior OF test_add IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT additionneur
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   signal C : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: additionneur PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );

	A <= not A after 10ns;
	B <= not B after 20ns;

END;
