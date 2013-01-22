library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity anti_rebond is
    Port ( rst : in std_logic;
			  bp : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           bp_ar : out  STD_LOGIC);
end anti_rebond;

architecture Behavioral of anti_rebond is
   COMPONENT wait_2ms PORT(
		clk_in : IN  std_logic;
      rst : IN  std_logic;
		output : OUT  std_logic
      );
   END COMPONENT;
	
	type state is(ouvert, ferme);
	signal courant: state;
	
	signal deux_ms: std_logic;
	signal rst_clk: std_logic;
begin
	tempo: wait_2ms PORT MAP (clk, rst_clk, deux_ms);
	
	etat: process (deux_ms, bp, courant, rst, clk)
	begin
		if (rst = '1') then
			rst_clk <= '1';
		elsif (clk'event and clk = '1') then
			if (deux_ms = '1') then
				if (bp = '1' and courant = ouvert) then 
					courant <= ferme;
					rst_clk <= '1';
				elsif (bp = '0' and courant = ferme) then
					courant <= ouvert;
					rst_clk <= '1';
				else
					rst_clk <= '0';
				end if;
			else
				rst_clk <= '0';
			end if;
		end if;
	end process;
	
	sortie: process (courant)
	begin
		if (courant = ouvert) then
			bp_ar <= '0';
		else
			bp_ar <= '1';
		end if;
	end process;
end Behavioral;