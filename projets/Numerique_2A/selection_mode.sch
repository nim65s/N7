<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="auto_etal" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="dep_sup_echant" />
        <signal name="dep_inf_echant" />
        <signal name="nombre_echant(13:0)" />
        <signal name="dep_sup_etal" />
        <signal name="dep_inf_etal" />
        <signal name="nombre_etal(13:0)" />
        <signal name="mode_auto" />
        <signal name="manu_etal" />
        <signal name="depassement_inf" />
        <signal name="depassement_sup" />
        <signal name="etal_on" />
        <signal name="nombre(13:0)" />
        <signal name="gamme(2:0)" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="dep_sup_echant" />
        <port polarity="Input" name="dep_inf_echant" />
        <port polarity="Input" name="nombre_echant(13:0)" />
        <port polarity="Input" name="dep_sup_etal" />
        <port polarity="Input" name="dep_inf_etal" />
        <port polarity="Input" name="nombre_etal(13:0)" />
        <port polarity="Input" name="mode_auto" />
        <port polarity="Input" name="manu_etal" />
        <port polarity="Output" name="depassement_inf" />
        <port polarity="Output" name="depassement_sup" />
        <port polarity="Output" name="etal_on" />
        <port polarity="Output" name="nombre(13:0)" />
        <port polarity="Output" name="gamme(2:0)" />
        <blockdef name="choix_mode">
            <timestamp>2013-5-28T9:11:45</timestamp>
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="544" y1="-256" y2="-256" x1="480" />
            <rect width="64" x="480" y="-668" height="24" />
            <line x2="544" y1="-656" y2="-656" x1="480" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
            <line x2="544" y1="-464" y2="-464" x1="480" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="416" x="64" y="-704" height="1020" />
        </blockdef>
        <blockdef name="choix_etal_echant">
            <timestamp>2013-5-28T9:10:7</timestamp>
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <rect width="416" x="64" y="-440" height="320" />
        </blockdef>
        <blockdef name="selection_gamme">
            <timestamp>2013-5-28T9:13:32</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="416" y="-300" height="24" />
            <line x2="480" y1="-288" y2="-288" x1="416" />
            <rect width="352" x="64" y="-320" height="448" />
        </blockdef>
        <block symbolname="choix_mode" name="choix_du_mode">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="mode_auto" name="mode_auto" />
            <blockpin signalname="auto_etal" name="auto_etal" />
            <blockpin signalname="manu_etal" name="manu_etal" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_echant" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="dep_inf_etal" name="dep_inf_etal" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre_echant(13:0)" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre_etal(13:0)" />
            <blockpin signalname="depassement_sup" name="depassement_sup" />
            <blockpin signalname="depassement_inf" name="depassement_inf" />
            <blockpin signalname="etal_on" name="etal_on" />
            <blockpin signalname="nombre(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="choix_etal_echant" name="choix_auto_du_mode">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="auto_etal" name="etalonnage_on" />
        </block>
        <block symbolname="selection_gamme" name="selecteur_gamme">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="etal_on" name="etal_on" />
            <blockpin signalname="nombre(13:0)" name="nombre(13:0)" />
            <blockpin signalname="gamme(2:0)" name="gamme(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="auto_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1472" y="1200" type="branch" />
            <wire x2="1472" y1="1200" y2="1200" x1="1376" />
            <wire x2="1568" y1="1200" y2="1200" x1="1472" />
        </branch>
        <branch name="clk">
            <wire x2="720" y1="560" y2="560" x1="656" />
            <wire x2="1456" y1="560" y2="560" x1="720" />
            <wire x2="1568" y1="560" y2="560" x1="1456" />
            <wire x2="720" y1="560" y2="1376" x1="720" />
            <wire x2="832" y1="1376" y2="1376" x1="720" />
            <wire x2="2240" y1="176" y2="176" x1="1456" />
            <wire x2="1456" y1="176" y2="560" x1="1456" />
        </branch>
        <branch name="rst">
            <wire x2="688" y1="624" y2="624" x1="656" />
            <wire x2="1520" y1="624" y2="624" x1="688" />
            <wire x2="1568" y1="624" y2="624" x1="1520" />
            <wire x2="688" y1="624" y2="1408" x1="688" />
            <wire x2="832" y1="1408" y2="1408" x1="688" />
            <wire x2="2240" y1="240" y2="240" x1="1520" />
            <wire x2="1520" y1="240" y2="624" x1="1520" />
        </branch>
        <branch name="dep_sup_echant">
            <wire x2="800" y1="688" y2="688" x1="656" />
            <wire x2="1568" y1="688" y2="688" x1="800" />
        </branch>
        <branch name="dep_inf_echant">
            <wire x2="816" y1="752" y2="752" x1="656" />
            <wire x2="816" y1="752" y2="1232" x1="816" />
            <wire x2="832" y1="1232" y2="1232" x1="816" />
            <wire x2="1568" y1="752" y2="752" x1="816" />
        </branch>
        <branch name="nombre_echant(13:0)">
            <wire x2="1568" y1="816" y2="816" x1="656" />
        </branch>
        <branch name="dep_sup_etal">
            <wire x2="768" y1="880" y2="880" x1="656" />
            <wire x2="1568" y1="880" y2="880" x1="768" />
            <wire x2="768" y1="880" y2="1296" x1="768" />
            <wire x2="832" y1="1296" y2="1296" x1="768" />
        </branch>
        <branch name="dep_inf_etal">
            <wire x2="1568" y1="944" y2="944" x1="656" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <wire x2="1568" y1="1008" y2="1008" x1="656" />
        </branch>
        <branch name="mode_auto">
            <wire x2="1568" y1="1072" y2="1072" x1="656" />
        </branch>
        <branch name="manu_etal">
            <wire x2="1568" y1="1136" y2="1136" x1="656" />
        </branch>
        <branch name="depassement_inf">
            <wire x2="2800" y1="1200" y2="1200" x1="2112" />
        </branch>
        <branch name="depassement_sup">
            <wire x2="2800" y1="976" y2="976" x1="2112" />
        </branch>
        <branch name="etal_on">
            <wire x2="2176" y1="768" y2="768" x1="2112" />
            <wire x2="2800" y1="768" y2="768" x1="2176" />
            <wire x2="2240" y1="304" y2="304" x1="2176" />
            <wire x2="2176" y1="304" y2="768" x1="2176" />
        </branch>
        <branch name="nombre(13:0)">
            <wire x2="2224" y1="576" y2="576" x1="2112" />
            <wire x2="2800" y1="576" y2="576" x1="2224" />
            <wire x2="2240" y1="496" y2="496" x1="2224" />
            <wire x2="2224" y1="496" y2="576" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="656" y="1136" name="manu_etal" orien="R180" />
        <iomarker fontsize="28" x="656" y="1072" name="mode_auto" orien="R180" />
        <iomarker fontsize="28" x="656" y="1008" name="nombre_etal(13:0)" orien="R180" />
        <iomarker fontsize="28" x="656" y="944" name="dep_inf_etal" orien="R180" />
        <iomarker fontsize="28" x="656" y="880" name="dep_sup_etal" orien="R180" />
        <iomarker fontsize="28" x="656" y="816" name="nombre_echant(13:0)" orien="R180" />
        <iomarker fontsize="28" x="656" y="752" name="dep_inf_echant" orien="R180" />
        <iomarker fontsize="28" x="656" y="688" name="dep_sup_echant" orien="R180" />
        <iomarker fontsize="28" x="656" y="624" name="rst" orien="R180" />
        <iomarker fontsize="28" x="656" y="560" name="clk" orien="R180" />
        <instance x="1568" y="1232" name="choix_du_mode" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2800" y="1200" name="depassement_inf" orien="R0" />
        <iomarker fontsize="28" x="2800" y="976" name="depassement_sup" orien="R0" />
        <iomarker fontsize="28" x="2800" y="768" name="etal_on" orien="R0" />
        <iomarker fontsize="28" x="2800" y="576" name="nombre(13:0)" orien="R0" />
        <instance x="2240" y="464" name="selecteur_gamme" orien="R0">
        </instance>
        <branch name="gamme(2:0)">
            <wire x2="2816" y1="176" y2="176" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2816" y="176" name="gamme(2:0)" orien="R0" />
        <instance x="832" y="1616" name="choix_auto_du_mode" orien="R0">
        </instance>
    </sheet>
</drawing>