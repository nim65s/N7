library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity wait_2ms is
    Port ( rst : in  STD_LOGIC;
			  clk_in : in  STD_LOGIC;
           output : out  STD_LOGIC);
end wait_2ms;

-- garde output à 1 si au moins 2ms se sont écoulées depuis le dernier rst

architecture Behavioral of wait_2ms is
	component div port (
		rst : in  STD_LOGIC;
	   clk_in : in  STD_LOGIC;
	   clk_out : out  STD_LOGIC);
	end component;
	
	component detecteur_de_front_montant port (
		clk : in STD_LOGIC;
		entree : in  STD_LOGIC;
      sortie : out  STD_LOGIC);
	end component;
	
	signal clk_div : std_logic;
	signal deux_ms : std_logic;
	signal out_buf : std_logic;
begin
	diviseur : div port map (
		rst => rst,
		clk_in => clk_in,
		clk_out => clk_div);
		
	detecteur : detecteur_de_front_montant port map (
		clk => clk_in,
		entree => clk_div,
		sortie => deux_ms);
		
	sortie: process (deux_ms, rst, out_buf)
	begin
		if (rst = '1') then
			out_buf <= '0';
		elsif (deux_ms = '1') then
			out_buf <= '1';
		else
			out_buf <= out_buf;
		end if;
	end process;
	
	output <= out_buf;
end Behavioral;