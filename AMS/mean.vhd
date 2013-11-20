library ieee;

use IEEE.STD_LOGIC_1164.ALL;
use ieee.electrical_systems.all;
use ieee.math_real.all;
use work.all;


entity mean is
	port( 
		clk : in std_logic; 
		terminal tin : in electrical;
		quantity average : out real);
end entity mean;

architecture avg of mean is
	signal local_min, local_max : real := 0.0;
	signal min_count, max_count: integer range 0 to 10 := 0;
	quantity input across tin to ground;
	--quantity local_min across tmin to ground;
	--quantity local_max across tmax to ground;
begin
	mean_process: process (clk)
	begin
		if (clk'event and clk = '1') then
			if (min_count = 10 or not input'above(local_min)) then
				local_min <= local_min - 1.0;
				min_count <= 0;
			else
				local_min <= local_min;
				min_count <= min_count + 1;
			end if;
			if (max_count = 10 or input'above(local_max)) then
				local_max <= local_max + 1.0;
				max_count <= 0;
			else
				local_max <= local_max;
				max_count <= max_count + 1;
			end if;
		end if;
	end process;
	
	--break on input'above(local_min), input'above(local_min);
	
	average == ( local_min + local_max ) / 2.0;
end architecture avg;
