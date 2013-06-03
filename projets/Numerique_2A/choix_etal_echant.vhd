library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity choix_etal_echant is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           dep_inf_echant : in  STD_LOGIC;
           dep_sup_echant : in  STD_LOGIC;
           dep_inf_etal : in  STD_LOGIC;
           dep_sup_etal : in  STD_LOGIC;
			  etalonnage_on : out STD_LOGIC);
end choix_etal_echant;

architecture Behavioral of choix_etal_echant is
	type state is(echantillonnage, etalonnage);
	signal courant, suivant: state;
begin
	etat: process (clk, rst)
	begin
		if (rst = '1') then courant <= echantillonnage;
		elsif (clk'event and clk = '1') then courant <= suivant;
		end if;
	end process;
	
	calc: process (courant, dep_inf_echant, dep_sup_echant, dep_inf_etal, dep_sup_etal)
	begin
		case courant is
			when echantillonnage =>
				if (dep_inf_echant = '1') then suivant <= etalonnage;
				else suivant <= echantillonnage;
				end if;
			when etalonnage =>
				if (dep_sup_etal = '1') then suivant <= echantillonnage;
				else suivant <= etalonnage;
				end if;
		end case;
	end process;
	
	sorties: process (courant)
	begin
		case courant is
			when echantillonnage => etalonnage_on <= '0';
			when etalonnage => etalonnage_on <= '1';
		end case;
	end process;
end Behavioral;