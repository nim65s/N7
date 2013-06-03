library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;

entity selection_gamme is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           etal_on : in  STD_LOGIC;
           nombre : in  STD_LOGIC_VECTOR (13 downto 0);
           gamme : out  STD_LOGIC_VECTOR (2 downto 0));
end selection_gamme;

architecture Behavioral of selection_gamme is

begin
	gamme_process: process (clk, rst, etal_on)
	begin
		if (rst = '1') then 
			gamme <= (others => '0');
		elsif (clk 'event and clk = '1')	then
			if (etal_on = '1') then
				if (conv_integer(unsigned(nombre)) < 1000) then gamme <= "001";
				else gamme <= "010";
				end if;
			else
				if (conv_integer(unsigned(nombre)) < 10) then gamme <= "100";
				else gamme <= "010";
				end if;
			end if;
		end if;
	end process;
end Behavioral;