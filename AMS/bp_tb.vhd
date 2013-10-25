library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity bp_tb is
end entity bp_tb;

architecture bench of bp_tb is
	terminal tin, tout: electrical;
	quantity usrc across isrc through tin;
	quantity uac: real spectrum 1.0, 0.0;
begin
	uut: entity filter(bp)
		port map( tin, tout);
	usrc == uac;
end bench;
