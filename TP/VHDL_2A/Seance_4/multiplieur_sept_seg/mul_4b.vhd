library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;

entity mul_4b is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           M : out  STD_LOGIC_VECTOR (7 downto 0));
end mul_4b;

architecture Behavioral of mul_4b is
begin
	M <= std_logic_vector(unsigned(A) * unsigned(B));
end Behavioral;