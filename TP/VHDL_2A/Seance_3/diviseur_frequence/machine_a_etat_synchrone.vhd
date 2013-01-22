library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machine_a_etat_synchrone is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sens : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end machine_a_etat_synchrone;

architecture Behavioral of machine_a_etat_synchrone is
	component machine_a_etats port (
		clk : in  STD_LOGIC;
	   rst : in  STD_LOGIC;
	   sens : in  STD_LOGIC;
	   change_etat : in STD_LOGIC;
	   Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component div port (
		rst : in  STD_LOGIC;
	   clk_in : in  STD_LOGIC;
	   clk_out : out  STD_LOGIC);
	end component;
	
	component detecteur_de_front_montant port (
		clk : in STD_LOGIC;
		entree : in  STD_LOGIC;
      sortie : out  STD_LOGIC);
	end component;
	
	signal clk_div : std_logic;
	signal change_etat : std_logic;
begin
	MaE : machine_a_etats port map (
		clk => clk,
		rst => rst,
		sens => sens,
		change_etat => change_etat,
		Q => Q);
	
	diviseur : div port map (
		rst => rst,
		clk_in => clk,
		clk_out => clk_div);
		
	detecteur : detecteur_de_front_montant port map (
		clk => clk,
		entree => clk_div,
		sortie => change_etat);
end Behavioral;