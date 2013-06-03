library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity position_point is
    Port ( point: out STD_LOGIC;
			  etat_courant: in STD_LOGIC_VECTOR (1 downto 0);
			  pos_point: in STD_LOGIC_VECTOR (3 downto 0));
end position_point;

architecture Behavioral of position_point is
begin
	set_point: process (pos_point, etat_courant)
	begin
		case etat_courant is
			when "00" => 
				if (pos_point = "1000") then point <= '0';
				else point <= '1';
				end if;
			when "01" => 
				if (pos_point = "0100") then point <= '0';
				else point <= '1';
				end if;
			when "10" => 
				if (pos_point = "0010") then point <= '0';
				else point <= '1';
				end if;
			when others => 
				if (pos_point = "0001") then point <= '0';
				else point <= '1';
				end if;
		end case;
	end process;
end Behavioral;