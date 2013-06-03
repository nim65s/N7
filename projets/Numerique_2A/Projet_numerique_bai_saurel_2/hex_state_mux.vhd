library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_state_mux is
    Port ( hex_un : in STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
			  hex_courant : out STD_LOGIC_VECTOR (3 downto 0);
			  etat_courant: in STD_LOGIC_VECTOR (1 downto 0));
end hex_state_mux;

architecture Behavioral of hex_state_mux is
begin
	state_muxer: process (hex_un, hex_deux, hex_trois, hex_quatre, etat_courant)
	begin
		case etat_courant is
			when "00" => hex_courant <= hex_un;
			when "01" => hex_courant <= hex_deux;
			when "10" => hex_courant <= hex_trois;
			when others => hex_courant <= hex_quatre;
		end case;
	end process;
end Behavioral;