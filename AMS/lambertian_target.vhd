library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;

entity lambertian_target is
    generic(
        Te : real := 1.0;
        Tr : real := 1.0;
        Pd : real := 0.4;
        Dr : real := 1.0;
        D : real;
        theta : real
    );
    port( quantity Pin: in real; quantity Pout: out real);
end entity lambertian_target;

architecture lt of lambertian_target is
    quantity Pr: real := 0.0;
    constant tau_d: real := 2.0 * D / 3.0e8;
begin
    Pr == Te * Tr * Pd * Pin * Dr * Dr * cos(theta) / (4.0 * D * D);
    Pout == Pr'delayed(tau_d);
end architecture lt;
