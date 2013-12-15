library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity comparator is
    port( terminal ts, tr, tout: electrical);
end entity comparator;

architecture comp of comparator is
    terminal tc: electrical;
    quantity us across ts to ground;
    quantity ur across tr to ground;
    quantity iout through tc to ground;
    quantity uo across io through tc to tout;
begin
    iout == us * ur;
    OA: entity work.opamp(oa)
        port map(tip => ground, tim => tc, tout => tout);
    uo == io;
end architecture comp;
