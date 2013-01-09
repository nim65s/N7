library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity wait_2ms is
    Port ( rst : in  STD_LOGIC;
			  clk_in : in  STD_LOGIC;
           output : out  STD_LOGIC);
end wait_2ms;

architecture Behavioral of wait_2ms is
	Signal n: integer range 0 to 60000000;
	Signal out_buf: std_logic ;
begin
	divise: process (clk_in, rst, n)
	begin
		if (rst = '1') then
			n <= 0;
			out_buf <= '0';
		elsif (clk_in 'event and clk_in = '1')	then
			if (n = 50000000) then 
				out_buf <= '1';
			else
				out_buf <= '0';
				n <= n + 1;
			end if;
		end if;
	end process;
	
	output <= out_buf;
end Behavioral;