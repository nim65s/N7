library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;

entity compteur is
    Port ( entree : in  STD_LOGIC;
			  rst : in std_logic;
			  clk : in std_logic;
           sortie : out  STD_LOGIC_VECTOR (3 downto 0));
end compteur;

architecture Behavioral of compteur is
	component detecteur_de_front_montant port (
		clk : in STD_LOGIC;
		entree : in  STD_LOGIC;
      sortie : out  STD_LOGIC);
	end component;
	signal cmpt : std_logic_vector (3 downto 0);
	signal detect : std_logic;
begin
	detecteur : detecteur_de_front_montant port map (
		clk => clk,
		entree => entree,
		sortie => detect);

	compte : process (clk, detect, rst)
	begin
		if (rst = '1') then
			cmpt <= "0000";
		elsif (clk'event and clk = '1') then
			if (detect = '1') then
				cmpt <= cmpt + 1;
			else
				cmpt <= cmpt;
			end if;
		end if;
	end process;
	
	sortie <= cmpt;
end Behavioral;