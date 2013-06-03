library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity compteur_echantillonnage is
    Port ( entree : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           nombre : out STD_LOGIC_VECTOR (13 downto 0);
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end compteur_echantillonnage;

architecture Behavioral of compteur_echantillonnage is
	Signal nombre_buf, nombre_dus : integer range 0 to 10000;
	Signal clk_count : integer range 0 to 5;
	Signal nombre_out : STD_LOGIC_VECTOR (13 downto 0);
	Signal front : STD_LOGIC;
	
	component detect_front_entree port (
		entree : in STD_LOGIC;
		clk : in STD_LOGIC;
		front : out STD_LOGIC);
	end component;
begin
	detecteur: detect_front_entree port map (
		entree => entree,
		clk => clk,
		front => front);
	
	comptage: process (clk, rst, entree, front, nombre_out)
	begin
		if (rst = '1') then 
			depassement_sup <= '0';
			depassement_inf <= '0';
			nombre_out <= (others => '0');
			nombre_dus <= 0;
		elsif (clk 'event and clk = '1')	then
			if (front = '0') then
				if (clk_count = 5) then
					if (nombre_dus = 10000) then nombre_dus <= nombre_dus;
					else nombre_dus <= nombre_dus + 1;
					end if;
					clk_count <= 1;
				else
					clk_count <= clk_count + 1;
				end if;
				nombre_out <= nombre_out;
			else
				if (nombre_dus < 1) then
					depassement_inf <= '0';
					depassement_sup <= '1';
					nombre_out <= (others => '0');
					nombre_dus <= nombre_dus;
				elsif (nombre_dus > 9999) then 
					depassement_inf <= '1';
					depassement_sup <= '0';
					nombre_out <= (others => '0');
					nombre_dus <= nombre_dus;
				else
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_out <= conv_std_logic_vector(nombre_dus, 14);
					nombre_dus <= 0;
				end if;
			end if;
		end if;
	end process;
	
	nombre <= nombre_out;
	
end Behavioral;