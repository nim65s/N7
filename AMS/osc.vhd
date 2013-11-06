library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity oscillator is
	generic( ampl, freq, phase : real);
	port( terminal tout : electrical);
end entity oscillator;

architecture osc of oscillator is 
	quantity v across i through tout to ground;
	--limit v: real with 1.0/(freq*50.0); -- at least 50 points per period
begin
	v == ampl * sin(MATH_2_PI*freq*NOW + phase);
end architecture osc;

