--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: bloc_combinatoire_synthesis.vhd
-- /___/   /\     Timestamp: Fri Dec 14 09:24:44 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm bloc_combinatoire -w -dir netgen/synthesis -ofmt vhdl -sim bloc_combinatoire.ngc bloc_combinatoire_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: bloc_combinatoire.ngc
-- Output file	: D:\2EN\Nim\TP_Num_2\netgen\synthesis\bloc_combinatoire_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: bloc_combinatoire
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

entity bloc_combinatoire is
  port (
    E0 : in STD_LOGIC := 'X'; 
    E1 : in STD_LOGIC := 'X'; 
    E2 : in STD_LOGIC := 'X'; 
    E3 : in STD_LOGIC := 'X'; 
    S0 : out STD_LOGIC; 
    S1 : out STD_LOGIC; 
    S2 : out STD_LOGIC; 
    S3 : out STD_LOGIC 
  );
end bloc_combinatoire;

architecture Structure of bloc_combinatoire is
  signal E0_IBUF_1 : STD_LOGIC; 
  signal E1_IBUF_3 : STD_LOGIC; 
  signal E2_IBUF_5 : STD_LOGIC; 
  signal E3_IBUF_7 : STD_LOGIC; 
  signal S0_OBUF_9 : STD_LOGIC; 
  signal S1_OBUF_11 : STD_LOGIC; 
  signal S2_OBUF_13 : STD_LOGIC; 
  signal S3_OBUF_15 : STD_LOGIC; 
  signal XLXN_10 : STD_LOGIC; 
  signal XLXN_5 : STD_LOGIC; 
  signal XLXN_6 : STD_LOGIC; 
  signal XLXN_7 : STD_LOGIC; 
  signal XLXN_8 : STD_LOGIC; 
  signal XLXN_9 : STD_LOGIC; 
begin
  XLXI_1 : INV
    port map (
      I => E0_IBUF_1,
      O => S0_OBUF_9
    );
  XLXI_2 : AND2B1
    port map (
      I0 => E3_IBUF_7,
      I1 => XLXN_9,
      O => S1_OBUF_11
    );
  XLXI_3 : AND2B1
    port map (
      I0 => E0_IBUF_1,
      I1 => E3_IBUF_7,
      O => XLXN_5
    );
  XLXI_4 : OR2
    port map (
      I0 => XLXN_7,
      I1 => XLXN_8,
      O => S2_OBUF_13
    );
  XLXI_5 : OR2
    port map (
      I0 => XLXN_5,
      I1 => XLXN_6,
      O => S3_OBUF_15
    );
  XLXI_6 : AND3
    port map (
      I0 => E2_IBUF_5,
      I1 => E1_IBUF_3,
      I2 => E0_IBUF_1,
      O => XLXN_6
    );
  XLXI_7 : AND3B1
    port map (
      I0 => E2_IBUF_5,
      I1 => E1_IBUF_3,
      I2 => E0_IBUF_1,
      O => XLXN_7
    );
  XLXI_8 : AND2
    port map (
      I0 => XLXN_10,
      I1 => E2_IBUF_5,
      O => XLXN_8
    );
  XLXI_9 : XOR2
    port map (
      I0 => E1_IBUF_3,
      I1 => E0_IBUF_1,
      O => XLXN_9
    );
  XLXI_10 : OR2B2
    port map (
      I0 => E1_IBUF_3,
      I1 => E0_IBUF_1,
      O => XLXN_10
    );
  E0_IBUF : IBUF
    port map (
      I => E0,
      O => E0_IBUF_1
    );
  E1_IBUF : IBUF
    port map (
      I => E1,
      O => E1_IBUF_3
    );
  E2_IBUF : IBUF
    port map (
      I => E2,
      O => E2_IBUF_5
    );
  E3_IBUF : IBUF
    port map (
      I => E3,
      O => E3_IBUF_7
    );
  S0_OBUF : OBUF
    port map (
      I => S0_OBUF_9,
      O => S0
    );
  S1_OBUF : OBUF
    port map (
      I => S1_OBUF_11,
      O => S1
    );
  S2_OBUF : OBUF
    port map (
      I => S2_OBUF_13,
      O => S2
    );
  S3_OBUF : OBUF
    port map (
      I => S3_OBUF_15,
      O => S3
    );

end Structure;

