library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity comp_tb is
end entity comp_tb;

architecture bench of comp_tb is
	constant ampl: real := 1.0e-3;
	constant freq: real := 1.0e3;
	constant phase: real := 1.0;
	constant RL: real := 5.0e3;
	terminal ts, tr, tout: electrical;
	quantity us through ts;
	quantity ur through tr;
	quantity uout across iout through tout;
	
begin
	uut: entity comparator(comp)
		port map( ts, tr, tout);
	us == ampl * sin(MATH_2_PI * freq * now + phase);
	ur == ampl * sin(MATH_2_PI * freq * now);
	uout == RL * iout;
end bench;
