library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity un_hertz is
    Port ( clk : in STD_LOGIC;
			  rst: in STD_LOGIC;
           etalon : out STD_LOGIC);
end un_hertz;

architecture Behavioral of un_hertz is
	Signal n: integer range 0 to 50000000;
	Signal out_buf: std_logic ;
begin
	divise: process (clk, rst)
	begin
		if (rst = '1') then
			n <= 0;
			out_buf <= '0';
		elsif (clk 'event and clk = '1')	then
			if (n >= 25000000) then
				out_buf <= not out_buf;
				n <= 0;
			else n <= n + 1;
			end if;
		end if;
	end process;
	
	etalon <= out_buf;
end Behavioral;