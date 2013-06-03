library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity compteur_echantillonnage_megahertz is
    Port ( entree : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nombre : out  STD_LOGIC_VECTOR (13 downto 0);
           depassement_sup : out  STD_LOGIC;
           depassement_inf : out  STD_LOGIC);
end compteur_echantillonnage_megahertz;

architecture Behavioral of compteur_echantillonnage_megahertz is
	Signal nombre_cus : integer range 0 to 10000;
	Signal nombre_out : STD_LOGIC_VECTOR (13 downto 0);
	Signal fin_echantillonnage : STD_LOGIC;
begin
	comptage: process (clk, rst, entree, nombre_out)
	begin
		if (rst = '1') then 
			depassement_sup <= '0';
			depassement_inf <= '0';
			nombre_out <= (others => '0');
			nombre_cus <= 0;
			fin_echantillonnage <= '0';
		elsif (clk'event and clk = '1') then
			if (fin_echantillonnage = '1') then 
				nombre_cus <= 2;
				nombre_out <= nombre_out;
				fin_echantillonnage <= '0';
			elsif (entree = '0') then
				if (nombre_cus >= 10000) then nombre_cus <= 10000;
				else nombre_cus <= nombre_cus + 1;
				end if;
				nombre_out <= nombre_out;
				fin_echantillonnage <= '0';
			else
				if (nombre_cus <= 3) then
					depassement_inf <= '0';
					depassement_sup <= '1';
					nombre_out <= (others => '0');
				elsif (nombre_cus > 9999) then 
					depassement_inf <= '1';
					depassement_sup <= '0';
					nombre_out <= (others => '0');
				else
					depassement_inf <= '0';
					depassement_sup <= '0';
					nombre_out <= conv_std_logic_vector(nombre_cus, 14);
				end if;
				nombre_cus <= nombre_cus;
				fin_echantillonnage <= '1';
			end if;
		end if;
	end process;
	
	nombre <= nombre_out;
	
end Behavioral;