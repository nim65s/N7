library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity photo_diode is
	generic( Sl : real := 0.5);
	port( terminal tpd: electrical; quantity Popt: in real);
end entity photo_diode;

architecture pd of photo_diode is 
	quantity V across Iph through tpd to ground;
begin
	Iph == Sl * Popt;
end architecture pd;
