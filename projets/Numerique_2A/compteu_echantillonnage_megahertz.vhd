----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:22 05/28/2013 
-- Design Name: 
-- Module Name:    compteu_echantillonnage_megahertz - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compteu_echantillonnage_megahertz is
    Port ( entree : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nombre : out  STD_LOGIC_VECTOR (13 downto 0);
           depassement_sup : out  STD_LOGIC;
           depassement_inf : out  STD_LOGIC);
end compteu_echantillonnage_megahertz;

architecture Behavioral of compteu_echantillonnage_megahertz is

begin


end Behavioral;

