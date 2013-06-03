<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3(1:0)" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="quatre_aff(3:0)" />
        <signal name="sept_seg(6:0)" />
        <signal name="point" />
        <signal name="leds_gamme(2:0)" />
        <signal name="hex_un(3:0)" />
        <signal name="hex_deux(3:0)" />
        <signal name="hex_trois(3:0)" />
        <signal name="hex_quatre(3:0)" />
        <signal name="gamme(2:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <port polarity="Input" name="hex_un(3:0)" />
        <port polarity="Input" name="hex_deux(3:0)" />
        <port polarity="Input" name="hex_trois(3:0)" />
        <port polarity="Input" name="hex_quatre(3:0)" />
        <port polarity="Input" name="gamme(2:0)" />
        <blockdef name="afficheur_sept_seg_sch">
            <timestamp>2013-3-27T10:45:10</timestamp>
            <rect width="336" x="64" y="-320" height="320" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
        </blockdef>
        <blockdef name="machine_a_etat_afficheur">
            <timestamp>2013-4-5T6:11:17</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="choix_aff">
            <timestamp>2013-4-5T6:11:31</timestamp>
            <rect width="352" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="afficheur_gamme_sch">
            <timestamp>2013-3-27T12:1:23</timestamp>
            <rect width="368" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="496" y1="-96" y2="-96" x1="432" />
            <rect width="64" x="432" y="-44" height="24" />
            <line x2="496" y1="-32" y2="-32" x1="432" />
        </blockdef>
        <block symbolname="afficheur_sept_seg_sch" name="XLXI_2">
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="XLXN_3(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
        </block>
        <block symbolname="machine_a_etat_afficheur" name="XLXI_3">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_3(1:0)" name="etat_courant(1:0)" />
        </block>
        <block symbolname="choix_aff" name="XLXI_4">
            <blockpin signalname="XLXN_3(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="quatre_aff(3:0)" name="quatre_aff(3:0)" />
        </block>
        <block symbolname="afficheur_gamme_sch" name="XLXI_5">
            <blockpin signalname="gamme(2:0)" name="gamme(2:0)" />
            <blockpin signalname="XLXN_3(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="point" name="point" />
            <blockpin signalname="leds_gamme(2:0)" name="leds_gamme(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="1008" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1120" y="944" name="XLXI_4" orien="R0">
        </instance>
        <instance x="1136" y="1456" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_3(1:0)">
            <wire x2="1024" y1="912" y2="912" x1="752" />
            <wire x2="1120" y1="912" y2="912" x1="1024" />
            <wire x2="1024" y1="912" y2="1424" x1="1024" />
            <wire x2="1136" y1="1424" y2="1424" x1="1024" />
            <wire x2="1024" y1="1424" y2="1712" x1="1024" />
            <wire x2="1104" y1="1712" y2="1712" x1="1024" />
        </branch>
        <branch name="clk">
            <wire x2="368" y1="912" y2="912" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="912" name="clk" orien="R180" />
        <branch name="rst">
            <wire x2="368" y1="976" y2="976" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="976" name="rst" orien="R180" />
        <branch name="quatre_aff(3:0)">
            <wire x2="1632" y1="912" y2="912" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1632" y="912" name="quatre_aff(3:0)" orien="R0" />
        <branch name="sept_seg(6:0)">
            <wire x2="1632" y1="1168" y2="1168" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1168" name="sept_seg(6:0)" orien="R0" />
        <branch name="point">
            <wire x2="1632" y1="1648" y2="1648" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1648" name="point" orien="R0" />
        <branch name="leds_gamme(2:0)">
            <wire x2="1632" y1="1712" y2="1712" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1632" y="1712" name="leds_gamme(2:0)" orien="R0" />
        <branch name="hex_un(3:0)">
            <wire x2="1120" y1="1168" y2="1168" x1="480" />
            <wire x2="1136" y1="1168" y2="1168" x1="1120" />
        </branch>
        <branch name="hex_deux(3:0)">
            <wire x2="1120" y1="1232" y2="1232" x1="480" />
            <wire x2="1136" y1="1232" y2="1232" x1="1120" />
        </branch>
        <branch name="hex_trois(3:0)">
            <wire x2="1120" y1="1296" y2="1296" x1="480" />
            <wire x2="1136" y1="1296" y2="1296" x1="1120" />
        </branch>
        <branch name="hex_quatre(3:0)">
            <wire x2="1120" y1="1360" y2="1360" x1="480" />
            <wire x2="1136" y1="1360" y2="1360" x1="1120" />
        </branch>
        <branch name="gamme(2:0)">
            <wire x2="1088" y1="1648" y2="1648" x1="480" />
            <wire x2="1104" y1="1648" y2="1648" x1="1088" />
        </branch>
        <iomarker fontsize="28" x="480" y="1360" name="hex_quatre(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1296" name="hex_trois(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1232" name="hex_deux(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1168" name="hex_un(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1648" name="gamme(2:0)" orien="R180" />
        <instance x="1104" y="1744" name="XLXI_5" orien="R0">
        </instance>
    </sheet>
</drawing>