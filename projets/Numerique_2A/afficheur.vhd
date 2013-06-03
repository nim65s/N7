library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity afficheur is
    Port ( hex_un : in STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           sept_seg : out STD_LOGIC_VECTOR (6 downto 0);
           quatre_aff : out STD_LOGIC_VECTOR (3 downto 0);
			  point: out STD_LOGIC;
			  leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
			  gamme: in STD_LOGIC_VECTOR (2 downto 0));
end afficheur;


architecture Behavioral of afficheur is

	component affichage_gamme port(
		etat_courant: in  STD_LOGIC_VECTOR (1 downto 0);
		point: out STD_LOGIC;
		leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
		gamme: in STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component affichage_sept_seg port(
		hex_un : in STD_LOGIC_VECTOR (3 downto 0);
		hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
		hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
		hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
		sept_seg : out STD_LOGIC_VECTOR (6 downto 0);
		etat_courant : in STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	component machine_a_etat_afficheur port (
		clk : in  STD_LOGIC;
		rst: in STD_LOGIC;
		etat_courant: out  STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	component choix_aff port (
		quatre_aff : out STD_LOGIC_VECTOR (3 downto 0);
		etat_courant: in STD_LOGIC_VECTOR (1 downto 0));
	end component;
	
	signal etat_courant: STD_LOGIC_VECTOR (1 downto 0);
begin

	afficheur_gamme: affichage_gamme port map (
		etat_courant => etat_courant,
		point => point,
		leds_gamme => leds_gamme,
		gamme => gamme);
		
	afficheur_sept_seg: affichage_sept_seg port map (
		hex_un => hex_un,
		hex_deux => hex_deux,
		hex_trois => hex_trois,
		hex_quatre => hex_quatre,
		sept_seg => sept_seg,
		etat_courant => etat_courant);
		
	machine_a_etat: machine_a_etat_afficheur port map (
		clk => clk,
		rst => rst,
		etat_courant => etat_courant);
		
	choix_digit: choix_aff port map (
		quatre_aff => quatre_aff,
		etat_courant => etat_courant);
		
end Behavioral;