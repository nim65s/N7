library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity transimpedance is
	port( terminal tin, tout: electrical);
end entity transimpedance;

architecture trans of transimpedance is
	quantity ur across ir through tin to tout;
begin
	OA: entity work.opamp(oa)
		port map(tip => ground, tim => tin, tout => tout);
	ur == 1.0e3 * ir;
end architecture trans;
