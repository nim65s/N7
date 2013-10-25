library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity main is
	generic( D, theta : real);
	port( terminal tout: electrical);
end entity main;

architecture bench of main is
	terminal tlo: electrical;
begin
	osc: entity oscillator(osc)
		generic( ampl => 1.0, freq => 1.0e3, phase 0.0)
		port map(tlo);
	mix1: entity mixer(mix)
		
end bench;
