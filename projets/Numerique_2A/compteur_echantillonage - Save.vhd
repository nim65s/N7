library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity compteur_echantillonage is
    Port ( entree : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           nombre : out STD_LOGIC_VECTOR (13 downto 0);
           gamme : out STD_LOGIC_VECTOR (2 downto 0);
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end compteur_echantillonage;

architecture Behavioral of compteur_echantillonage is
	Signal nombre_buf, nombre_us : integer range 0 to 100000000;
	Signal nombre_out : STD_LOGIC_VECTOR (13 downto 0);
	Signal gamme_buf : integer range 0 to 7;
	Signal front : STD_LOGIC;
	Signal sub_counter : integer range 0 to 1000000;
	
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
			gamme_buf <= 0;
			sub_counter <= 0;
			nombre_out <= "00000000000000";
		elsif (clk 'event and clk = '1')	then
			if (front = '0') then
				sub_counter <= sub_counter + 1;
				if (gamme_buf = 5 and sub_counter >= 10) then
					nombre_buf <= nombre_buf + 1;
					sub_counter <= 0;
				elsif (gamme_buf = 4 and sub_counter >= 100) then
					nombre_buf <= nombre_buf + 1;
					sub_counter <= 0;
				elsif (gamme_buf = 3 and sub_counter >= 1000) then
					nombre_buf <= nombre_buf + 1;
					sub_counter <= 0;
				elsif (gamme_buf = 2 and sub_counter >= 10000) then
					nombre_buf <= nombre_buf + 1;
					sub_counter <= 0;
				elsif (gamme_buf = 1 and sub_counter >= 100000) then
					nombre_buf <= nombre_buf + 1;
					sub_counter <= 0;
				else
					nombre_buf <= nombre_buf + 1;
				end if;
				nombre_out <= nombre_out;
			else
				nombre_us <= nombre_buf*20;
				nombre_out <= conv_std_logic_vector(nombre_us,14);
				if (nombre_us < 100) then
					depassement_inf <= '0';
					depassement_sup <= '1';
					nombre_buf <= 1;
					sub_counter <= 0;
				elsif (nombre_us < 1000) then 
					gamme_buf <= 7;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 1;
					sub_counter <= 0;
				elsif (nombre_us < 10000) then
					gamme_buf <= 6;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 1;
					sub_counter <= 0;
				elsif (nombre_us < 100000) then 
					gamme_buf <= 5;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				elsif (nombre_us < 1000000) then 
					gamme_buf <= 4;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				elsif (nombre_us < 10000000) then 
					gamme_buf <= 3;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				elsif (nombre_us < 10000000) then 
					gamme_buf <= 2;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				elsif (nombre_us < 100000000) then 
					gamme_buf <= 1;
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				else 
					depassement_inf <= '1';
					depassement_sup <= '0';
					nombre_buf <= 0;
					sub_counter <= 1;
				end if;
			end if;
		end if;
	end process;
	
	gamme <= conv_std_logic_vector(gamme_buf, 3);
	nombre <= nombre_out;
	
end Behavioral;