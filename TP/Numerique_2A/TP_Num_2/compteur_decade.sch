<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q(0)" />
        <signal name="Q(1)" />
        <signal name="Q(2)" />
        <signal name="Q(3)" />
        <signal name="CLK" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="D(3:0)" />
        <signal name="D(0)" />
        <signal name="D(1)" />
        <signal name="D(2)" />
        <signal name="D(3)" />
        <signal name="Q(3:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q(3:0)" />
        <blockdef name="bloc_combinatoire">
            <timestamp>2012-12-14T8:54:25</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="fd4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <block symbolname="fd4ce" name="bascule_D">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_13" name="CE" />
            <blockpin signalname="XLXN_12" name="CLR" />
            <blockpin signalname="D(0)" name="D0" />
            <blockpin signalname="D(1)" name="D1" />
            <blockpin signalname="D(2)" name="D2" />
            <blockpin signalname="D(3)" name="D3" />
            <blockpin signalname="Q(0)" name="Q0" />
            <blockpin signalname="Q(1)" name="Q1" />
            <blockpin signalname="Q(2)" name="Q2" />
            <blockpin signalname="Q(3)" name="Q3" />
        </block>
        <block symbolname="gnd" name="XLXI_5">
            <blockpin signalname="XLXN_12" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_6">
            <blockpin signalname="XLXN_13" name="P" />
        </block>
        <block symbolname="bloc_combinatoire" name="XLXI_8">
            <blockpin signalname="Q(3:0)" name="E(3:0)" />
            <blockpin signalname="D(3:0)" name="S(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1344" y="1632" name="bascule_D" orien="R0" />
        <branch name="Q(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1184" type="branch" />
            <wire x2="1776" y1="1184" y2="1184" x1="1728" />
            <wire x2="1792" y1="1184" y2="1184" x1="1776" />
        </branch>
        <branch name="Q(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1248" type="branch" />
            <wire x2="1776" y1="1248" y2="1248" x1="1728" />
            <wire x2="1792" y1="1248" y2="1248" x1="1776" />
        </branch>
        <branch name="Q(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1312" type="branch" />
            <wire x2="1776" y1="1312" y2="1312" x1="1728" />
            <wire x2="1792" y1="1312" y2="1312" x1="1776" />
        </branch>
        <branch name="Q(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1376" type="branch" />
            <wire x2="1776" y1="1376" y2="1376" x1="1728" />
            <wire x2="1792" y1="1376" y2="1376" x1="1776" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="1504" type="branch" />
            <wire x2="1280" y1="1504" y2="1504" x1="1200" />
            <wire x2="1344" y1="1504" y2="1504" x1="1280" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1344" y1="1600" y2="1616" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="1200" y="1504" name="CLK" orien="R180" />
        <instance x="1728" y="1040" name="XLXI_8" orien="M0">
        </instance>
        <branch name="D(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1280" y="1008" type="branch" />
            <wire x2="1200" y1="1008" y2="1184" x1="1200" />
            <wire x2="1200" y1="1184" y2="1248" x1="1200" />
            <wire x2="1200" y1="1248" y2="1312" x1="1200" />
            <wire x2="1200" y1="1312" y2="1376" x1="1200" />
            <wire x2="1280" y1="1008" y2="1008" x1="1200" />
            <wire x2="1344" y1="1008" y2="1008" x1="1280" />
        </branch>
        <bustap x2="1296" y1="1184" y2="1184" x1="1200" />
        <branch name="D(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1184" type="branch" />
            <wire x2="1328" y1="1184" y2="1184" x1="1296" />
            <wire x2="1344" y1="1184" y2="1184" x1="1328" />
        </branch>
        <bustap x2="1296" y1="1248" y2="1248" x1="1200" />
        <branch name="D(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1248" type="branch" />
            <wire x2="1328" y1="1248" y2="1248" x1="1296" />
            <wire x2="1344" y1="1248" y2="1248" x1="1328" />
        </branch>
        <bustap x2="1296" y1="1312" y2="1312" x1="1200" />
        <branch name="D(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1312" type="branch" />
            <wire x2="1328" y1="1312" y2="1312" x1="1296" />
            <wire x2="1344" y1="1312" y2="1312" x1="1328" />
        </branch>
        <bustap x2="1296" y1="1376" y2="1376" x1="1200" />
        <branch name="D(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1328" y="1376" type="branch" />
            <wire x2="1328" y1="1376" y2="1376" x1="1296" />
            <wire x2="1344" y1="1376" y2="1376" x1="1328" />
        </branch>
        <instance x="1280" y="1744" name="XLXI_5" orien="R0" />
        <branch name="XLXN_13">
            <wire x2="1136" y1="1424" y2="1440" x1="1136" />
            <wire x2="1344" y1="1440" y2="1440" x1="1136" />
        </branch>
        <instance x="1072" y="1424" name="XLXI_6" orien="R0" />
        <bustap x2="1792" y1="1184" y2="1184" x1="1888" />
        <bustap x2="1792" y1="1248" y2="1248" x1="1888" />
        <bustap x2="1792" y1="1312" y2="1312" x1="1888" />
        <bustap x2="1792" y1="1376" y2="1376" x1="1888" />
        <branch name="Q(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1808" y="1008" type="branch" />
            <wire x2="1808" y1="1008" y2="1008" x1="1728" />
            <wire x2="1888" y1="1008" y2="1008" x1="1808" />
            <wire x2="1888" y1="1008" y2="1184" x1="1888" />
            <wire x2="1888" y1="1184" y2="1248" x1="1888" />
            <wire x2="1888" y1="1248" y2="1312" x1="1888" />
            <wire x2="1888" y1="1312" y2="1376" x1="1888" />
            <wire x2="1920" y1="1008" y2="1008" x1="1888" />
        </branch>
        <iomarker fontsize="28" x="1920" y="1008" name="Q(3:0)" orien="R0" />
    </sheet>
</drawing>