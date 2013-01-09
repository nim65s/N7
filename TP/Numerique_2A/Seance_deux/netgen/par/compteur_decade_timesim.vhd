--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.15xf
--  \   \         Application: netgen
--  /   /         Filename: compteur_decade_timesim.vhd
-- /___/   /\     Timestamp: Fri Dec 14 11:54:56 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 5 -pcf compteur_decade.pcf -rpw 100 -tpw 0 -ar Structure -tm compteur_decade -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim compteur_decade.ncd compteur_decade_timesim.vhd 
-- Device	: 3s500efg320-5 (PRODUCTION 1.27 2012-04-23)
-- Input file	: compteur_decade.ncd
-- Output file	: D:\2EN\Nim\TP_Num_2\netgen\par\compteur_decade_timesim.vhd
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity compteur_decade is
  port (
    CLK : in STD_LOGIC := 'X'; 
    Q : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end compteur_decade;

architecture Structure of compteur_decade is
  signal Q_0_OBUF_40 : STD_LOGIC; 
  signal Q_1_OBUF_41 : STD_LOGIC; 
  signal Q_2_OBUF_42 : STD_LOGIC; 
  signal Q_3_OBUF_43 : STD_LOGIC; 
  signal CLK_BUFGP : STD_LOGIC; 
  signal Q_0_O : STD_LOGIC; 
  signal Q_1_O : STD_LOGIC; 
  signal Q_2_O : STD_LOGIC; 
  signal Q_3_O : STD_LOGIC; 
  signal CLK_INBUF : STD_LOGIC; 
  signal CLK_BUFGP_BUFG_S_INVNOT : STD_LOGIC; 
  signal CLK_BUFGP_BUFG_I0_INV : STD_LOGIC; 
  signal Q_3_OBUF_DXMUX_120 : STD_LOGIC; 
  signal Q_3_OBUF_DYMUX_109 : STD_LOGIC; 
  signal Q_3_OBUF_CLKINV_100 : STD_LOGIC; 
  signal Q_2_OBUF_DYMUX_138 : STD_LOGIC; 
  signal Q_2_OBUF_CLKINV_129 : STD_LOGIC; 
  signal Q_0_OBUF_DYMUX_147 : STD_LOGIC; 
  signal Q_0_OBUF_CLKINV_145 : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal D : STD_LOGIC_VECTOR ( 3 downto 1 ); 
begin
  Q_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD41"
    )
    port map (
      I => Q_0_O,
      O => Q(0)
    );
  Q_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD44"
    )
    port map (
      I => Q_1_O,
      O => Q(1)
    );
  Q_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD47"
    )
    port map (
      I => Q_2_O,
      O => Q(2)
    );
  Q_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD45"
    )
    port map (
      I => Q_3_O,
      O => Q(3)
    );
  CLK_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "IPAD29",
      PATHPULSE => 555 ps
    )
    port map (
      I => CLK,
      O => CLK_INBUF
    );
  CLK_BUFGP_BUFG : X_BUFGMUX
    generic map(
      LOC => "BUFGMUX_X2Y11"
    )
    port map (
      I0 => CLK_BUFGP_BUFG_I0_INV,
      I1 => GND,
      S => CLK_BUFGP_BUFG_S_INVNOT,
      O => CLK_BUFGP
    );
  CLK_BUFGP_BUFG_SINV : X_INV
    generic map(
      LOC => "BUFGMUX_X2Y11",
      PATHPULSE => 555 ps
    )
    port map (
      I => '1',
      O => CLK_BUFGP_BUFG_S_INVNOT
    );
  CLK_BUFGP_BUFG_I0_USED : X_BUF
    generic map(
      LOC => "BUFGMUX_X2Y11",
      PATHPULSE => 555 ps
    )
    port map (
      I => CLK_INBUF,
      O => CLK_BUFGP_BUFG_I0_INV
    );
  Q_3_OBUF_DXMUX : X_BUF
    generic map(
      LOC => "SLICE_X52Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => D(3),
      O => Q_3_OBUF_DXMUX_120
    );
  Q_3_OBUF_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X52Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => D(1),
      O => Q_3_OBUF_DYMUX_109
    );
  Q_3_OBUF_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X52Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => CLK_BUFGP,
      O => Q_3_OBUF_CLKINV_100
    );
  XLXI_8_XLXI_4 : X_LUT4
    generic map(
      INIT => X"5AAA",
      LOC => "SLICE_X53Y90"
    )
    port map (
      ADR0 => Q_2_OBUF_42,
      ADR1 => VCC,
      ADR2 => Q_1_OBUF_41,
      ADR3 => Q_0_OBUF_40,
      O => D(2)
    );
  bascule_D_I_Q2 : X_FF
    generic map(
      LOC => "SLICE_X53Y90",
      INIT => '0'
    )
    port map (
      I => Q_2_OBUF_DYMUX_138,
      CE => VCC,
      CLK => Q_2_OBUF_CLKINV_129,
      SET => GND,
      RST => GND,
      O => Q_2_OBUF_42
    );
  Q_2_OBUF_DYMUX : X_BUF
    generic map(
      LOC => "SLICE_X53Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => D(2),
      O => Q_2_OBUF_DYMUX_138
    );
  Q_2_OBUF_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X53Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => CLK_BUFGP,
      O => Q_2_OBUF_CLKINV_129
    );
  Q_0_OBUF_DYMUX : X_INV
    generic map(
      LOC => "SLICE_X51Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => Q_0_OBUF_40,
      O => Q_0_OBUF_DYMUX_147
    );
  Q_0_OBUF_CLKINV : X_BUF
    generic map(
      LOC => "SLICE_X51Y90",
      PATHPULSE => 555 ps
    )
    port map (
      I => CLK_BUFGP,
      O => Q_0_OBUF_CLKINV_145
    );
  bascule_D_I_Q0 : X_FF
    generic map(
      LOC => "SLICE_X51Y90",
      INIT => '0'
    )
    port map (
      I => Q_0_OBUF_DYMUX_147,
      CE => VCC,
      CLK => Q_0_OBUF_CLKINV_145,
      SET => GND,
      RST => GND,
      O => Q_0_OBUF_40
    );
  bascule_D_I_Q1 : X_FF
    generic map(
      LOC => "SLICE_X52Y90",
      INIT => '0'
    )
    port map (
      I => Q_3_OBUF_DYMUX_109,
      CE => VCC,
      CLK => Q_3_OBUF_CLKINV_100,
      SET => GND,
      RST => GND,
      O => Q_1_OBUF_41
    );
  XLXI_8_XLXI_2 : X_LUT4
    generic map(
      INIT => X"050A",
      LOC => "SLICE_X52Y90"
    )
    port map (
      ADR0 => Q_1_OBUF_41,
      ADR1 => VCC,
      ADR2 => Q_3_OBUF_43,
      ADR3 => Q_0_OBUF_40,
      O => D(1)
    );
  XLXI_8_XLXI_5 : X_LUT4
    generic map(
      INIT => X"88F0",
      LOC => "SLICE_X52Y90"
    )
    port map (
      ADR0 => Q_1_OBUF_41,
      ADR1 => Q_2_OBUF_42,
      ADR2 => Q_3_OBUF_43,
      ADR3 => Q_0_OBUF_40,
      O => D(3)
    );
  bascule_D_I_Q3 : X_FF
    generic map(
      LOC => "SLICE_X52Y90",
      INIT => '0'
    )
    port map (
      I => Q_3_OBUF_DXMUX_120,
      CE => VCC,
      CLK => Q_3_OBUF_CLKINV_100,
      SET => GND,
      RST => GND,
      O => Q_3_OBUF_43
    );
  Q_0_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD41",
      PATHPULSE => 555 ps
    )
    port map (
      I => Q_0_OBUF_40,
      O => Q_0_O
    );
  Q_1_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD44",
      PATHPULSE => 555 ps
    )
    port map (
      I => Q_1_OBUF_41,
      O => Q_1_O
    );
  Q_2_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD47",
      PATHPULSE => 555 ps
    )
    port map (
      I => Q_2_OBUF_42,
      O => Q_2_O
    );
  Q_3_OUTPUT_OFF_OMUX : X_BUF
    generic map(
      LOC => "PAD45",
      PATHPULSE => 555 ps
    )
    port map (
      I => Q_3_OBUF_43,
      O => Q_3_O
    );
  NlwBlock_compteur_decade_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlock_compteur_decade_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

