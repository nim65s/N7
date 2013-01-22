library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detecteur_de_front_montant is
    Port ( clk : in  STD_LOGIC;
			  entree : in  STD_LOGIC;
           sortie : out  STD_LOGIC);
end detecteur_de_front_montant;

architecture Behavioral of detecteur_de_front_montant is
	signal prev : std_logic;
begin
	detecteur: process (clk, entree, prev)
	begin
		if (clk'event and clk = '1') then
			if (prev = '0' and entree = '1') then
				prev <= '1';
				sortie <= '1';
			elsif (entree = '0') then
				prev <= '0';
				sortie <= '0';
			else -- Il faut réinitialiser la sortie au front d’horloge suivant
				prev <= entree;
				sortie <= '0';
			end if;
		end if;
	end process;
end Behavioral;

