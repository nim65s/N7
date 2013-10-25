library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity comparator is
	port( terminal ts, tr, tout: electrical);
end entity comparator;

architecture comp of comparator is
	quantity us across ts to ground;
	quantity ur across irtr to ground;
	quantity uout through tout to ground;
begin
	uout == us * ur;
	isig == 0.0;
	ir == 0.0;
end architecture comp;
