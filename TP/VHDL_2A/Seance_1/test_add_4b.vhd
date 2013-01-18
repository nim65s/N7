LIBRARY ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_add_4b IS
END test_add_4b;
 
ARCHITECTURE behavior OF test_add_4b IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT add_4b
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add_4b PORT MAP (
          A => A,
          B => B,
          S => S,
          C => C
        );
	
	A <= A + 1 after 10ns;
	B <= B + 1 after 40ns;
END;
