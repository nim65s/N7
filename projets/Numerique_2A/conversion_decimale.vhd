library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity conversion_decimale is
    Port ( hex_un : out STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : out STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : out STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  nombre: in STD_LOGIC_VECTOR (13 downto 0));
end conversion_decimale;


architecture Behavioral of conversion_decimale is
	Signal resultat: integer range 0 to 9999;
	Signal milliers, centaines, dizaines, unites: integer range 0 to 9;
begin
	go: process(clk, nombre)
	begin
		if (clk'event and clk = '1') then
			resultat <= conv_integer(unsigned(nombre));
			if (resultat >= 9000) then milliers <= 9;
			elsif (resultat >= 8000) then milliers <= 8;
			elsif (resultat >= 7000) then milliers <= 7;
			elsif (resultat >= 6000) then milliers <= 6;
			elsif (resultat >= 5000) then milliers <= 5;
			elsif (resultat >= 4000) then milliers <= 4;
			elsif (resultat >= 3000) then milliers <= 3;
			elsif (resultat >= 2000) then milliers <= 2;
			elsif (resultat >= 1000) then milliers <= 1;
			else milliers <= 0;
			end if;
			
			resultat <= resultat - milliers*1000;
			if (resultat >= 900) then centaines <= 9;
			elsif (resultat >= 800) then centaines <= 8;
			elsif (resultat >= 700) then centaines <= 7;
			elsif (resultat >= 600) then centaines <= 6;
			elsif (resultat >= 500) then centaines <= 5;
			elsif (resultat >= 400) then centaines <= 4;
			elsif (resultat >= 300) then centaines <= 3;
			elsif (resultat >= 200) then centaines <= 2;
			elsif (resultat  >= 100) then centaines <= 1;
			else centaines <= 0;
			end if;
			
			resultat <= resultat - centaines*100;
			if (resultat >= 90) then dizaines <= 9;
			elsif (resultat >= 80) then dizaines <= 8;
			elsif (resultat >= 70) then dizaines <= 7;
			elsif (resultat >= 60) then dizaines <= 6;
			elsif (resultat >= 50) then dizaines <= 5;
			elsif (resultat >= 40) then dizaines <= 4;
			elsif (resultat >= 30) then dizaines <= 3;
			elsif (resultat >= 20) then dizaines <= 2;
			elsif (resultat >= 10) then dizaines <= 1;
			else dizaines <= 0;
			end if;
			
			unites <= resultat - dizaines*10;
		end if;
	end process;

	hex_un <= conv_std_logic_vector(milliers,4);
	hex_deux <= conv_std_logic_vector(centaines,4);
	hex_trois <= conv_std_logic_vector(dizaines,4);
	hex_quatre <= conv_std_logic_vector(unites,4);

end Behavioral;