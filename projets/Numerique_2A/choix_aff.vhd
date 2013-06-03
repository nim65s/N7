library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity choix_aff is
    Port ( quatre_aff : out STD_LOGIC_VECTOR (3 downto 0);
			  etat_courant: in STD_LOGIC_VECTOR (1 downto 0));
end choix_aff;

architecture Behavioral of choix_aff is
begin
	choix: process (etat_courant)
	begin
		case etat_courant is
			when "00" => quatre_aff <= "0111";
			when "01" => quatre_aff <= "1011";
			when "10" => quatre_aff <= "1101";
			when others => quatre_aff <= "1110";
		end case;
	end process;
end Behavioral;