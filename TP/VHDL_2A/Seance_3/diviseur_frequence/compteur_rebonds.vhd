library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compteur_rebonds is
    Port ( bp : in  STD_LOGIC;
			  rst : in std_logic;
			  clk : in std_logic;
           cmpt_avec_rebond : out  STD_LOGIC_VECTOR (3 downto 0);
           cmpt_anti_rebond : out  STD_LOGIC_VECTOR (3 downto 0));
end compteur_rebonds;

architecture Behavioral of compteur_rebonds is
   COMPONENT anti_rebond PORT(
		rst : in std_logic;
      bp : IN  std_logic;
      clk : IN  std_logic;
      bp_ar : OUT  std_logic);
   END COMPONENT;
	
	component compteur port(
		entree : in std_logic;
		rst : in std_logic;
		clk : in std_logic;
		sortie : out std_logic_vector (3 downto 0));
	end component;
	 
	signal bp_ar : std_logic;
begin
	uut: anti_rebond PORT MAP (
		rst => rst,
      bp => bp,
      clk => clk,
      bp_ar => bp_ar);

	compteur_avec_rebonds : compteur port map (
		entree => bp,
		rst => rst,
		clk => clk,
		sortie => cmpt_avec_rebond);
		
	compteur_sans_rebonds : compteur port map (
		entree => bp_ar,
		rst => rst,
		clk => clk,
		sortie => cmpt_anti_rebond);
end Behavioral;

