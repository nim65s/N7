library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity avg_tb is
end entity avg_tb;

architecture bench of avg_tb is
	terminal a: electrical;
	quantity input across a to ground;
	quantity avg: real;
	signal clk_signal: std_logic;
begin
	clk_unit: entity clock(clk)
		port map( clk_signal );
		
	uut: entity mean(avg)
		port map( clk => clk_signal, tin => a, average => avg);
			
	input == 3.0 * sin(MATH_2_PI * 10000.0 * now) + 5.0 * sin(MATH_2_PI * 100.0 * now);
end bench;
