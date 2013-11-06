library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity lp_filter is
	generic( F : real := 3000.0);
	port( terminal tin, tout: electrical);
end entity lp_filter;

architecture lp of lp_filter is
	constant C : real := 1.0e-9;
	constant R : real := 1.0/(MATH_2_PI*F*C);
	quantity ur across ir through tin to tout;
	quantity uc across ic through tout to ground;
begin
	ur == R * ir;
	ic == C * uc'dot;
end architecture lp;
