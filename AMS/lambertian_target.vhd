library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity lambertian_target is
	generic(Te : real := 1.0;
		Tr : real := 1.0;
		Pd : real := 0.4;
		Dr : real := 1.0;
		D : real;
		 theta : real);
	port( terminal Popt: real);
end entity lambertian_target;

architecture lt of lambertian_target is
	quantity Pr: real;
begin
	Pr == Te * Tr * Pd * Popt * Dr * Dr * cos(theta) / (4 * D * D);l
end architecture lt;
