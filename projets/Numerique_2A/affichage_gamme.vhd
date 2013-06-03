library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity affichage_gamme is
    Port ( etat_courant: in STD_LOGIC_VECTOR (1 downto 0);
			  point: out STD_LOGIC;
			  leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
			  gamme: in STD_LOGIC_VECTOR (2 downto 0));
end affichage_gamme;

architecture Behavioral of affichage_gamme is

	component set_point port(
		point: out STD_LOGIC;
		etat_courant: in STD_LOGIC_VECTOR (1 downto 0);
		gamme: in STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component set_leds_gamme port(
		leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
		gamme: in STD_LOGIC_VECTOR (2 downto 0));
	end component;
begin
	gestion_point: set_point port map (
		point => point,
      etat_courant => etat_courant,
		gamme => gamme);
		
	gestion_leds_gamme: set_leds_gamme port map (
		leds_gamme => leds_gamme,
		gamme => gamme);
		
end Behavioral;