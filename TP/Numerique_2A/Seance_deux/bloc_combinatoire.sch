<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="E(0)" />
        <signal name="E(1)" />
        <signal name="E(2)" />
        <signal name="E(3)" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="S(0)" />
        <signal name="S(1)" />
        <signal name="S(2)" />
        <signal name="S(3)" />
        <signal name="E(3:0)" />
        <signal name="S(3:0)" />
        <port polarity="Input" name="E(3:0)" />
        <port polarity="Output" name="S(3:0)" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and2b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and3">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
        </blockdef>
        <blockdef name="and3b1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="or2b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="32" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="44" cy="-64" />
            <line x2="32" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="44" cy="-128" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
        </blockdef>
        <block symbolname="inv" name="XLXI_1">
            <blockpin signalname="E(0)" name="I" />
            <blockpin signalname="S(0)" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_2">
            <blockpin signalname="E(3)" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="S(1)" name="O" />
        </block>
        <block symbolname="and2b1" name="XLXI_3">
            <blockpin signalname="E(0)" name="I0" />
            <blockpin signalname="E(3)" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_4">
            <blockpin signalname="XLXN_7" name="I0" />
            <blockpin signalname="XLXN_8" name="I1" />
            <blockpin signalname="S(2)" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_5">
            <blockpin signalname="XLXN_5" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="S(3)" name="O" />
        </block>
        <block symbolname="and3" name="XLXI_6">
            <blockpin signalname="E(2)" name="I0" />
            <blockpin signalname="E(1)" name="I1" />
            <blockpin signalname="E(0)" name="I2" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="and3b1" name="XLXI_7">
            <blockpin signalname="E(2)" name="I0" />
            <blockpin signalname="E(1)" name="I1" />
            <blockpin signalname="E(0)" name="I2" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="E(2)" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="xor2" name="XLXI_9">
            <blockpin signalname="E(1)" name="I0" />
            <blockpin signalname="E(0)" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="or2b2" name="XLXI_10">
            <blockpin signalname="E(1)" name="I0" />
            <blockpin signalname="E(0)" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1920" y="352" name="XLXI_1" orien="R0" />
        <instance x="1920" y="608" name="XLXI_2" orien="R0" />
        <instance x="1600" y="544" name="XLXI_9" orien="R0" />
        <instance x="1600" y="704" name="XLXI_8" orien="R0" />
        <instance x="1600" y="896" name="XLXI_7" orien="R0" />
        <instance x="1280" y="736" name="XLXI_10" orien="R0" />
        <instance x="1920" y="784" name="XLXI_4" orien="R0" />
        <instance x="1600" y="1072" name="XLXI_6" orien="R0" />
        <instance x="1600" y="1200" name="XLXI_3" orien="R0" />
        <instance x="1920" y="1120" name="XLXI_5" orien="R0" />
        <branch name="E(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1200" y="368" type="branch" />
            <wire x2="1200" y1="224" y2="320" x1="1200" />
            <wire x2="1920" y1="320" y2="320" x1="1200" />
            <wire x2="1200" y1="320" y2="368" x1="1200" />
            <wire x2="1200" y1="368" y2="416" x1="1200" />
            <wire x2="1600" y1="416" y2="416" x1="1200" />
            <wire x2="1200" y1="416" y2="608" x1="1200" />
            <wire x2="1280" y1="608" y2="608" x1="1200" />
            <wire x2="1200" y1="608" y2="704" x1="1200" />
            <wire x2="1600" y1="704" y2="704" x1="1200" />
            <wire x2="1200" y1="704" y2="880" x1="1200" />
            <wire x2="1200" y1="880" y2="1136" x1="1200" />
            <wire x2="1200" y1="1136" y2="1200" x1="1200" />
            <wire x2="1600" y1="1136" y2="1136" x1="1200" />
            <wire x2="1600" y1="880" y2="880" x1="1200" />
        </branch>
        <branch name="E(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1120" y="368" type="branch" />
            <wire x2="1120" y1="224" y2="368" x1="1120" />
            <wire x2="1120" y1="368" y2="480" x1="1120" />
            <wire x2="1600" y1="480" y2="480" x1="1120" />
            <wire x2="1120" y1="480" y2="672" x1="1120" />
            <wire x2="1280" y1="672" y2="672" x1="1120" />
            <wire x2="1120" y1="672" y2="768" x1="1120" />
            <wire x2="1120" y1="768" y2="944" x1="1120" />
            <wire x2="1120" y1="944" y2="1200" x1="1120" />
            <wire x2="1600" y1="944" y2="944" x1="1120" />
            <wire x2="1600" y1="768" y2="768" x1="1120" />
        </branch>
        <branch name="E(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1040" y="368" type="branch" />
            <wire x2="1040" y1="224" y2="368" x1="1040" />
            <wire x2="1040" y1="368" y2="576" x1="1040" />
            <wire x2="1600" y1="576" y2="576" x1="1040" />
            <wire x2="1040" y1="576" y2="832" x1="1040" />
            <wire x2="1040" y1="832" y2="1008" x1="1040" />
            <wire x2="1040" y1="1008" y2="1200" x1="1040" />
            <wire x2="1600" y1="1008" y2="1008" x1="1040" />
            <wire x2="1600" y1="832" y2="832" x1="1040" />
        </branch>
        <branch name="E(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="960" y="368" type="branch" />
            <wire x2="960" y1="224" y2="368" x1="960" />
            <wire x2="960" y1="368" y2="544" x1="960" />
            <wire x2="1920" y1="544" y2="544" x1="960" />
            <wire x2="960" y1="544" y2="1072" x1="960" />
            <wire x2="960" y1="1072" y2="1200" x1="960" />
            <wire x2="1600" y1="1072" y2="1072" x1="960" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1888" y1="1104" y2="1104" x1="1856" />
            <wire x2="1888" y1="1056" y2="1104" x1="1888" />
            <wire x2="1920" y1="1056" y2="1056" x1="1888" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1888" y1="944" y2="944" x1="1856" />
            <wire x2="1888" y1="944" y2="992" x1="1888" />
            <wire x2="1920" y1="992" y2="992" x1="1888" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1888" y1="768" y2="768" x1="1856" />
            <wire x2="1888" y1="720" y2="768" x1="1888" />
            <wire x2="1920" y1="720" y2="720" x1="1888" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1888" y1="608" y2="608" x1="1856" />
            <wire x2="1888" y1="608" y2="656" x1="1888" />
            <wire x2="1920" y1="656" y2="656" x1="1888" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1888" y1="448" y2="448" x1="1856" />
            <wire x2="1888" y1="448" y2="480" x1="1888" />
            <wire x2="1920" y1="480" y2="480" x1="1888" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="1600" y1="640" y2="640" x1="1536" />
        </branch>
        <branch name="S(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="320" type="branch" />
            <wire x2="2240" y1="320" y2="320" x1="2144" />
            <wire x2="2256" y1="320" y2="320" x1="2240" />
        </branch>
        <branch name="S(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="512" type="branch" />
            <wire x2="2240" y1="512" y2="512" x1="2176" />
            <wire x2="2256" y1="512" y2="512" x1="2240" />
        </branch>
        <branch name="S(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="688" type="branch" />
            <wire x2="2240" y1="688" y2="688" x1="2176" />
            <wire x2="2256" y1="688" y2="688" x1="2240" />
        </branch>
        <branch name="S(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2240" y="1024" type="branch" />
            <wire x2="2240" y1="1024" y2="1024" x1="2176" />
            <wire x2="2256" y1="1024" y2="1024" x1="2240" />
        </branch>
        <branch name="E(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1056" y="128" type="branch" />
            <wire x2="960" y1="128" y2="128" x1="928" />
            <wire x2="1040" y1="128" y2="128" x1="960" />
            <wire x2="1056" y1="128" y2="128" x1="1040" />
            <wire x2="1120" y1="128" y2="128" x1="1056" />
            <wire x2="1200" y1="128" y2="128" x1="1120" />
        </branch>
        <bustap x2="960" y1="128" y2="224" x1="960" />
        <bustap x2="1040" y1="128" y2="224" x1="1040" />
        <bustap x2="1120" y1="128" y2="224" x1="1120" />
        <bustap x2="1200" y1="128" y2="224" x1="1200" />
        <iomarker fontsize="28" x="928" y="128" name="E(3:0)" orien="R180" />
        <bustap x2="2256" y1="1024" y2="1024" x1="2352" />
        <bustap x2="2256" y1="688" y2="688" x1="2352" />
        <bustap x2="2256" y1="512" y2="512" x1="2352" />
        <bustap x2="2256" y1="320" y2="320" x1="2352" />
        <branch name="S(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2400" y="240" type="branch" />
            <wire x2="2352" y1="240" y2="320" x1="2352" />
            <wire x2="2352" y1="320" y2="512" x1="2352" />
            <wire x2="2352" y1="512" y2="688" x1="2352" />
            <wire x2="2352" y1="688" y2="1024" x1="2352" />
            <wire x2="2352" y1="1024" y2="1040" x1="2352" />
            <wire x2="2400" y1="240" y2="240" x1="2352" />
            <wire x2="2448" y1="240" y2="240" x1="2400" />
        </branch>
        <iomarker fontsize="28" x="2448" y="240" name="S(3:0)" orien="R0" />
    </sheet>
</drawing>