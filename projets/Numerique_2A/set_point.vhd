library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity set_point is
    Port ( point: out STD_LOGIC;
			  etat_courant: in STD_LOGIC_VECTOR (1 downto 0);
			  gamme: in STD_LOGIC_VECTOR (2 downto 0));
end set_point;

architecture Behavioral of set_point is
begin
	set_point: process (gamme, etat_courant)
	begin
		case etat_courant is
			when "00" => 
				if (gamme = "000" or gamme = "011" or gamme = "110") then point <= '0';
				else point <= '1';
				end if;
			when "01" => 
				if (gamme = "001" or gamme = "100" or gamme = "111") then point <= '0';
				else point <= '1';
				end if;
			when "10" => 
				if (gamme = "010" or gamme = "101") then point <= '0';
				else point <= '1';
				end if;
			when others => 
				point <= '1';
		end case;
	end process;
end Behavioral;