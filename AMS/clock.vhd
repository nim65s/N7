library ieee;

use ieee.math_real.all;
use IEEE.STD_LOGIC_1164.ALL;


entity clock is
	port( output: out std_logic);
end entity clock;

architecture clk of clock is
	constant period : time := 10 us;
	signal clock_signal : std_logic := '1';
begin
	clock_signal <= not clock_signal after period/2.0;
	output <= clock_signal;
end architecture clk;
