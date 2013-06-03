<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="state(1:0)" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="quatre_aff(3:0)" />
        <signal name="sept_seg(6:0)" />
        <signal name="hex_un(3:0)" />
        <signal name="hex_deux(3:0)" />
        <signal name="hex_trois(3:0)" />
        <signal name="hex_quatre(3:0)" />
        <signal name="point" />
        <signal name="pos_point(3:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Input" name="hex_un(3:0)" />
        <port polarity="Input" name="hex_deux(3:0)" />
        <port polarity="Input" name="hex_trois(3:0)" />
        <port polarity="Input" name="hex_quatre(3:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Input" name="pos_point(3:0)" />
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
        <blockdef name="position_point">
            <timestamp>2013-4-16T8:47:12</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <block symbolname="afficheur_sept_seg_sch" name="aff_sept_seg">
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="state(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
        </block>
        <block symbolname="machine_a_etat_afficheur" name="MaE_aff">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="state(1:0)" name="etat_courant(1:0)" />
        </block>
        <block symbolname="choix_aff" name="choix_digit">
            <blockpin signalname="state(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="quatre_aff(3:0)" name="quatre_aff(3:0)" />
        </block>
        <block symbolname="position_point" name="pos_pt">
            <blockpin signalname="state(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="pos_point(3:0)" name="pos_point(3:0)" />
            <blockpin signalname="point" name="point" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="368" y="1008" name="MaE_aff" orien="R0">
        </instance>
        <instance x="1120" y="944" name="choix_digit" orien="R0">
        </instance>
        <instance x="1136" y="1456" name="aff_sept_seg" orien="R0">
        </instance>
        <branch name="state(1:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="880" y="912" type="branch" />
            <wire x2="880" y1="912" y2="912" x1="752" />
            <wire x2="1024" y1="912" y2="912" x1="880" />
            <wire x2="1120" y1="912" y2="912" x1="1024" />
            <wire x2="1024" y1="912" y2="1424" x1="1024" />
            <wire x2="1136" y1="1424" y2="1424" x1="1024" />
            <wire x2="1024" y1="1424" y2="1568" x1="1024" />
            <wire x2="1200" y1="1568" y2="1568" x1="1024" />
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
        <branch name="hex_un(3:0)">
            <wire x2="1136" y1="1168" y2="1168" x1="480" />
        </branch>
        <branch name="hex_deux(3:0)">
            <wire x2="1136" y1="1232" y2="1232" x1="480" />
        </branch>
        <branch name="hex_trois(3:0)">
            <wire x2="1136" y1="1296" y2="1296" x1="480" />
        </branch>
        <branch name="hex_quatre(3:0)">
            <wire x2="1136" y1="1360" y2="1360" x1="480" />
        </branch>
        <iomarker fontsize="28" x="480" y="1360" name="hex_quatre(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1296" name="hex_trois(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1232" name="hex_deux(3:0)" orien="R180" />
        <iomarker fontsize="28" x="480" y="1168" name="hex_un(3:0)" orien="R180" />
        <instance x="1200" y="1664" name="pos_pt" orien="R0">
        </instance>
        <branch name="point">
            <wire x2="1600" y1="1568" y2="1568" x1="1584" />
            <wire x2="1648" y1="1568" y2="1568" x1="1600" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1568" name="point" orien="R0" />
        <branch name="pos_point(3:0)">
            <wire x2="1184" y1="1632" y2="1632" x1="464" />
            <wire x2="1200" y1="1632" y2="1632" x1="1184" />
        </branch>
        <iomarker fontsize="28" x="464" y="1632" name="pos_point(3:0)" orien="R180" />
    </sheet>
</drawing>