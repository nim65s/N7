library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sept_seg is
    Port ( valeur : in  STD_LOGIC_VECTOR(3 downto 0);
           affich : out  STD_LOGIC_VECTOR(7 downto 0));
end sept_seg;

architecture Behavioral of sept_seg is
begin
	process(valeur)
	begin
		case valeur is
			when "0000" => affich <= "00000011";
			when "0001" => affich <= "10011111";
			when "0010" => affich <= "00100101";
			when "0011" => affich <= "00001101";
			when "0100" => affich <= "10011001";
			when "0101" => affich <= "01001001";
			when "0110" => affich <= "01000001";
			when "0111" => affich <= "00011111";
			when "1000" => affich <= "00000001";
			when "1001" => affich <= "00001001";
			when "1010" => affich <= "00010001";
			when "1011" => affich <= "11000001";
			when "1100" => affich <= "01100011";
			when "1101" => affich <= "10000101";
			when "1110" => affich <= "01100001";
			when "1111" => affich <= "01110001";
			when others => null;
		end case;
	end process;
end Behavioral;