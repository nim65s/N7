library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity machine_a_etats is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sens : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  clk_out: out std_logic);
end machine_a_etats;

architecture Behavioral of machine_a_etats is
   COMPONENT div PORT(
		clk_in : IN  std_logic;
      rst : IN  std_logic;
		clk_out : OUT  std_logic
      );
   END COMPONENT;
	
   signal clk_div : std_logic;
	type state is(E0, E1, E2, E3);
	signal courant, suivant: state;
	
begin
   diviseur: div PORT MAP (clk, rst, clk_div);
	
	etat: process (clk_div, rst)
	begin
		if (rst = '1') then
			courant <= E0;
		elsif (clk_div'event and clk_div = '1') then
			courant <= suivant;
		end if;
	end process;
	
	calc: process (courant, sens) -- calcul de l'état courant
	begin
		if (sens = '1') then
			case courant is
				when E0 => suivant <= E1;
				when E1 => suivant <= E2;
				when E2 => suivant <= E3;
				when E3 => suivant <= E0;
			end case;
		else
			case courant is
				when E0 => suivant <= E3;
				when E1 => suivant <= E0;
				when E2 => suivant <= E1;
				when E3 => suivant <= E2;
			end case;
		end if;
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
	
	clk_out <= clk_div;
end Behavioral;