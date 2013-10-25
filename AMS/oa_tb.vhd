library ieee;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;

entity oa_tb is
end entity oa_tb;

architecture bench of oa_tb is
	constant ampl: real := 1.0e-3;
	constant freq: real := 1.0e3;
	constant rs: real := 1.0e3;
	constant rf: real := 1.0e4;
	constant rl: real := 1.0e3;
	terminal n1, n2, n3: electrical;
	quantity usrc across isrc through n1;
	quantity urs across irs through n1 to n2;
	quantity urf across irf through n2 to n3;
	quantity uout across iout through n3;
	
begin
	uut: entity opamp(oa)
		port map( tip => ground, tim => n2, tout => n3);
	usrc == ampl * sin(MATH_2_PI * freq * now);
	urs == RS *irs;
	urf == RF *irf;
	uout == RL *iout;
	
end bench;
