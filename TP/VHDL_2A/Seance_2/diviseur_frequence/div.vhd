library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity div is
    Port ( rst : in  STD_LOGIC;
			  clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end div;

architecture Behavioral of div is
	Signal n: integer range 0 to 60000000;
	Signal out_buf: std_logic ;
begin
	divise: process (clk_in, rst)
	begin
		if (rst = '1') then
			n <= 0;
			out_buf <= '0';
		elsif (clk_in 'event and clk_in = '1')	then
			if (n = 25000000) then 
				out_buf <= not out_buf;
				n <= 0;
			else 
				n <= n + 1;
			end if;
		end if;
	end process;
	clk_out <= out_buf;
end Behavioral;