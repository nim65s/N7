<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="hex_un(3:0)" />
        <signal name="hex_deux(3:0)" />
        <signal name="hex_trois(3:0)" />
        <signal name="hex_quatre(3:0)" />
        <signal name="rst" />
        <signal name="nombre_out(13:0)" />
        <signal name="dep_sup_echant" />
        <signal name="dep_inf_echant" />
        <signal name="nombre_in(13:0)" />
        <signal name="nombre_echant(13:0)" />
        <signal name="dep_sup_etal" />
        <signal name="dep_inf_etal" />
        <signal name="auto_on" />
        <signal name="mode_auto" />
        <signal name="nombre_etal(13:0)" />
        <signal name="etal_on" />
        <signal name="depassement_sup" />
        <signal name="depassement_inf" />
        <signal name="pos_point(3:0)" />
        <signal name="leds_gamme(2:0)" />
        <signal name="point" />
        <signal name="sept_seg(6:0)" />
        <signal name="quatre_aff(3:0)" />
        <signal name="manu_etal" />
        <signal name="XLXN_1" />
        <signal name="entree" />
        <signal name="XLXN_6" />
        <signal name="XLXN_8" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="auto_on" />
        <port polarity="Input" name="mode_auto" />
        <port polarity="Output" name="etal_on" />
        <port polarity="Output" name="depassement_sup" />
        <port polarity="Output" name="depassement_inf" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Input" name="manu_etal" />
        <port polarity="Input" name="entree" />
        <blockdef name="afficheur_sch">
            <timestamp>2013-5-21T11:2:54</timestamp>
            <rect width="336" x="64" y="-448" height="448" />
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
            <rect width="64" x="400" y="-428" height="24" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="conversion_decimale">
            <timestamp>2013-5-28T9:20:36</timestamp>
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
            <rect width="64" x="384" y="20" height="24" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="320" x="64" y="-256" height="376" />
        </blockdef>
        <blockdef name="bascule_D">
            <timestamp>2013-5-14T9:49:56</timestamp>
            <rect width="400" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="compteurs">
            <timestamp>2013-5-28T9:18:16</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <rect width="64" x="368" y="-44" height="24" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="selection_mode">
            <timestamp>2013-5-28T9:40:53</timestamp>
            <rect width="416" x="64" y="-640" height="640" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="480" y="-44" height="24" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
            <line x2="544" y1="-112" y2="-112" x1="480" />
            <rect width="64" x="480" y="-476" height="24" />
            <line x2="544" y1="-464" y2="-464" x1="480" />
            <line x2="544" y1="-192" y2="-192" x1="480" />
            <line x2="544" y1="-400" y2="-400" x1="480" />
        </blockdef>
        <block symbolname="bascule_D" name="basc_D">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="nombre_in(13:0)" name="nombre_in(13:0)" />
            <blockpin signalname="nombre_out(13:0)" name="nombre_out(13:0)" />
        </block>
        <block symbolname="conversion_decimale" name="conversion">
            <blockpin signalname="etal_on" name="etal_on" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="nombre_out(13:0)" name="nombre(13:0)" />
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="pos_point(3:0)" name="pos_point(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="mode_auto" name="I" />
            <blockpin signalname="auto_on" name="O" />
        </block>
        <block symbolname="afficheur_sch" name="affichage">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="pos_point(3:0)" name="pos_point(3:0)" />
            <blockpin signalname="quatre_aff(3:0)" name="quatre_aff(3:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
            <blockpin signalname="point" name="point" />
        </block>
        <block symbolname="compteurs" name="etalonnage_et_echantillonnage">
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_echant" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre_echant(13:0)" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="dep_inf_etal" name="dep_inf_etal" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre_etal(13:0)" />
        </block>
        <block symbolname="selection_mode" name="selecteur_de_mode">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_echant" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre_echant(13:0)" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="dep_inf_etal" name="dep_inf_etal" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre_etal(13:0)" />
            <blockpin signalname="mode_auto" name="mode_auto" />
            <blockpin signalname="manu_etal" name="manu_etal" />
            <blockpin signalname="leds_gamme(2:0)" name="gamme(2:0)" />
            <blockpin signalname="depassement_sup" name="depassement_sup" />
            <blockpin signalname="nombre_in(13:0)" name="nombre(13:0)" />
            <blockpin signalname="depassement_inf" name="depassement_inf" />
            <blockpin signalname="etal_on" name="etal_on" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="hex_un(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4128" y="1216" type="branch" />
            <wire x2="4128" y1="1216" y2="1216" x1="4032" />
            <wire x2="4240" y1="1216" y2="1216" x1="4128" />
        </branch>
        <branch name="hex_deux(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1280" type="branch" />
            <wire x2="4144" y1="1280" y2="1280" x1="4032" />
            <wire x2="4240" y1="1280" y2="1280" x1="4144" />
        </branch>
        <branch name="hex_trois(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1344" type="branch" />
            <wire x2="4144" y1="1344" y2="1344" x1="4032" />
            <wire x2="4240" y1="1344" y2="1344" x1="4144" />
        </branch>
        <branch name="hex_quatre(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1408" type="branch" />
            <wire x2="4144" y1="1408" y2="1408" x1="4032" />
            <wire x2="4240" y1="1408" y2="1408" x1="4144" />
        </branch>
        <branch name="nombre_out(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3488" y="1408" type="branch" />
            <wire x2="3488" y1="1408" y2="1408" x1="3392" />
            <wire x2="3584" y1="1408" y2="1408" x1="3488" />
        </branch>
        <instance x="3584" y="1440" name="conversion" orien="R0">
        </instance>
        <branch name="nombre_in(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2720" y="1408" type="branch" />
            <wire x2="2720" y1="1408" y2="1408" x1="2576" />
            <wire x2="2864" y1="1408" y2="1408" x1="2720" />
        </branch>
        <branch name="nombre_echant(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1520" type="branch" />
            <wire x2="1776" y1="1520" y2="1520" x1="1616" />
            <wire x2="2032" y1="1520" y2="1520" x1="1776" />
        </branch>
        <branch name="dep_sup_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1744" y="1392" type="branch" />
            <wire x2="1744" y1="1392" y2="1392" x1="1616" />
            <wire x2="2032" y1="1392" y2="1392" x1="1744" />
        </branch>
        <branch name="dep_inf_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1728" y="1648" type="branch" />
            <wire x2="1728" y1="1648" y2="1648" x1="1616" />
            <wire x2="2032" y1="1648" y2="1648" x1="1728" />
        </branch>
        <branch name="auto_on">
            <wire x2="4736" y1="1952" y2="1952" x1="2368" />
        </branch>
        <instance x="2864" y="1440" name="basc_D" orien="R0">
        </instance>
        <branch name="rst">
            <wire x2="1168" y1="1152" y2="1152" x1="1104" />
            <wire x2="1936" y1="1152" y2="1152" x1="1168" />
            <wire x2="1936" y1="1152" y2="1328" x1="1936" />
            <wire x2="2032" y1="1328" y2="1328" x1="1936" />
            <wire x2="2816" y1="1152" y2="1152" x1="1936" />
            <wire x2="4240" y1="1152" y2="1152" x1="2816" />
            <wire x2="2816" y1="1152" y2="1344" x1="2816" />
            <wire x2="2864" y1="1344" y2="1344" x1="2816" />
            <wire x2="1168" y1="1152" y2="1392" x1="1168" />
            <wire x2="1184" y1="1392" y2="1392" x1="1168" />
        </branch>
        <branch name="dep_sup_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1728" y="1584" type="branch" />
            <wire x2="1728" y1="1584" y2="1584" x1="1616" />
            <wire x2="2032" y1="1584" y2="1584" x1="1728" />
        </branch>
        <branch name="dep_inf_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1744" y="1456" type="branch" />
            <wire x2="1744" y1="1456" y2="1456" x1="1616" />
            <wire x2="2032" y1="1456" y2="1456" x1="1744" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1712" type="branch" />
            <wire x2="1776" y1="1712" y2="1712" x1="1616" />
            <wire x2="2032" y1="1712" y2="1712" x1="1776" />
        </branch>
        <branch name="etal_on">
            <wire x2="3504" y1="1472" y2="1472" x1="2576" />
            <wire x2="3584" y1="1472" y2="1472" x1="3504" />
            <wire x2="3504" y1="1472" y2="1616" x1="3504" />
            <wire x2="4736" y1="1616" y2="1616" x1="3504" />
        </branch>
        <branch name="depassement_inf">
            <wire x2="4736" y1="1680" y2="1680" x1="2576" />
        </branch>
        <branch name="mode_auto">
            <wire x2="1968" y1="1776" y2="1776" x1="1136" />
            <wire x2="2032" y1="1776" y2="1776" x1="1968" />
            <wire x2="1968" y1="1776" y2="1952" x1="1968" />
            <wire x2="2144" y1="1952" y2="1952" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="1104" y="1152" name="rst" orien="R180" />
        <iomarker fontsize="28" x="1104" y="1088" name="clk" orien="R180" />
        <branch name="pos_point(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4144" y="1472" type="branch" />
            <wire x2="4144" y1="1472" y2="1472" x1="4032" />
            <wire x2="4240" y1="1472" y2="1472" x1="4144" />
        </branch>
        <iomarker fontsize="28" x="4736" y="1616" name="etal_on" orien="R0" />
        <instance x="4240" y="1504" name="affichage" orien="R0">
        </instance>
        <branch name="point">
            <wire x2="4752" y1="1472" y2="1472" x1="4704" />
        </branch>
        <iomarker fontsize="28" x="4752" y="1472" name="point" orien="R0" />
        <branch name="sept_seg(6:0)">
            <wire x2="4736" y1="1280" y2="1280" x1="4704" />
        </branch>
        <iomarker fontsize="28" x="4736" y="1280" name="sept_seg(6:0)" orien="R0" />
        <branch name="quatre_aff(3:0)">
            <wire x2="4736" y1="1088" y2="1088" x1="4704" />
        </branch>
        <iomarker fontsize="28" x="4736" y="1088" name="quatre_aff(3:0)" orien="R0" />
        <branch name="clk">
            <wire x2="1120" y1="1088" y2="1088" x1="1104" />
            <wire x2="1984" y1="1088" y2="1088" x1="1120" />
            <wire x2="1984" y1="1088" y2="1264" x1="1984" />
            <wire x2="2032" y1="1264" y2="1264" x1="1984" />
            <wire x2="2848" y1="1088" y2="1088" x1="1984" />
            <wire x2="3504" y1="1088" y2="1088" x1="2848" />
            <wire x2="4240" y1="1088" y2="1088" x1="3504" />
            <wire x2="3504" y1="1088" y2="1216" x1="3504" />
            <wire x2="3584" y1="1216" y2="1216" x1="3504" />
            <wire x2="2848" y1="1088" y2="1280" x1="2848" />
            <wire x2="2864" y1="1280" y2="1280" x1="2848" />
            <wire x2="1120" y1="1088" y2="1552" x1="1120" />
            <wire x2="1184" y1="1552" y2="1552" x1="1120" />
        </branch>
        <branch name="manu_etal">
            <wire x2="2032" y1="1840" y2="1840" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1840" name="manu_etal" orien="R180" />
        <iomarker fontsize="28" x="1136" y="1776" name="mode_auto" orien="R180" />
        <instance x="1184" y="1744" name="etalonnage_et_echantillonnage" orien="R0">
        </instance>
        <branch name="entree">
            <wire x2="1184" y1="1712" y2="1712" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1712" name="entree" orien="R180" />
        <branch name="leds_gamme(2:0)">
            <wire x2="4720" y1="1840" y2="1840" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="4720" y="1840" name="leds_gamme(2:0)" orien="R0" />
        <iomarker fontsize="28" x="4736" y="1680" name="depassement_inf" orien="R0" />
        <instance x="2144" y="1984" name="XLXI_14" orien="R0" />
        <iomarker fontsize="28" x="4736" y="1952" name="auto_on" orien="R0" />
        <instance x="2032" y="1872" name="selecteur_de_mode" orien="R0">
        </instance>
        <branch name="depassement_sup">
            <wire x2="2592" y1="1760" y2="1760" x1="2576" />
            <wire x2="4736" y1="1760" y2="1760" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="4736" y="1760" name="depassement_sup" orien="R0" />
    </sheet>
</drawing>