library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity compteur_etalonnage is
    Port ( entree : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           nombre : out STD_LOGIC_VECTOR (13 downto 0);
           gamme : out STD_LOGIC_VECTOR (2 downto 0);
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end compteur_etalonnage;

architecture Behavioral of compteur_etalonnage is
	Signal etalon : STD_LOGIC;
	Signal etat_etalon : STD_LOGIC;
	Signal nombre_buf : integer range 0 to 10000;
	Signal nombre_out : STD_LOGIC_VECTOR (13 downto 0);
	Signal gamme_buf : integer range 0 to 7;
	Signal front : STD_LOGIC;
	
	component un_hertz port (
		clk : in STD_LOGIC;
		rst: in STD_LOGIC;
		etalon : out STD_LOGIC);
	end component;
	
	component detect_front_entree port (
		entree : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		front : out  STD_LOGIC);
	end component;
begin
	etalonnage: un_hertz port map (
		clk => clk,
		rst => rst,
		etalon => etalon);
		
	detecteur: detect_front_entree port map (
		entree => entree,
		clk => clk,
		front => front);
		
	comptage: process (clk, rst, entree, front)
	begin
		if (rst = '1') then 
			etat_etalon <= '0';
			depassement_sup <= '0';
			depassement_inf <= '0';
			nombre_out <= "00000000000000";
		elsif (clk 'event and clk = '1')	then
			if (etat_etalon = etalon) then
				if (front = '1') then
					if (nombre_buf >= 9999) then
						if (gamme_buf = 7) then depassement_sup <= '1';
						else 
							gamme_buf <= gamme_buf + 1;
							nombre_buf <= 0;
						end if;
					else
						nombre_buf <= nombre_buf + 1;
					end if;
				end if;
			else 
				etat_etalon <= etalon;
				if (nombre_buf < 1000) then
					if (gamme_buf = 0) then depassement_inf <= '1';
					else gamme_buf <= gamme_buf - 1;
					end if;
				else nombre_out <= conv_std_logic_vector(nombre_buf,14);
				end if;
				nombre_buf <= 0;
			end if;
		end if;
	end process;
	
	gamme <= conv_std_logic_vector(gamme_buf, 3);
	nombre <= nombre_out;
end Behavioral;