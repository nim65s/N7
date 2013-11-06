library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity main is
	generic( D, theta : real);
	port( terminal tout: electrical);
end entity main;

architecture bench of main is
	terminal tlo, trf, tpd, tfin1, tfin2, tfout1, tfout2, tcomp : electrical;
	quantity Pld, Ppd :  real;
begin
	oscol: entity oscillator(osc)
		generic map( ampl => 1.0, freq => 1.0e3, phase => 0.0)
		port map(tout => tlo);
	oscrf: entity oscillator(osc)
		generic map( ampl => 1.0, freq => 2.0e7, phase => 0.0)
		port map(tout => trf);
	mix1: entity mixer(mix)
		port map(tp1 => tlo, tp2 => trf, tpo => tfin1);
	mix2: entity mixer(mix)
		port map(tp1 => tlo, tp2 => tpd, tpo => tfin2);
	ld: entity laser_diode(ld)
		generic map( Ith => 0.5 , efficiency => 1.0, Iss => 1.0e-14, Vt => 0.7)
		port map(tp => trf, Popt => Pld);
	lt: entity lambertian_target(lt)
		generic map(D => D, theta => theta)
		port map( Pin => Pld, Pout => Ppd);
	pd: entity photo_diode(pd)
		port map( tpd => tpd, Popt => Ppd);
	bp1: entity filter(bp)
		port map( tin => tfin1, tout => tfout1);
	bp2: entity filter(bp)
		port map( tin => tfin2, tout => tfout2);
	comp: entity comparator(comp)
		port map( ts => tfout1, tr => tfout2, tout => tcomp);
	lp: entity lp_filter(lp)
		port map( tin => tcomp, tout => tout);
		
end bench;
