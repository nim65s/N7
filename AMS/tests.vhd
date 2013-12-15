library ieee;

use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity tests is
    port( terminal tout : electrical);
end entity tests;

architecture bench of tests is
    terminal tlo, trf, tfin1, tfin2, tpd, ttrans, tfout1, tfout2, tcomp : electrical;
    quantity Pld, Ppd :  real;
    terminal t1, t2, t3, tf1, tf2, tf3 : electrical;
begin
    oscol: entity oscillator(osc)
        generic map( ampl => 1.0, freq => 2.0e7-5.0e3, phase => 0.0)
        port map(tout => tlo);
    oscrf: entity oscillator(osc)
        generic map( ampl => 1.0, freq => 2.0e7, phase => 0.0)
        port map(tout => trf);
    mix1: entity mixer(mix)
        port map(tp1 => tlo, tp2 => ttrans, tpo => tfin1);
    mix2: entity mixer(mix)
        port map(tp1 => tlo, tp2 => trf, tpo => tfin2);
    ld: entity laser_diode(ld)
        generic map( Ith => 0.5 , efficiency => 1.0, Iss => 1.0e-3, Vt => 0.7)
        port map(tp => trf, Popt => Pld);
    lt: entity lambertian_target(lt)
        generic map(D => 0.5, theta => 0.0)
        port map( Pin => Pld, Pout => Ppd);
    pd: entity photo_diode(pd)
        port map( tpd => tpd, Popt => Ppd);
    trans: entity transimpedance(trans)
        port map( tin => tpd, tout => ttrans);
    bp1: entity filter(bp)
        port map( tin => tfin1, tout => t1);
    bp12: entity filter(bp)
        port map( tin => t1, tout => t2);
    bp13: entity filter(bp)
        port map( tin => t2, tout => t3);
    bp14: entity filter(bp)
        port map( tin => t3, tout => tfout1);
    bp2: entity filter(bp)
        port map( tin => tfin2, tout => tfout2);
    comp: entity comparator(comp)
        port map( ts => tfout1, tr => tfout2, tout => tcomp);
    lp1: entity lp_filter(lp) port map( tin => tcomp, tout => tf1);
    lp2: entity lp_filter(lp) port map( tin => tf1, tout => tf2);
    lp3: entity lp_filter(lp) port map( tin => tf2, tout => tf3);
    lp4: entity lp_filter(lp) port map( tin => tf3, tout => tout);
end bench;
