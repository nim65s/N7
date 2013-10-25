library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity opamp is
	generic( gain: real := 1.0e5);
	port( terminal tip, tim, tout: electrical);
end entity opamp;

architecture oa of opamp is
	quantity ui across ii through tip to tim;
	quantity uo through tout to ground;
begin
	uo == gain * ui;
	ii == 0.0;
end architecture oa;
