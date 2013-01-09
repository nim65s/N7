--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: compteur_decade_synthesis.vhd
-- /___/   /\     Timestamp: Fri Dec 14 11:15:50 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm compteur_decade -w -dir netgen/synthesis -ofmt vhdl -sim compteur_decade.ngc compteur_decade_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: compteur_decade.ngc
-- Output file	: D:\2EN\Nim\TP_Num_2\netgen\synthesis\compteur_decade_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: compteur_decade
-- Xilinx	: C:\Xilinx\14.1\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity compteur_decade is
  port (
    CLK : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end compteur_decade;

architecture Structure of compteur_decade is
  signal CLK_BUFGP_12 : STD_LOGIC; 
  signal Q_0_OBUF_21 : STD_LOGIC; 
  signal Q_1_OBUF_22 : STD_LOGIC; 
  signal Q_2_OBUF_23 : STD_LOGIC; 
  signal Q_3_OBUF_24 : STD_LOGIC; 
  signal XLXI_8_XLXN_10 : STD_LOGIC; 
  signal XLXI_8_XLXN_5 : STD_LOGIC; 
  signal XLXI_8_XLXN_6 : STD_LOGIC; 
  signal XLXI_8_XLXN_7 : STD_LOGIC; 
  signal XLXI_8_XLXN_8 : STD_LOGIC; 
  signal XLXI_8_XLXN_9 : STD_LOGIC; 
  signal XLXN_12 : STD_LOGIC; 
  signal XLXN_13 : STD_LOGIC; 
  signal D : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  XLXI_5 : GND
    port map (
      G => XLXN_12
    );
  XLXI_6 : VCC
    port map (
      P => XLXN_13
    );
  XLXI_8_XLXI_10 : OR2B2
    port map (
      I0 => Q_1_OBUF_22,
      I1 => Q_0_OBUF_21,
      O => XLXI_8_XLXN_10
    );
  XLXI_8_XLXI_9 : XOR2
    port map (
      I0 => Q_1_OBUF_22,
      I1 => Q_0_OBUF_21,
      O => XLXI_8_XLXN_9
    );
  XLXI_8_XLXI_8 : AND2
    port map (
      I0 => XLXI_8_XLXN_10,
      I1 => Q_2_OBUF_23,
      O => XLXI_8_XLXN_8
    );
  XLXI_8_XLXI_7 : AND3B1
    port map (
      I0 => Q_2_OBUF_23,
      I1 => Q_1_OBUF_22,
      I2 => Q_0_OBUF_21,
      O => XLXI_8_XLXN_7
    );
  XLXI_8_XLXI_6 : AND3
    port map (
      I0 => Q_2_OBUF_23,
      I1 => Q_1_OBUF_22,
      I2 => Q_0_OBUF_21,
      O => XLXI_8_XLXN_6
    );
  XLXI_8_XLXI_5 : OR2
    port map (
      I0 => XLXI_8_XLXN_5,
      I1 => XLXI_8_XLXN_6,
      O => D(3)
    );
  XLXI_8_XLXI_4 : OR2
    port map (
      I0 => XLXI_8_XLXN_7,
      I1 => XLXI_8_XLXN_8,
      O => D(2)
    );
  XLXI_8_XLXI_3 : AND2B1
    port map (
      I0 => Q_0_OBUF_21,
      I1 => Q_3_OBUF_24,
      O => XLXI_8_XLXN_5
    );
  XLXI_8_XLXI_2 : AND2B1
    port map (
      I0 => Q_3_OBUF_24,
      I1 => XLXI_8_XLXN_9,
      O => D(1)
    );
  XLXI_8_XLXI_1 : INV
    port map (
      I => Q_0_OBUF_21,
      O => D(0)
    );
  Q_3_OBUF : OBUF
    port map (
      I => Q_3_OBUF_24,
      O => Q(3)
    );
  Q_2_OBUF : OBUF
    port map (
      I => Q_2_OBUF_23,
      O => Q(2)
    );
  Q_1_OBUF : OBUF
    port map (
      I => Q_1_OBUF_22,
      O => Q(1)
    );
  Q_0_OBUF : OBUF
    port map (
      I => Q_0_OBUF_21,
      O => Q(0)
    );
  CLK_BUFGP : BUFGP
    port map (
      I => CLK,
      O => CLK_BUFGP_12
    );
  bascule_D_I_Q3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_BUFGP_12,
      CE => XLXN_13,
      CLR => XLXN_12,
      D => D(3),
      Q => Q_3_OBUF_24
    );
  bascule_D_I_Q2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_BUFGP_12,
      CE => XLXN_13,
      CLR => XLXN_12,
      D => D(2),
      Q => Q_2_OBUF_23
    );
  bascule_D_I_Q1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_BUFGP_12,
      CE => XLXN_13,
      CLR => XLXN_12,
      D => D(1),
      Q => Q_1_OBUF_22
    );
  bascule_D_I_Q0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_BUFGP_12,
      CE => XLXN_13,
      CLR => XLXN_12,
      D => D(0),
      Q => Q_0_OBUF_21
    );

end Structure;

