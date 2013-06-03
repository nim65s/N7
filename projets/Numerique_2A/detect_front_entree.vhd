library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect_front_entree is
    Port ( entree : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           front : out  STD_LOGIC);
end detect_front_entree;

architecture Behavioral of detect_front_entree is
	Signal prev: STD_LOGIC;
begin
	detecteur: process (clk, entree, prev)
	begin
		if (clk'event and clk = '1') then
			if (prev = '0' and entree = '1') then
				prev <= '1';
				front <= '1';
			elsif (entree = '0') then
				prev <= '0';
				front <= '0';
			else -- Il faut réinitialiser la sortie au front d'horloge suivant
				prev <= entree;
				front <= '0';
			end if;
		end if;
	end process;
end Behavioral;

