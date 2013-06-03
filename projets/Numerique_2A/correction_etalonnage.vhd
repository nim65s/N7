library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity correction_etalonnage is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nombre_etal_in : in  STD_LOGIC_VECTOR (13 downto 0);
           nombre_etal_out : out  STD_LOGIC_VECTOR (13 downto 0));
end correction_etalonnage;

architecture Behavioral of correction_etalonnage is
	Signal nombre_buf: integer range 0 to 35000;
begin
	correction: process(rst, clk)
	begin
		if (rst = '1') then
			nombre_buf <= 0;
			nombre_etal_out <= (others => '0');
		elsif (clk'event and clk = '1')	then
			nombre_buf <= conv_integer(unsigned(nombre_etal_in));
			nombre_etal_out <= conv_std_logic_vector(nombre_buf*35/32, 14);
		end if;
	end process;
end Behavioral;