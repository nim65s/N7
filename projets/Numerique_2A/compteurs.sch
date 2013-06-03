<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="front" />
        <signal name="rst" />
        <signal name="clk" />
        <signal name="entree" />
        <signal name="dep_inf_etal" />
        <signal name="dep_sup_etal" />
        <signal name="nombre_etal(13:0)" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_24(13:0)" />
        <signal name="XLXN_25" />
        <signal name="XLXN_26" />
        <signal name="nombre_echant(13:0)" />
        <signal name="dep_inf_echant" />
        <signal name="dep_sup_echant" />
        <signal name="XLXN_39" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="entree" />
        <port polarity="Output" name="dep_inf_etal" />
        <port polarity="Output" name="dep_sup_etal" />
        <port polarity="Output" name="nombre_etal(13:0)" />
        <port polarity="Output" name="nombre_echant(13:0)" />
        <port polarity="Output" name="dep_inf_echant" />
        <port polarity="Output" name="dep_sup_echant" />
        <blockdef name="detect_front_entree">
            <timestamp>2013-5-28T7:14:45</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="256" x="64" y="-128" height="256" />
        </blockdef>
        <blockdef name="compteur_etalonnage">
            <timestamp>2013-5-21T8:44:5</timestamp>
            <rect width="256" x="64" y="-240" height="240" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="dcm_sp">
            <timestamp>2007-4-11T22:49:47</timestamp>
            <line x2="0" y1="-832" y2="-832" x1="64" />
            <rect width="256" x="64" y="-1024" height="960" />
            <line x2="320" y1="-960" y2="-960" x1="384" />
            <line x2="320" y1="-896" y2="-896" x1="384" />
            <line x2="320" y1="-832" y2="-832" x1="384" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-768" y2="-768" x1="384" />
            <line x2="320" y1="-640" y2="-640" x1="384" />
            <line x2="320" y1="-704" y2="-704" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-960" y2="-960" x1="0" />
            <line x2="64" y1="-896" y2="-896" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="64" x="320" y="-336" height="32" />
            <line x2="80" y1="-944" y2="-960" x1="64" />
            <line x2="64" y1="-960" y2="-976" x1="80" />
            <line x2="64" y1="-288" y2="-288" x1="320" />
            <line x2="80" y1="-880" y2="-896" x1="64" />
            <line x2="64" y1="-896" y2="-912" x1="80" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="compteur_echantillonnage_megahertz">
            <timestamp>2013-5-28T7:55:57</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="synchro_clocks">
            <timestamp>2013-5-28T8:5:16</timestamp>
            <rect width="368" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-128" y2="-128" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
        </blockdef>
        <block symbolname="detect_front_entree" name="detecteur_front_entree">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="front" name="front" />
            <blockpin signalname="rst" name="rst" />
        </block>
        <block symbolname="compteur_etalonnage" name="compteur_par_etalonnage">
            <blockpin signalname="front" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_etal" name="depassement_sup" />
            <blockpin signalname="dep_inf_etal" name="depassement_inf" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="dcm_sp" name="clk_multiplier">
            <attr value="2" name="CLKFX_MULTIPLY">
                <trait verilog="all:0 dp:1nosynth wsynop:1 wsynth:1" />
                <trait vhdl="all:0 gm:1nosynth wa:1 wd:1" />
                <trait valuetype="Integer 1 32" />
            </attr>
            <blockpin signalname="XLXN_6" name="CLKFB" />
            <blockpin signalname="clk" name="CLKIN" />
            <blockpin name="DSSEN" />
            <blockpin name="PSCLK" />
            <blockpin name="PSEN" />
            <blockpin name="PSINCDEC" />
            <blockpin name="RST" />
            <blockpin signalname="XLXN_5" name="CLK0" />
            <blockpin name="CLK180" />
            <blockpin name="CLK270" />
            <blockpin name="CLK2X" />
            <blockpin name="CLK2X180" />
            <blockpin name="CLK90" />
            <blockpin name="CLKDV" />
            <blockpin signalname="XLXN_39" name="CLKFX" />
            <blockpin name="CLKFX180" />
            <blockpin name="LOCKED" />
            <blockpin name="PSDONE" />
            <blockpin name="STATUS(7:0)" />
        </block>
        <block symbolname="bufg" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="compteur_echantillonnage_megahertz" name="echantilonneur_megahertz">
            <blockpin signalname="front" name="entree" />
            <blockpin signalname="XLXN_4" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_25" name="depassement_sup" />
            <blockpin signalname="XLXN_26" name="depassement_inf" />
            <blockpin signalname="XLXN_24(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="synchro_clocks" name="synchroniseur_clocks">
            <blockpin signalname="XLXN_24(13:0)" name="nombre_in(13:0)" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_out" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_out" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre_out(13:0)" />
            <blockpin signalname="XLXN_25" name="dep_sup_in" />
            <blockpin signalname="XLXN_26" name="dep_inf_in" />
            <blockpin signalname="clk" name="clk" />
        </block>
        <block symbolname="bufg" name="XLXI_2">
            <blockpin signalname="XLXN_39" name="I" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="736" y="608" name="detecteur_front_entree" orien="R0">
        </instance>
        <instance x="1344" y="1056" name="compteur_par_etalonnage" orien="R0">
        </instance>
        <branch name="front">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="512" type="branch" />
            <wire x2="1200" y1="512" y2="512" x1="1120" />
            <wire x2="1232" y1="512" y2="512" x1="1200" />
            <wire x2="1232" y1="512" y2="832" x1="1232" />
            <wire x2="1344" y1="832" y2="832" x1="1232" />
            <wire x2="1232" y1="832" y2="1424" x1="1232" />
            <wire x2="1648" y1="1424" y2="1424" x1="1232" />
        </branch>
        <branch name="rst">
            <wire x2="624" y1="400" y2="400" x1="560" />
            <wire x2="1280" y1="400" y2="400" x1="624" />
            <wire x2="1280" y1="400" y2="640" x1="1280" />
            <wire x2="1280" y1="640" y2="1024" x1="1280" />
            <wire x2="1344" y1="1024" y2="1024" x1="1280" />
            <wire x2="1280" y1="1024" y2="1552" x1="1280" />
            <wire x2="1648" y1="1552" y2="1552" x1="1280" />
            <wire x2="624" y1="400" y2="640" x1="624" />
            <wire x2="736" y1="640" y2="640" x1="624" />
        </branch>
        <branch name="entree">
            <wire x2="736" y1="512" y2="512" x1="560" />
        </branch>
        <branch name="dep_inf_etal">
            <wire x2="1744" y1="896" y2="896" x1="1728" />
            <wire x2="2832" y1="896" y2="896" x1="1744" />
        </branch>
        <branch name="dep_sup_etal">
            <wire x2="1744" y1="832" y2="832" x1="1728" />
            <wire x2="2832" y1="832" y2="832" x1="1744" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <wire x2="1744" y1="960" y2="960" x1="1728" />
            <wire x2="2832" y1="960" y2="960" x1="1744" />
        </branch>
        <iomarker fontsize="28" x="560" y="400" name="rst" orien="R180" />
        <iomarker fontsize="28" x="560" y="512" name="entree" orien="R180" />
        <iomarker fontsize="28" x="560" y="352" name="clk" orien="R180" />
        <instance x="784" y="2000" name="clk_multiplier" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial;displayformat:NAMEEQUALSVALUE" attrname="CLKFX_MULTIPLY" x="0" y="-1112" type="instance" />
        </instance>
        <branch name="XLXN_4">
            <wire x2="1648" y1="1488" y2="1488" x1="1568" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1184" y1="816" y2="816" x1="1104" />
            <wire x2="1184" y1="816" y2="1040" x1="1184" />
            <wire x2="1184" y1="1040" y2="1040" x1="1168" />
        </branch>
        <instance x="1104" y="784" name="XLXI_3" orien="R180" />
        <branch name="XLXN_6">
            <wire x2="880" y1="816" y2="816" x1="768" />
            <wire x2="768" y1="816" y2="1104" x1="768" />
            <wire x2="784" y1="1104" y2="1104" x1="768" />
        </branch>
        <branch name="clk">
            <wire x2="672" y1="352" y2="352" x1="560" />
            <wire x2="1328" y1="352" y2="352" x1="672" />
            <wire x2="1328" y1="352" y2="576" x1="1328" />
            <wire x2="1328" y1="576" y2="928" x1="1328" />
            <wire x2="1344" y1="928" y2="928" x1="1328" />
            <wire x2="1328" y1="928" y2="1360" x1="1328" />
            <wire x2="2304" y1="1360" y2="1360" x1="1328" />
            <wire x2="672" y1="352" y2="576" x1="672" />
            <wire x2="736" y1="576" y2="576" x1="672" />
            <wire x2="672" y1="576" y2="1040" x1="672" />
            <wire x2="784" y1="1040" y2="1040" x1="672" />
        </branch>
        <branch name="XLXN_24(13:0)">
            <wire x2="2304" y1="1552" y2="1552" x1="2032" />
        </branch>
        <instance x="1344" y="1520" name="XLXI_2" orien="R0" />
        <instance x="1648" y="1584" name="echantilonneur_megahertz" orien="R0">
        </instance>
        <branch name="XLXN_25">
            <wire x2="2304" y1="1424" y2="1424" x1="2032" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="2304" y1="1488" y2="1488" x1="2032" />
        </branch>
        <instance x="2304" y="1584" name="synchroniseur_clocks" orien="R0">
        </instance>
        <branch name="nombre_echant(13:0)">
            <wire x2="2832" y1="1552" y2="1552" x1="2800" />
        </branch>
        <iomarker fontsize="28" x="2832" y="1552" name="nombre_echant(13:0)" orien="R0" />
        <branch name="dep_inf_echant">
            <wire x2="2832" y1="1456" y2="1456" x1="2800" />
        </branch>
        <iomarker fontsize="28" x="2832" y="1456" name="dep_inf_echant" orien="R0" />
        <branch name="dep_sup_echant">
            <wire x2="2832" y1="1360" y2="1360" x1="2800" />
        </branch>
        <iomarker fontsize="28" x="2832" y="1360" name="dep_sup_echant" orien="R0" />
        <iomarker fontsize="28" x="2832" y="960" name="nombre_etal(13:0)" orien="R0" />
        <iomarker fontsize="28" x="2832" y="896" name="dep_inf_etal" orien="R0" />
        <iomarker fontsize="28" x="2832" y="832" name="dep_sup_etal" orien="R0" />
        <branch name="XLXN_39">
            <wire x2="1344" y1="1488" y2="1488" x1="1168" />
        </branch>
    </sheet>
</drawing>