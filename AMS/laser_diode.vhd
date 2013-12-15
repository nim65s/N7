library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity laser_diode is
    generic( Ith, efficiency, Iss, Vt : real);
    port( terminal tp: electrical; quantity Popt: out real);
end entity laser_diode;

architecture ld of laser_diode is 
    quantity Vpol across Ipol through tp to ground;
begin
    Popt == efficiency * (Ipol - Ith);
    Ipol == Iss * (exp(Vpol/Vt)-1.0);
end architecture ld;
