library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity quatre_incrementeurs is
    Port ( bp_un : in  STD_LOGIC;
			  bp_deux : in  STD_LOGIC;
			  bp_trois : in  STD_LOGIC;
			  bp_quatre : in  STD_LOGIC;
			  clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
           sept_seg : out  STD_LOGIC_VECTOR (6 downto 0);
           quatre_aff : out  STD_LOGIC_VECTOR (3 downto 0));
end quatre_incrementeurs;

architecture Behavioral of quatre_incrementeurs is
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
	
	component anti_rebond port ( 
		rst : in std_logic;
		bp : in  STD_LOGIC;
      clk : in  STD_LOGIC;
      bp_ar : out  STD_LOGIC);
	end component;
	
	component detecteur_de_front_montant port (
		clk : in  STD_LOGIC;
		entree : in  STD_LOGIC;
		sortie : out  STD_LOGIC);
	end component;
	
	signal hex_un, hex_deux, hex_trois, hex_quatre : std_logic_vector (3 downto 0);
	signal nombre_un, nombre_deux, nombre_trois, nombre_quatre : integer range 0 to 15;
	signal etat_bp_un, etat_bp_deux, etat_bp_trois, etat_bp_quatre: std_logic;
	signal front_bp_un, front_bp_deux, front_bp_trois, front_bp_quatre: std_logic;
begin
	uut: aff_quatre_hex port map (
		hex_un => hex_un,
		hex_deux => hex_deux,
		hex_trois => hex_trois,
		hex_quatre => hex_quatre,
		clk => clk,
		rst => rst,
		sept_seg => sept_seg,
		quatre_aff => quatre_aff);
	
	detecteur_bp_un: anti_rebond port map (
		rst => rst,
		bp => bp_un,
		clk => clk,
		bp_ar => etat_bp_un);
	
	detecteur_bp_deux: anti_rebond port map (
		rst => rst,
		bp => bp_deux,
		clk => clk,
		bp_ar => etat_bp_deux);
		
	detecteur_bp_trois: anti_rebond port map (
		rst => rst,
		bp => bp_trois,
		clk => clk,
		bp_ar => etat_bp_trois);
		
	detecteur_bp_quatre: anti_rebond port map (
		rst => rst,
		bp => bp_quatre,
		clk => clk,
		bp_ar => etat_bp_quatre);
		
	detecteur_front_bp_un: detecteur_de_front_montant port map (
		clk => clk,
		entree => etat_bp_un,
		sortie => front_bp_un);
		
	detecteur_front_bp_deux: detecteur_de_front_montant port map (
		clk => clk,
		entree => etat_bp_deux,
		sortie => front_bp_deux);
		
	detecteur_front_bp_trois: detecteur_de_front_montant port map (
		clk => clk,
		entree => etat_bp_trois,
		sortie => front_bp_trois);
		
	detecteur_front_bp_quatre: detecteur_de_front_montant port map (
		clk => clk,
		entree => etat_bp_quatre,
		sortie => front_bp_quatre);
	
	compteurs : process (front_bp_un, front_bp_deux, front_bp_trois, front_bp_quatre, rst, clk)
	begin
		if (rst = '1') then
			nombre_un <= 0;
			nombre_deux <= 0;
			nombre_trois <= 0;
			nombre_quatre <= 0;
		elsif (clk'event and clk = '1') then
			if (front_bp_un = '1') then nombre_un <= nombre_un + 1;
			else nombre_un <= nombre_un;
			end if;
			if (front_bp_deux = '1') then nombre_deux <= nombre_deux + 1;
			else nombre_deux <= nombre_deux;
			end if;
			if (front_bp_trois = '1') then nombre_trois <= nombre_trois + 1;
			else nombre_trois <= nombre_trois;
			end if;
			if (front_bp_quatre = '1') then nombre_quatre <= nombre_quatre + 1;
			else nombre_quatre <= nombre_quatre;
			end if;
		end if;
	end process;
	
	hex_un <= conv_std_logic_vector(nombre_un, 4);
	hex_deux <= conv_std_logic_vector(nombre_deux, 4);
	hex_trois <= conv_std_logic_vector(nombre_trois, 4);
	hex_quatre <= conv_std_logic_vector(nombre_quatre, 4);
end Behavioral;

