library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity filter is
	generic( FP1 : real := 4.9e3; FP2 : real := 5.1e3);
	port( terminal tin, tout: electrical);
end entity filter;

architecture bp of filter is
	constant CI : real := 1.0e-9;
	constant CF : real := 1.0e-9;
	constant RI : real := 1.0/(MATH_2_PI*FP2*CI);
	constant RF : real := 1.0/(MATH_2_PI*FP1*CF);
	--constant RI : real := 26525.0;
	--constant RF : real := 39788.0;
	terminal n1, n2: electrical;
	quantity uri across iri through tin to n1;
	quantity uci across ici through n1 to n2;
	quantity uf across irf, icf through n2 to tout;
begin
	uri == RI * iri;
	uf == RF * irf;
	ici == CI * uci'dot;
	icf == CF * uf'dot;
	OA: entity work.opamp(oa)
		port map(tip => ground, tim => n2, tout => tout);
end architecture bp;
