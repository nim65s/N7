library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity aff_quatre_hex is
    Port ( hex_un : in STD_LOGIC_VECTOR (3 downto 0);
           hex_deux : in STD_LOGIC_VECTOR (3 downto 0);
           hex_trois : in STD_LOGIC_VECTOR (3 downto 0);
           hex_quatre : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           sept_seg : out STD_LOGIC_VECTOR (6 downto 0);
           quatre_aff : out STD_LOGIC_VECTOR (3 downto 0);
			  point: out STD_LOGIC;
			  leds_gamme: out STD_LOGIC_VECTOR (2 downto 0);
			  gamme: in STD_LOGIC_VECTOR (2 downto 0));
end aff_quatre_hex;

architecture Behavioral of aff_quatre_hex is
	type state is(A0, A1, A2, A3); -- quatre afficheurs
	signal courant, suivant: state;
	
	component nb_to_sept_seg port(
		nombre : in STD_LOGIC_VECTOR (3 downto 0);
      sept_seg : out STD_LOGIC_VECTOR (6 downto 0));
	end component;
	 
	signal hex_courant: std_logic_vector (3 downto 0);
	signal waiter: integer range 0 to 1000;
begin
	hex_to_sept_seg: nb_to_sept_seg port map (
		nombre => hex_courant,
      sept_seg => sept_seg);
	
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

	set_sept_seg: process (hex_un, hex_deux, hex_trois, hex_quatre, courant)
	begin
		case courant is
			when A0 => 
				hex_courant <= hex_un;
				quatre_aff <= "0111";
			when A1 => 
				hex_courant <= hex_deux;
				quatre_aff <= "1011";
			when A2 => 
				hex_courant <= hex_trois;
				quatre_aff <= "1101";
			when A3 => 
				hex_courant <= hex_quatre;
				quatre_aff <= "1110";
		end case;
	end process;
	
	set_gamme: process (gamme, courant)
	begin
		case courant is
			when A0 => 
				hex_courant <= hex_un;
				quatre_aff <= "0111";
			when A1 => 
				hex_courant <= hex_deux;
				quatre_aff <= "1011";
			when A2 => 
				hex_courant <= hex_trois;
				quatre_aff <= "1101";
			when A3 => 
				hex_courant <= hex_quatre;
				quatre_aff <= "1110";
		end case;
	end process;
end Behavioral;