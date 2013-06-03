library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity choix_etal_echant is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  nombre_echant : in  STD_LOGIC_VECTOR (13 downto 0);
           dep_inf_echant : in  STD_LOGIC;
           dep_sup_echant : in  STD_LOGIC;
           nombre_etal : in  STD_LOGIC_VECTOR (13 downto 0);
           dep_inf_etal : in  STD_LOGIC;
           dep_sup_etal : in  STD_LOGIC;
           nombre : out  STD_LOGIC_VECTOR (13 downto 0);
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end choix_etal_echant;

architecture Behavioral of choix_etal_echant is
	type state is(echantillonage, etalonnage, dep_sup, dep_inf);
	signal courant, suivant: state;
begin
	etat: process (clk, rst)
	begin
		if (rst = '1') then courant <= echantillonage;
		elsif (clk'event and clk = '1') then courant <= suivant;
		end if;
	end process;
	
	calc: process (courant, dep_inf_echant, dep_sup_echant, dep_inf_etal, dep_sup_etal)
	begin
		case courant is
			when echantillonage =>
				if (dep_sup_echant = '1') then suivant <= dep_sup;
				elsif (dep_inf_echant = '1') then suivant <= etalonnage;
				else suivant <= echantillonage;
				end if;
			when etalonnage =>
				if (dep_inf_etal = '1') then suivant <= dep_inf;
				elsif (dep_sup_etal = '1') then suivant <= echantillonage;
				else suivant <= etalonnage;
				end if;
			when dep_sup => 
				if (dep_sup_echant = '1') then suivant <= dep_sup;
				else suivant <= echantillonage;
				end if;
			when dep_inf => 
				if (dep_inf_etal = '1') then suivant <= dep_inf;
				else suivant <= etalonnage;
				end if;
		end case;
	end process;
	
	sorties: process (courant, nombre_echant, nombre_etal)
	begin
		case courant is
			when echantillonage =>
				nombre <= nombre_echant;
				depassement_sup <= '0';
				depassement_inf <= '0';
			when etalonnage =>
				nombre <= nombre_etal;
				depassement_sup <= '0';
				depassement_inf <= '0';
			when dep_sup =>
				depassement_sup <= '1';
				depassement_inf <= '0';
			when dep_inf =>
				depassement_sup <= '0';
				depassement_inf <= '1';
		end case;
	end process;
end Behavioral;