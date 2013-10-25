library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity mixer is
	port( terminal tp1, tp2, tpo: electrical);
end entity mixer;

architecture mix of mixer is 
	quantity Iout through electrical_ref to tpo;
	quantity Vin1 across tp1;
	quantity Vin2 across tp2;
	quantity Vout across tpo;
begin
	Vout == Vin1 * Vin2;
end architecture mix;
