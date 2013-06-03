library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity synchro_clocks is
    Port ( clk : in  STD_LOGIC;
	        nombre_in : in  STD_LOGIC_VECTOR (13 downto 0);
           dep_sup_in : in  STD_LOGIC;
           dep_inf_in : in  STD_LOGIC;
           nombre_out : out  STD_LOGIC_VECTOR (13 downto 0);
           dep_sup_out : out  STD_LOGIC;
           dep_inf_out : out  STD_LOGIC);
end synchro_clocks;

architecture Behavioral of synchro_clocks is
	Signal nombre_buf : STD_LOGIC_VECTOR (13 downto 0);
	Signal dep_sup_buf, dep_inf_buf : STD_LOGIC;
begin
	bascule: process (clk)
	begin
		if (clk 'event and clk = '1')	then
			nombre_buf <= nombre_in;
			dep_sup_buf <= dep_sup_in;
			dep_inf_buf <= dep_inf_in;
		end if;
	end process;
	
	nombre_out <= nombre_buf;
	dep_sup_out <= dep_sup_buf;
	dep_inf_out <= dep_inf_buf;
end Behavioral;