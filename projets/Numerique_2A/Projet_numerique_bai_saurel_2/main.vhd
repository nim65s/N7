library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           sept_seg : out STD_LOGIC_VECTOR (6 downto 0);
           quatre_aff : out STD_LOGIC_VECTOR (3 downto 0);
			  point: out STD_LOGIC;
			  leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
			  entree: in STD_LOGIC;
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end main;

architecture Behavioral of main is
	signal nombre: STD_LOGIC_VECTOR (13 downto 0);
	signal gamme: STD_LOGIC_VECTOR (2 downto 0);
	signal hex_un: STD_LOGIC_VECTOR (3 downto 0);
	signal hex_deux: STD_LOGIC_VECTOR (3 downto 0);
	signal hex_trois: STD_LOGIC_VECTOR (3 downto 0);
	signal hex_quatre: STD_LOGIC_VECTOR (3 downto 0);
	
	component afficheur port (
		hex_un : in STD_LOGIC_VECTOR (3 downto 0);
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
	end component;
	
	component conversion_decimale port (
		hex_un : out STD_LOGIC_VECTOR (3 downto 0);
		hex_deux : out STD_LOGIC_VECTOR (3 downto 0);
		hex_trois : out STD_LOGIC_VECTOR (3 downto 0);
		hex_quatre : out STD_LOGIC_VECTOR (3 downto 0);
		clk : in  STD_LOGIC;
		nombre: in STD_LOGIC_VECTOR (13 downto 0));
	end component;
	
	component compteur_etalonnage port (
		entree : in STD_LOGIC;
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		nombre : out STD_LOGIC_VECTOR (13 downto 0);
		gamme : out STD_LOGIC_VECTOR (2 downto 0);
		depassement_sup : out STD_LOGIC;
		depassement_inf : out STD_LOGIC);
	end component;
	
begin

	affichage: afficheur port map (
		hex_un => hex_un,
		hex_deux => hex_deux,
		hex_trois => hex_trois,
		hex_quatre => hex_quatre,
		clk => clk,
		rst => rst,
		sept_seg => sept_seg,
		quatre_aff => quatre_aff,
		point => point,
		leds_gamme => leds_gamme,
		gamme => gamme);
		
	convertisseur: conversion_decimale port map (
		hex_un => hex_un,
		hex_deux => hex_deux,
		hex_trois => hex_trois,
		hex_quatre => hex_quatre,
		clk => clk,
		nombre => nombre);
		
	comptage: compteur_etalonnage port map (
		entree => entree,
		clk => clk,
		rst => rst,
		nombre => nombre,
		gamme => gamme,
		depassement_sup => depassement_sup,
		depassement_inf => depassement_inf);

end Behavioral;