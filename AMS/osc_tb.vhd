library ieee;
use ieee.electrical_systems.all;
use work.all;

entity osc_tb is
end entity osc_tb;

architecture bench of osc_tb is
	terminal src: electrical;
begin
	uut: entity oscillator(osc) 
		generic map ( ampl => 1.0, freq => 20.0E6, phase =>0.0)
		port map(tp => src, tm => ground);
end bench;
