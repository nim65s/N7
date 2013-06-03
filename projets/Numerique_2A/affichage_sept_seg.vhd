library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity affichage_sept_seg is
    Port ( hex_un : in STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
           sept_seg : out STD_LOGIC_VECTOR (6 downto 0);
			  etat_courant : in STD_LOGIC_VECTOR (1 downto 0));
end affichage_sept_seg;

architecture Behavioral of affichage_sept_seg is

	component nb_to_sept_seg port(
		nombre : in STD_LOGIC_VECTOR (3 downto 0);
      sept_seg : out STD_LOGIC_VECTOR (6 downto 0));
	end component;
	
	component hex_state_mux port(
		hex_un : in STD_LOGIC_VECTOR (3 downto 0);
		hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
		hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
		hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
		hex_courant : out STD_LOGIC_VECTOR (3 downto 0);
		etat_courant: in STD_LOGIC_VECTOR (1 downto 0));
	end component;
	 
	signal hex_courant: std_logic_vector (3 downto 0);
	
begin

	hex_to_sept_seg: nb_to_sept_seg port map (
		nombre => hex_courant,
      sept_seg => sept_seg);
		
	mux_hex: hex_state_mux port map (
	hex_un => hex_un,
	hex_deux => hex_deux,
	hex_trois => hex_trois,
	hex_quatre => hex_quatre,
	hex_courant => hex_courant,
	etat_courant => etat_courant);		
		
end Behavioral;