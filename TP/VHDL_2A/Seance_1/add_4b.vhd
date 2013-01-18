library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity add_4b is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end add_4b;

architecture Behavioral of add_4b is
	signal tmp : STD_LOGIC_VECTOR(4 downto 0);
begin
	tmp <= ( '0' & A ) + ( '0' & B );
	S <= tmp(3 downto 0);
	C <= tmp(4);
end Behavioral;

