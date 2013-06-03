library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity conversion_decimale is
    Port ( hex_un : out STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : out STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : out STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  gamme : out STD_LOGIC_VECTOR (2 downto 0);
			  nombre: in STD_LOGIC_VECTOR (26 downto 0));
end conversion_decimale;


architecture Behavioral of conversion_decimale is
	--Signal scratch : std_logic_vector(62 downto 0);
	Signal scratch : integer range 0 to 100000000;
begin
	comptage: process (clk, rst, nombre)
	begin
		if (rst = '1') then
			scratch <= 0;
		elsif (clk'event and clk = '1') then
			scratch <= conv_integer(nombre);
			for I in 0 to 62 loop
				scratch <= nombre sll 1;
				for J in 1 to 9 loop
					if (scratch(26+J*4 downto 30+J*4) > "0100") then
					
					end if;
				end loop;
			end loop;
		end if;
	end process;
end Behavioral;