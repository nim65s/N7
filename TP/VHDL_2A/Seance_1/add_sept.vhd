LIBRARY ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity add_sept is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  C : out STD_LOGIC;
           aff : out  STD_LOGIC_VECTOR (7 downto 0);
           aff_no : out  STD_LOGIC_VECTOR (3 downto 0));
end add_sept;

architecture Behavioral of add_sept is
	COMPONENT add_4b
	PORT(
		A : IN  std_logic_vector(3 downto 0);
		B : IN  std_logic_vector(3 downto 0);
		S : OUT  std_logic_vector(3 downto 0) := (others => '0');
		C : OUT  std_logic := '0'
	);
	END COMPONENT;

	COMPONENT sept_seg
	PORT(
		valeur : IN  std_logic_vector(3 downto 0);
		affich : OUT  std_logic_vector(7 downto 0)
	);
	END COMPONENT;
	signal S_calc : std_logic_vector(3 downto 0);
	signal C_calc : std_logic;
	signal S : std_logic_vector(3 downto 0);

begin
	add: add_4b PORT MAP (A, B, S_calc, C);
	affi_s: sept_seg PORT MAP (S_calc, aff);
	S <= S_calc;
	aff_no <= "1110";
end Behavioral;