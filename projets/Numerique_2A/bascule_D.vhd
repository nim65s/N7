library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity bascule_D is
    Port ( nombre_in : in  STD_LOGIC_VECTOR (13 downto 0);
           nombre_out : out  STD_LOGIC_VECTOR (13 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end bascule_D;

architecture Behavioral of bascule_D is
	component un_hertz port (
		clk : in STD_LOGIC;
		rst: in STD_LOGIC;
		etalon : out STD_LOGIC);
	end component;
	
	Signal etat_etalon, etalon : STD_LOGIC;
	Signal nombre_buf : STD_LOGIC_VECTOR (13 downto 0);
begin
	gestion_frequence: un_hertz port map (
		clk => clk,
		rst => rst,
		etalon => etalon);
		
	bascule: process (clk, rst, nombre_in, etat_etalon, etalon, nombre_buf)
	begin
		if (rst = '1') then 
			etat_etalon <= etalon;
		elsif (clk 'event and clk = '1')	then
			if (etat_etalon = etalon) then
				nombre_buf <= nombre_buf;
				etat_etalon <= etat_etalon;
			else
				nombre_buf <= nombre_in;
				etat_etalon <= etalon;
			end if;
		end if;
	end process;

	nombre_out <= nombre_buf;
end Behavioral;