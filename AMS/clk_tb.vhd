library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use work.all;

entity clk_tb is
end entity clk_tb;

architecture bench of clk_tb is
	signal output : std_logic;
begin
	uut: entity clock(clk)
		port map( output);
end bench;
