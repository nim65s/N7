LIBRARY ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity mul_sept is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  M : out STD_LOGIC_VECTOR (7 downto 0);
           aff : out  STD_LOGIC_VECTOR (7 downto 0);
           aff_no : out  STD_LOGIC_VECTOR (3 downto 0));
end mul_sept;

architecture Behavioral of mul_sept is
	COMPONENT mul_4b
	PORT(
		A : IN  std_logic_vector(3 downto 0);
		B : IN  std_logic_vector(3 downto 0);
		M : OUT  std_logic_vector(7 downto 0) := (others => '0')
	);
	END COMPONENT;

	COMPONENT sept_seg
	PORT(
		valeur : IN  std_logic_vector(3 downto 0);
		affich : OUT  std_logic_vector(7 downto 0)
	);
	END COMPONENT;
	signal M_calc : std_logic_vector(7 downto 0);
begin
	mul: mul_4b PORT MAP (A, B, M_calc);
	affi_s: sept_seg PORT MAP (M_calc(3 downto 0), aff);
	M <= M_calc;
	aff_no <= "1110";
end Behavioral;