library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity compteur_etalonnage is
    Port ( entree : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           nombre : out STD_LOGIC_VECTOR (13 downto 0);
			  depassement_sup : out STD_LOGIC;
			  depassement_inf : out STD_LOGIC);
end compteur_etalonnage;

architecture Behavioral of compteur_etalonnage is
	Signal etalon, etat_etalon, fin_etalonnage : STD_LOGIC;
	Signal nombre_buf, nombre_buf_2 : integer range 0 to 10000;
	Signal nombre_out : STD_LOGIC_VECTOR (13 downto 0);
	
	component un_hertz port (
		clk : in STD_LOGIC;
		rst: in STD_LOGIC;
		etalon : out STD_LOGIC);
	end component;
begin
	etalonnage: un_hertz port map (
		clk => clk,
		rst => rst,
		etalon => etalon); 
		
	comptage: process (clk, rst, entree, nombre_out, etalon, fin_etalonnage, etat_etalon)
	begin
		if (rst = '1') then 
			etat_etalon <= etalon;
			nombre_buf <= 0;
			fin_etalonnage <= '0';
		elsif (clk'event and clk = '1')	then
			if (fin_etalonnage = '1') then 
				nombre_buf <= 0;
				nombre_buf_2 <= nombre_buf_2;
				fin_etalonnage <= '0';
				etat_etalon <= etat_etalon;
			elsif (etat_etalon = etalon) then
				if (entree = '1' and nombre_buf < 10000) then nombre_buf <= nombre_buf + 1;
				else nombre_buf <= nombre_buf;
				end if;
				fin_etalonnage <= fin_etalonnage;
				etat_etalon <= etat_etalon;
				nombre_buf_2 <= nombre_buf_2;
			else 
				etat_etalon <= etalon;
				if (etat_etalon = '1') then 
					nombre_buf <= nombre_buf;
					nombre_buf_2 <= nombre_buf_2;
					fin_etalonnage <= fin_etalonnage;
				else
					fin_etalonnage <= '1';
					nombre_buf_2 <= nombre_buf;
					nombre_buf <= nombre_buf;
				end if;
			end if;
		end if;
	end process;
	
	sorties: process (nombre_buf_2, clk, rst)
	begin
		if (rst = '1') then
			depassement_sup <= '0';
			depassement_inf <= '0';
			nombre_out <= (others => '0');
		elsif (clk'event and clk = '1') then
			if (nombre_buf_2 < 1) then 
				depassement_inf <= '1';
				depassement_sup <= '0';
				nombre_out <= (others => '0');
			elsif (nombre_buf_2 >= 10000) then
				depassement_inf <= '0';
				depassement_sup <= '1';
				nombre_out <= (others => '0');
			else
				depassement_sup <= '0';
				depassement_inf <= '0';
				nombre_out <= conv_std_logic_vector(nombre_buf_2, 14);
			end if;
		end if;
	end process;
	
	nombre <= nombre_out;
	
end Behavioral;