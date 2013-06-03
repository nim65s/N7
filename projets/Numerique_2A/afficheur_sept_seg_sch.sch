<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="hex(3:0)" />
        <signal name="sept_seg(6:0)" />
        <signal name="hex_un(3:0)" />
        <signal name="hex_deux(3:0)" />
        <signal name="hex_trois(3:0)" />
        <signal name="hex_quatre(3:0)" />
        <signal name="etat_courant(1:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Input" name="hex_un(3:0)" />
        <port polarity="Input" name="hex_deux(3:0)" />
        <port polarity="Input" name="hex_trois(3:0)" />
        <port polarity="Input" name="hex_quatre(3:0)" />
        <port polarity="Input" name="etat_courant(1:0)" />
        <blockdef name="nb_to_sept_seg">
            <timestamp>2013-3-27T10:39:58</timestamp>
            <rect width="288" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-44" height="24" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
        </blockdef>
        <blockdef name="hex_state_mux">
            <timestamp>2013-3-27T10:40:3</timestamp>
            <rect width="368" x="64" y="-320" height="320" />
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
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
        </blockdef>
        <block symbolname="nb_to_sept_seg" name="hex_to_sept_seg">
            <blockpin signalname="hex(3:0)" name="nombre(3:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
        </block>
        <block symbolname="hex_state_mux" name="hex_mux">
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="etat_courant(1:0)" name="etat_courant(1:0)" />
            <blockpin signalname="hex(3:0)" name="hex_courant(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1120" y="1712" name="hex_mux" orien="R0">
        </instance>
        <instance x="1696" y="1456" name="hex_to_sept_seg" orien="R0">
        </instance>
        <branch name="hex(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1648" y="1424" type="branch" />
            <wire x2="1648" y1="1424" y2="1424" x1="1616" />
            <wire x2="1696" y1="1424" y2="1424" x1="1648" />
        </branch>
        <branch name="sept_seg(6:0)">
            <wire x2="2144" y1="1424" y2="1424" x1="2112" />
        </branch>
        <iomarker fontsize="28" x="2144" y="1424" name="sept_seg(6:0)" orien="R0" />
        <branch name="hex_un(3:0)">
            <wire x2="1104" y1="1424" y2="1424" x1="1024" />
            <wire x2="1120" y1="1424" y2="1424" x1="1104" />
        </branch>
        <branch name="hex_deux(3:0)">
            <wire x2="1104" y1="1488" y2="1488" x1="1056" />
            <wire x2="1120" y1="1488" y2="1488" x1="1104" />
        </branch>
        <branch name="hex_trois(3:0)">
            <wire x2="1104" y1="1552" y2="1552" x1="1056" />
            <wire x2="1120" y1="1552" y2="1552" x1="1104" />
        </branch>
        <branch name="hex_quatre(3:0)">
            <wire x2="1104" y1="1616" y2="1616" x1="1088" />
            <wire x2="1120" y1="1616" y2="1616" x1="1104" />
        </branch>
        <branch name="etat_courant(1:0)">
            <wire x2="1120" y1="1680" y2="1680" x1="1104" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1680" name="etat_courant(1:0)" orien="R180" />
        <iomarker fontsize="28" x="1088" y="1616" name="hex_quatre(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1552" name="hex_trois(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1056" y="1488" name="hex_deux(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1024" y="1424" name="hex_un(3:0)" orien="R180" />
    </sheet>
</drawing>