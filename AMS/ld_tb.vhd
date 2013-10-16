library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity ld_tb is
end entity ld_tb;

architecture bench of ld_tb is
	terminal tsrc: electrical;
	quantity vsrc across isrc through tsrc;
begin
	uut: entity laser_diode(ld)
		generic map ( Ith => 0.03, efficiency => 0.5, Iss => 1.0E-14, Vt => 0.026)
		port map ( tp => tsrc, tm => ground);
		
	vsrc == 1.0  * sin (MATH_2_PI*20.0E6*NOW);
end bench;
