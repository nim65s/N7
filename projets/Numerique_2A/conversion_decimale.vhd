library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity conversion_decimale is
    Port ( hex_un : out STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : out STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : out STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : out STD_LOGIC_VECTOR (3 downto 0);
			  pos_point : out STD_LOGIC_VECTOR (3 downto 0);
			  etal_on : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  nombre: in STD_LOGIC_VECTOR (13 downto 0));
end conversion_decimale;


architecture Behavioral of conversion_decimale is
	Signal resultat: integer range 0 to 9999;
	Signal r_m: integer range 0 to 999;
	Signal r_c: integer range 0 to 99;
	Signal milliers, centaines, dizaines, unites: integer range 0 to 9;
begin
	go: process(clk, nombre)
	begin
		if (clk'event and clk = '1') then
			if (conv_integer(unsigned(nombre)) >= 1000) then
				resultat <= conv_integer(unsigned(nombre));
				if (etal_on = '0') then pos_point <= "0100";
				else pos_point <= "0000";
				end if;
			elsif (conv_integer(unsigned(nombre)) >= 100) then
				resultat <= conv_integer(unsigned(nombre))*10;
				if (etal_on = '0') then pos_point <= "1000";
				else pos_point <= "0001";
				end if;
			elsif (conv_integer(unsigned(nombre)) >= 10) then
				resultat <= conv_integer(unsigned(nombre))*100;
				if (etal_on = '0') then pos_point <= "0010";
				else pos_point <= "0010";
				end if;
			else
				resultat <= conv_integer(unsigned(nombre))*1000;
				if (etal_on = '0') then pos_point <= "0100";
				else pos_point <= "0100";
				end if;
			end if;

			--resultat <= conv_integer(unsigned(nombre));
			
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
			
			if (resultat - milliers*1000 > 999 or resultat - milliers*1000 < 0) then 
				r_m <= 0;
				r_c <= 0;
				centaines <= 0;
				dizaines <= 0;
				unites <= 0;
			else
				r_m <= resultat - milliers*1000;
				if (r_m >= 900) then centaines <= 9;
				elsif (r_m >= 800) then centaines <= 8;
				elsif (r_m >= 700) then centaines <= 7;
				elsif (r_m >= 600) then centaines <= 6;
				elsif (r_m >= 500) then centaines <= 5;
				elsif (r_m >= 400) then centaines <= 4;
				elsif (r_m >= 300) then centaines <= 3;
				elsif (r_m >= 200) then centaines <= 2;
				elsif (r_m  >= 100) then centaines <= 1;
				else centaines <= 0;
				end if;
				
				if (r_m - centaines*100 > 99 or r_m - centaines*100 < 0) then 
					r_c <= 0;
					dizaines <= 0;
					unites <= 0;
				else
					r_c <= r_m - centaines*100;
					if (r_c >= 90) then dizaines <= 9;
					elsif (r_c >= 80) then dizaines <= 8;
					elsif (r_c >= 70) then dizaines <= 7;
					elsif (r_c >= 60) then dizaines <= 6;
					elsif (r_c >= 50) then dizaines <= 5;
					elsif (r_c >= 40) then dizaines <= 4;
					elsif (r_c >= 30) then dizaines <= 3;
					elsif (r_c >= 20) then dizaines <= 2;
					elsif (r_c >= 10) then dizaines <= 1;
					else dizaines <= 0;
					end if;
					
					if (r_c - dizaines*10 > 9 or r_c - dizaines*10 < 0) then
						unites <= 0;
					else
						unites <= r_c - dizaines*10;
					end if;
				end if;
			end if;
		end if;
	end process;

	hex_un <= conv_std_logic_vector(milliers,4);
	hex_deux <= conv_std_logic_vector(centaines,4);
	hex_trois <= conv_std_logic_vector(dizaines,4);
	hex_quatre <= conv_std_logic_vector(unites,4);

end Behavioral;