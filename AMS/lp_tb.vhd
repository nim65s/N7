library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity lp_tb is
end entity lp_tb;

architecture bench of lp_tb is
	terminal tin, tout: electrical;
	quantity usrc across isrc through tin;
	quantity uac: real spectrum 1.0, 0.0;
begin
	uut: entity lp_filter(lp)
		port map( tin, tout);
	usrc == uac;
end bench;
