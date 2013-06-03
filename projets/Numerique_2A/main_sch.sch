<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5(3:0)" />
        <signal name="XLXN_6(3:0)" />
        <signal name="XLXN_7(3:0)" />
        <signal name="XLXN_8(3:0)" />
        <signal name="XLXN_9(13:0)" />
        <signal name="clk" />
        <signal name="XLXN_19(2:0)" />
        <signal name="rst" />
        <signal name="depassement_sup" />
        <signal name="depassement_inf" />
        <signal name="entree" />
        <signal name="quatre_aff(3:0)" />
        <signal name="sept_seg(6:0)" />
        <signal name="point" />
        <signal name="leds_gamme(2:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="depassement_sup" />
        <port polarity="Output" name="depassement_inf" />
        <port polarity="Input" name="entree" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <blockdef name="afficheur_sch">
            <timestamp>2013-4-5T6:13:13</timestamp>
            <rect width="352" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
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
            <rect width="64" x="416" y="-428" height="24" />
            <line x2="480" y1="-416" y2="-416" x1="416" />
            <rect width="64" x="416" y="-300" height="24" />
            <line x2="480" y1="-288" y2="-288" x1="416" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="compteur_echantillonage">
            <timestamp>2013-4-5T7:7:23</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="conversion_decimale">
            <timestamp>2013-4-5T7:8:45</timestamp>
            <rect width="320" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-172" height="24" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <rect width="64" x="384" y="-108" height="24" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <block symbolname="afficheur_sch" name="XLXI_2">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_5(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="XLXN_7(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="XLXN_8(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="XLXN_19(2:0)" name="gamme(2:0)" />
            <blockpin signalname="quatre_aff(3:0)" name="quatre_aff(3:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
            <blockpin signalname="point" name="point" />
            <blockpin signalname="leds_gamme(2:0)" name="leds_gamme(2:0)" />
        </block>
        <block symbolname="compteur_echantillonage" name="XLXI_8">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="depassement_sup" name="depassement_sup" />
            <blockpin signalname="depassement_inf" name="depassement_inf" />
            <blockpin signalname="XLXN_9(13:0)" name="nombre(13:0)" />
            <blockpin signalname="XLXN_19(2:0)" name="gamme(2:0)" />
        </block>
        <block symbolname="conversion_decimale" name="XLXI_9">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_9(13:0)" name="nombre(13:0)" />
            <blockpin signalname="XLXN_5(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="XLXN_6(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="XLXN_7(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="XLXN_8(3:0)" name="hex_quatre(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1696" y="1504" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_5(3:0)">
            <wire x2="1696" y1="1216" y2="1216" x1="1488" />
        </branch>
        <branch name="XLXN_6(3:0)">
            <wire x2="1696" y1="1280" y2="1280" x1="1488" />
        </branch>
        <branch name="XLXN_7(3:0)">
            <wire x2="1696" y1="1344" y2="1344" x1="1488" />
        </branch>
        <branch name="XLXN_8(3:0)">
            <wire x2="1696" y1="1408" y2="1408" x1="1488" />
        </branch>
        <branch name="XLXN_9(13:0)">
            <wire x2="1040" y1="1408" y2="1408" x1="944" />
        </branch>
        <branch name="clk">
            <wire x2="496" y1="1088" y2="1088" x1="368" />
            <wire x2="496" y1="1088" y2="1376" x1="496" />
            <wire x2="560" y1="1376" y2="1376" x1="496" />
            <wire x2="1024" y1="1088" y2="1088" x1="496" />
            <wire x2="1696" y1="1088" y2="1088" x1="1024" />
            <wire x2="1024" y1="1088" y2="1216" x1="1024" />
            <wire x2="1040" y1="1216" y2="1216" x1="1024" />
        </branch>
        <branch name="XLXN_19(2:0)">
            <wire x2="1696" y1="1472" y2="1472" x1="944" />
        </branch>
        <branch name="rst">
            <wire x2="448" y1="1152" y2="1152" x1="368" />
            <wire x2="1696" y1="1152" y2="1152" x1="448" />
            <wire x2="448" y1="1152" y2="1472" x1="448" />
            <wire x2="560" y1="1472" y2="1472" x1="448" />
        </branch>
        <branch name="depassement_sup">
            <wire x2="960" y1="1280" y2="1280" x1="944" />
            <wire x2="1024" y1="1280" y2="1280" x1="960" />
            <wire x2="1024" y1="1280" y2="1584" x1="1024" />
            <wire x2="2208" y1="1584" y2="1584" x1="1024" />
        </branch>
        <branch name="entree">
            <wire x2="560" y1="1280" y2="1280" x1="368" />
        </branch>
        <iomarker fontsize="28" x="368" y="1088" name="clk" orien="R180" />
        <iomarker fontsize="28" x="368" y="1152" name="rst" orien="R180" />
        <iomarker fontsize="28" x="368" y="1280" name="entree" orien="R180" />
        <branch name="quatre_aff(3:0)">
            <wire x2="2208" y1="1088" y2="1088" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1088" name="quatre_aff(3:0)" orien="R0" />
        <branch name="sept_seg(6:0)">
            <wire x2="2208" y1="1216" y2="1216" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1216" name="sept_seg(6:0)" orien="R0" />
        <branch name="point">
            <wire x2="2208" y1="1344" y2="1344" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1344" name="point" orien="R0" />
        <branch name="leds_gamme(2:0)">
            <wire x2="2208" y1="1472" y2="1472" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1472" name="leds_gamme(2:0)" orien="R0" />
        <iomarker fontsize="28" x="2208" y="1584" name="depassement_sup" orien="R0" />
        <iomarker fontsize="28" x="2208" y="1648" name="depassement_inf" orien="R0" />
        <branch name="depassement_inf">
            <wire x2="960" y1="1344" y2="1344" x1="944" />
            <wire x2="960" y1="1344" y2="1648" x1="960" />
            <wire x2="2208" y1="1648" y2="1648" x1="960" />
        </branch>
        <instance x="560" y="1504" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1040" y="1440" name="XLXI_9" orien="R0">
        </instance>
    </sheet>
</drawing>