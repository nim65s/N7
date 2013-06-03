LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_convertisseur IS
END TB_convertisseur;
 
ARCHITECTURE behavior OF TB_convertisseur IS 
    COMPONENT conversion_decimale
    PORT(
         hex_un : OUT  std_logic_vector(3 downto 0);
         hex_deux : OUT  std_logic_vector(3 downto 0);
         hex_trois : OUT  std_logic_vector(3 downto 0);
         hex_quatre : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         nombre : IN  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal clk : std_logic := '0';
   signal nombre : std_logic_vector(13 downto 0) := "00010011010010";

 	--Outputs
   signal hex_un : std_logic_vector(3 downto 0);
   signal hex_deux : std_logic_vector(3 downto 0);
   signal hex_trois : std_logic_vector(3 downto 0);
   signal hex_quatre : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
   uut: conversion_decimale PORT MAP (
          hex_un => hex_un,
          hex_deux => hex_deux,
          hex_trois => hex_trois,
          hex_quatre => hex_quatre,
          clk => clk,
          nombre => nombre
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
