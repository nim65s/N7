library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity choix_mode is
    Port ( clk : in  STD_LOGIC;
	        rst : in  STD_LOGIC;
	        mode_auto : in  STD_LOGIC;
           auto_etal : in  STD_LOGIC;
           manu_etal : in  STD_LOGIC;
           dep_sup_echant : in  STD_LOGIC;
           dep_inf_echant : in  STD_LOGIC;
           nombre_echant : in  STD_LOGIC_VECTOR (13 downto 0);
           dep_sup_etal : in  STD_LOGIC;
           dep_inf_etal : in  STD_LOGIC;
           nombre_etal : in  STD_LOGIC_VECTOR (13 downto 0);
           depassement_sup : out  STD_LOGIC;
           depassement_inf : out  STD_LOGIC;
           nombre : out  STD_LOGIC_VECTOR (13 downto 0);
           etal_on : out  STD_LOGIC);
end choix_mode;

architecture Behavioral of choix_mode is

begin
	route: process (clk, rst, mode_auto, auto_etal, manu_etal)
	begin
		if (rst = '1') then
			nombre <= (others => '0');
			etal_on <= '0';
			depassement_sup <= '0';
			depassement_inf <= '0';
		elsif (clk'event and clk = '1') then
			if ((mode_auto = '1' and auto_etal = '1') or (mode_auto = '0' and manu_etal = '1')) then
				nombre <= nombre_etal;
				etal_on <= '1';
				depassement_sup <= dep_sup_etal;
				depassement_inf <= dep_inf_etal;
			else
				nombre <= nombre_echant;
				etal_on <= '0';
				depassement_sup <= dep_sup_echant;
				depassement_inf <= dep_inf_echant;
			end if;
		end if;
	end process;
end Behavioral;

