library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect_front_entree is
    Port ( entree : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           front : out  STD_LOGIC);
end detect_front_entree;

architecture Behavioral of detect_front_entree is
	signal detect : std_logic_vector(1 DOWNTO 0) := "00";
begin
	detecteur: process (clk, entree, detect, rst)
	begin
		if (rst = '1') then
			front <= '0';
			detect <= "00";
		elsif (clk'event and clk = '1') then
			detect(1) <= detect(0);
         detect(0) <= entree;
			if (detect = "01") then front <= '1';
			else front <= '0';
         end if;
		end if;
	end process;
end Behavioral;