library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplieur_sept_seg is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  sortie : out std_logic_vector (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sept_seg : out  STD_LOGIC_VECTOR (6 downto 0);
           num_aff : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplieur_sept_seg;

architecture Behavioral of multiplieur_sept_seg is
	component mul_4b port (
		A : in  STD_LOGIC_VECTOR (3 downto 0);
		B : in  STD_LOGIC_VECTOR (3 downto 0);
		M : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component huit_bit_en_decimal port (
		entree : in  STD_LOGIC_VECTOR (7 downto 0);
		clk : in std_logic;
		sortie_un : out  STD_LOGIC_VECTOR (3 downto 0);
		sortie_deux : out  STD_LOGIC_VECTOR (3 downto 0);
		sortie_trois : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component aff_quatre_hex port (
		hex_un : in  STD_LOGIC_VECTOR (3 downto 0);
		hex_deux : in  STD_LOGIC_VECTOR (3 downto 0);
		hex_trois : in  STD_LOGIC_VECTOR (3 downto 0);
		hex_quatre : in  STD_LOGIC_VECTOR (3 downto 0);
		clk : in  STD_LOGIC;
		rst: in std_logic;
		sept_seg : out  STD_LOGIC_VECTOR (6 downto 0);
		quatre_aff : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;	
	
	Signal resultat: std_logic_vector (7 downto 0);
	signal chiffre_un, chiffre_deux, chiffre_trois, chiffre_quatre: std_logic_vector (3 downto 0);
begin
	multiplieur: mul_4b port map (
		A => A,
      B => B,
		M => resultat);
	
	convertisseur: huit_bit_en_decimal port map (
		entree => resultat,
		clk => clk,
		sortie_un => chiffre_deux,
		sortie_deux => chiffre_trois,
		sortie_trois => chiffre_quatre);
	
	afficheur: aff_quatre_hex port map (
		hex_un => chiffre_un,
		hex_deux => chiffre_deux,
		hex_trois => chiffre_trois,
		hex_quatre => chiffre_quatre,
		clk => clk,
		rst => rst,
		sept_seg => sept_seg,
		quatre_aff => num_aff);
		
	chiffre_un <= "0000";
	sortie <= resultat;
end Behavioral;

