library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity mix_tb is
end entity mix_tb;

architecture bench of mix_tb is
	constant ampl: real := 1.0e-3;
	constant freq: real := 1.0e3;
	constant phase: real := 1.0;
	terminal ts, tr, tout: electrical;
	quantity us across isi through ts;
	quantity ur across ir through tr;
begin
	uut: entity mixer(mix)
		port map( tp1 => ts, tp2 => tr, tpo => tout);
	us == ampl * sin(MATH_2_PI * freq * now + phase);
	ur == ampl * sin(MATH_2_PI * freq * now);
end bench;
