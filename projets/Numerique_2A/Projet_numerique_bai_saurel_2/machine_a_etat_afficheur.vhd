library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machine_a_etat_afficheur is
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
			  etat_courant: out STD_LOGIC_VECTOR (1 downto 0));
end machine_a_etat_afficheur;

architecture Behavioral of machine_a_etat_afficheur is
	type state is(A0, A1, A2, A3); -- quatre afficheurs
	signal courant, suivant: state;
	
	signal waiter: integer range 0 to 1000;
begin
	etat: process (clk, rst)
	begin
		if (rst = '1') then
			courant <= A0;
			waiter <= 0;
		elsif (clk'event and clk = '1') then
			if (waiter = 1000) then
				waiter <= 0;
				courant <= suivant;
			else
				waiter <= waiter + 1;
			end if;
		end if;
	end process;
	
	calc: process (courant) -- calcul de l'état courant
	begin
		case courant is
			when A0 => suivant <= A1;
			when A1 => suivant <= A2;
			when A2 => suivant <= A3;
			when A3 => suivant <= A0;
		end case;
	end process;
	
	output: process (courant)
	begin
		case courant is
			when A0 => etat_courant <= "00";
			when A1 => etat_courant <= "01";
			when A2 => etat_courant <= "10";
			when A3 => etat_courant <= "11";
		end case;
	end process;
end Behavioral;