library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity pd_tb is
end entity pd_tb;

architecture bench of pd_tb is
	terminal tpd, tout: electrical;
	quantity Popt: real;
begin
	pd: entity photo_diode(pd)
		port map( tpd => tpd,  Popt => Popt);
	trans: entity transimpedance(trans)
		port map( tin => tpd, tout => tout);
		
	Popt == 0.05  * sin (MATH_2_PI*20.0E6*NOW);
	
end bench;
