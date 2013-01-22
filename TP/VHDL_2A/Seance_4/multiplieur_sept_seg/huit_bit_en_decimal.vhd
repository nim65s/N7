library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity huit_bit_en_decimal is
    Port ( entree : in  STD_LOGIC_VECTOR (7 downto 0);
			  clk : in std_logic;
           sortie_un : out  STD_LOGIC_VECTOR (3 downto 0);
           sortie_deux : out  STD_LOGIC_VECTOR (3 downto 0);
           sortie_trois : out  STD_LOGIC_VECTOR (3 downto 0));
end huit_bit_en_decimal;

architecture Behavioral of huit_bit_en_decimal is
	Signal resultat: integer range 0 to 255;
	Signal centaines: integer range 0 to 2;
	Signal dizaines, unites: integer range 0 to 9;
begin
	go: process(clk, entree)
	begin
		if (clk'event and clk = '1') then
			resultat <= conv_integer(unsigned(entree));
			if    (resultat >= 200) then centaines <= 2;
			elsif (resultat >= 100) then centaines <= 1;
			else centaines <= 0;
			end if;
			if    (resultat - centaines*100 >= 90) then dizaines <= 9;
			elsif (resultat - centaines*100 >= 80) then dizaines <= 8;
			elsif (resultat - centaines*100 >= 70) then dizaines <= 7;
			elsif (resultat - centaines*100 >= 60) then dizaines <= 6;
			elsif (resultat - centaines*100 >= 50) then dizaines <= 5;
			elsif (resultat - centaines*100 >= 40) then dizaines <= 4;
			elsif (resultat - centaines*100 >= 30) then dizaines <= 3;
			elsif (resultat - centaines*100 >= 20) then dizaines <= 2;
			elsif (resultat - centaines*100 >= 10) then dizaines <= 1;
			else dizaines <= 0;
			end if;
			unites <= resultat - centaines*100 - dizaines*10;
		end if;
	end process;
	
	sortie_un <= conv_std_logic_vector(centaines,4);
	sortie_deux <= conv_std_logic_vector(dizaines,4);
	sortie_trois <= conv_std_logic_vector(unites,4);
	
end Behavioral;

