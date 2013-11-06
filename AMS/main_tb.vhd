library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity main_tb is
end entity main_tb;

architecture bench of main_tb is
	terminal tout: electrical;
begin
	uut: entity main(bench)
		generic map( D => 1.0 , theta => 0.0)
		port map( tout);
end bench;
