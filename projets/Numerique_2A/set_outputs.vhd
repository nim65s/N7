library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity set_leds_gamme is
    Port ( leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
			  gamme: in STD_LOGIC_VECTOR (2 downto 0));
end set_leds_gamme;

architecture Behavioral of set_leds_gamme is
begin
	set: process (gamme)
	begin
		if (gamme = "000" or gamme = "001" or gamme = "010") then leds_gamme <= "001";
		elsif (gamme = "011" or gamme = "100" or gamme = "101") then leds_gamme <= "010";
		else leds_gamme <= "100";
	end process;
end Behavioral;