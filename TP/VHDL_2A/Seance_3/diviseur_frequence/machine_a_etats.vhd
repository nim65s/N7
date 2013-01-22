library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machine_a_etats is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sens : in  STD_LOGIC;
			  change_etat : in STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (3 downto 0));
end machine_a_etats;

architecture Behavioral of machine_a_etats is	
	type state is(E0, E1, E2, E3); -- Différents états possible
	signal courant, suivant: state;
begin	
	etat: process (clk, rst)
	begin
		if (rst = '1') then
			courant <= E0;
		elsif (clk'event and clk = '1') then
			courant <= suivant;
		end if;
	end process;
	
	calc: process (courant, sens, change_etat) -- calcul de l'état courant
	begin
		case courant is
			when E0 =>
				if (change_etat = '1' and sens = '1') then
					suivant <= E1;
				elsif (change_etat = '1' and sens = '0') then
					suivant <= E3;
				else
					suivant <= E0;
				end if;
			when E1 =>
				if (change_etat = '1' and sens = '1') then
					suivant <= E2;
				elsif (change_etat = '1' and sens = '0') then
					suivant <= E0;
				else
					suivant <= E1;
				end if;
			when E2 =>
				if (change_etat = '1' and sens = '1') then
					suivant <= E3;
				elsif (change_etat = '1' and sens = '0') then
					suivant <= E1;
				else
					suivant <= E2;
				end if;
			when E3 =>
				if (change_etat = '1' and sens = '1') then
					suivant <= E0;
				elsif (change_etat = '1' and sens = '0') then
					suivant <= E2;
				else
					suivant <= E3;
				end if;
		end case;
	end process;
	
	sortie: process (courant)
	begin
		case courant is
			when E0 => Q <= "0001";
			when E1 => Q <= "0010";
			when E2 => Q <= "0100";
			when E3 => Q <= "1000";
		end case;
	end process;
end Behavioral;