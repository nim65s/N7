library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nb_to_sept_seg is
    Port ( nombre : in  STD_LOGIC_VECTOR (3 downto 0);
           sept_seg : out  STD_LOGIC_VECTOR (6 downto 0));
end nb_to_sept_seg;

architecture Behavioral of nb_to_sept_seg is
begin
	go: process(nombre)
	begin
		case (nombre) is 
			when "0000" => sept_seg <= "0000001";
			when "0001" => sept_seg <= "1001111";
			when "0010" => sept_seg <= "0010010";
			when "0011" => sept_seg <= "0000110";
			when "0100" => sept_seg <= "1001100";
			when "0101" => sept_seg <= "0100100";
			when "0110" => sept_seg <= "0100000";
			when "0111" => sept_seg <= "0001111";
			when "1000" => sept_seg <= "0000000";
			when "1001" => sept_seg <= "0000100";
			when "1010" => sept_seg <= "0001000";
			when "1011" => sept_seg <= "1100000";
			when "1100" => sept_seg <= "0110001";
			when "1101" => sept_seg <= "1000010";
			when "1110" => sept_seg <= "0110000";
			when others => sept_seg <= "0111000";
		end case;
	end process;
end Behavioral;