<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="gamme(2:0)" />
        <signal name="etat_courant(1:0)" />
        <signal name="point" />
        <signal name="leds_gamme(2:0)" />
        <port polarity="Input" name="gamme(2:0)" />
        <port polarity="Input" name="etat_courant(1:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <blockdef name="set_point">
            <timestamp>2013-3-27T10:46:3</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="set_leds_gamme">
            <timestamp>2013-3-27T10:46:9</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <block symbolname="set_point" name="XLXI_1">
            <blockpin signalname="etat_courant(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="gamme(2:0)" name="gamme(2:0)" />
            <blockpin signalname="point" name="point" />
        </block>
        <block symbolname="set_leds_gamme" name="XLXI_2">
            <blockpin signalname="gamme(2:0)" name="gamme(2:0)" />
            <blockpin signalname="leds_gamme(2:0)" name="leds_gamme(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1184" y="1216" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1152" y="1344" name="XLXI_2" orien="R0">
        </instance>
        <branch name="gamme(2:0)">
            <wire x2="1136" y1="1312" y2="1312" x1="1120" />
            <wire x2="1152" y1="1312" y2="1312" x1="1136" />
            <wire x2="1136" y1="1184" y2="1312" x1="1136" />
            <wire x2="1184" y1="1184" y2="1184" x1="1136" />
        </branch>
        <branch name="etat_courant(1:0)">
            <wire x2="1184" y1="1120" y2="1120" x1="1136" />
        </branch>
        <branch name="point">
            <wire x2="1584" y1="1120" y2="1120" x1="1568" />
            <wire x2="1632" y1="1120" y2="1120" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1120" name="etat_courant(1:0)" orien="R180" />
        <iomarker fontsize="28" x="1120" y="1312" name="gamme(2:0)" orien="R180" />
        <branch name="leds_gamme(2:0)">
            <wire x2="1632" y1="1312" y2="1312" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1312" name="leds_gamme(2:0)" orien="R0" />
        <iomarker fontsize="28" x="1632" y="1120" name="point" orien="R0" />
    </sheet>
</drawing>