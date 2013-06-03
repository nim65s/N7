<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="depassement_inf" />
        <signal name="depassement_sup" />
        <signal name="hex_un(3:0)" />
        <signal name="hex_deux(3:0)" />
        <signal name="hex_trois(3:0)" />
        <signal name="hex_quatre(3:0)" />
        <signal name="quatre_aff(3:0)" />
        <signal name="sept_seg(6:0)" />
        <signal name="point" />
        <signal name="leds_gamme(2:0)" />
        <signal name="pos_point(3:0)" />
        <signal name="rst" />
        <signal name="nombre_out(13:0)" />
        <signal name="dep_sup_echant" />
        <signal name="dep_inf_echant" />
        <signal name="nombre_in(13:0)" />
        <signal name="nombre_echant(13:0)" />
        <signal name="dep_sup_etal" />
        <signal name="dep_inf_etal" />
        <signal name="nombre_etal(13:0)" />
        <signal name="XLXN_39" />
        <signal name="entree" />
        <signal name="etal_on" />
        <signal name="manu_etal" />
        <signal name="mode_auto" />
        <signal name="auto_on" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="depassement_inf" />
        <port polarity="Output" name="depassement_sup" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="entree" />
        <port polarity="Output" name="etal_on" />
        <port polarity="Input" name="manu_etal" />
        <port polarity="Input" name="mode_auto" />
        <port polarity="Output" name="auto_on" />
        <blockdef name="afficheur_sch">
            <timestamp>2013-4-16T8:52:7</timestamp>
            <rect width="352" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
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
            <rect width="64" x="416" y="-492" height="24" />
            <line x2="480" y1="-480" y2="-480" x1="416" />
            <rect width="64" x="416" y="-348" height="24" />
            <line x2="480" y1="-336" y2="-336" x1="416" />
            <rect width="64" x="416" y="-204" height="24" />
            <line x2="480" y1="-192" y2="-192" x1="416" />
            <line x2="480" y1="-48" y2="-48" x1="416" />
        </blockdef>
        <blockdef name="conversion_decimale">
            <timestamp>2013-5-14T9:49:17</timestamp>
            <rect width="64" x="384" y="84" height="24" />
            <line x2="448" y1="96" y2="96" x1="384" />
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
            <rect width="320" x="64" y="-256" height="384" />
        </blockdef>
        <blockdef name="compteur_etalonnage">
            <timestamp>2013-5-14T9:49:29</timestamp>
            <rect width="256" x="64" y="-240" height="240" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="choix_etal_echant">
            <timestamp>2013-5-14T9:49:44</timestamp>
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="416" x="64" y="-440" height="256" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
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
        <blockdef name="compteur_echantillonnage">
            <timestamp>2013-5-14T9:50:8</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="choix_mode">
            <timestamp>2013-5-14T9:47:19</timestamp>
            <rect width="416" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="544" y1="-464" y2="-464" x1="480" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="544" y1="-256" y2="-256" x1="480" />
            <rect width="64" x="480" y="-668" height="24" />
            <line x2="544" y1="-656" y2="-656" x1="480" />
            <line x2="544" y1="-32" y2="-32" x1="480" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="compteur_etalonnage" name="cmpt_etal">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_etal" name="depassement_sup" />
            <blockpin signalname="dep_inf_etal" name="depassement_inf" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="compteur_echantillonnage" name="compt_echant">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_echant" name="depassement_sup" />
            <blockpin signalname="dep_inf_echant" name="depassement_inf" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="afficheur_sch" name="affichage">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin name="gamme(2:0)" />
            <blockpin signalname="pos_point(3:0)" name="pos_point(3:0)" />
            <blockpin signalname="quatre_aff(3:0)" name="quatre_aff(3:0)" />
            <blockpin signalname="sept_seg(6:0)" name="sept_seg(6:0)" />
            <blockpin signalname="leds_gamme(2:0)" name="leds_gamme(2:0)" />
            <blockpin signalname="point" name="point" />
        </block>
        <block symbolname="choix_etal_echant" name="choix_auto">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_echant" />
            <blockpin signalname="dep_inf_etal" name="dep_inf_etal" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="XLXN_39" name="etalonnage_on" />
        </block>
        <block symbolname="bascule_D" name="basc_D">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="nombre_in(13:0)" name="nombre_in(13:0)" />
            <blockpin signalname="nombre_out(13:0)" name="nombre_out(13:0)" />
        </block>
        <block symbolname="conversion_decimale" name="conversion">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="nombre_out(13:0)" name="nombre(13:0)" />
            <blockpin signalname="hex_un(3:0)" name="hex_un(3:0)" />
            <blockpin signalname="hex_deux(3:0)" name="hex_deux(3:0)" />
            <blockpin signalname="hex_trois(3:0)" name="hex_trois(3:0)" />
            <blockpin signalname="hex_quatre(3:0)" name="hex_quatre(3:0)" />
            <blockpin signalname="pos_point(3:0)" name="pos_point(3:0)" />
        </block>
        <block symbolname="choix_mode" name="choix_du_mode">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="mode_auto" name="mode_auto" />
            <blockpin signalname="XLXN_39" name="auto_etal" />
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
            <blockpin signalname="nombre_in(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="buf" name="XLXI_13">
            <blockpin signalname="mode_auto" name="I" />
            <blockpin signalname="auto_on" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <iomarker fontsize="28" x="368" y="1088" name="clk" orien="R180" />
        <iomarker fontsize="28" x="368" y="1152" name="rst" orien="R180" />
        <branch name="clk">
            <wire x2="496" y1="1088" y2="1088" x1="368" />
            <wire x2="1984" y1="1088" y2="1088" x1="496" />
            <wire x2="1984" y1="1088" y2="1264" x1="1984" />
            <wire x2="2032" y1="1264" y2="1264" x1="1984" />
            <wire x2="2848" y1="1088" y2="1088" x1="1984" />
            <wire x2="3504" y1="1088" y2="1088" x1="2848" />
            <wire x2="4240" y1="1088" y2="1088" x1="3504" />
            <wire x2="3504" y1="1088" y2="1216" x1="3504" />
            <wire x2="3584" y1="1216" y2="1216" x1="3504" />
            <wire x2="2848" y1="1088" y2="1280" x1="2848" />
            <wire x2="2864" y1="1280" y2="1280" x1="2848" />
            <wire x2="496" y1="1088" y2="1456" x1="496" />
            <wire x2="496" y1="1456" y2="1680" x1="496" />
            <wire x2="560" y1="1680" y2="1680" x1="496" />
            <wire x2="496" y1="1680" y2="1952" x1="496" />
            <wire x2="1152" y1="1952" y2="1952" x1="496" />
            <wire x2="560" y1="1456" y2="1456" x1="496" />
        </branch>
        <branch name="depassement_inf">
            <wire x2="2976" y1="1472" y2="1472" x1="2576" />
            <wire x2="2976" y1="1472" y2="1600" x1="2976" />
            <wire x2="4752" y1="1600" y2="1600" x1="2976" />
        </branch>
        <branch name="depassement_sup">
            <wire x2="4752" y1="1680" y2="1680" x1="2576" />
        </branch>
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
        <branch name="quatre_aff(3:0)">
            <wire x2="4752" y1="1088" y2="1088" x1="4720" />
        </branch>
        <instance x="4240" y="1568" name="affichage" orien="R0">
        </instance>
        <branch name="sept_seg(6:0)">
            <wire x2="4752" y1="1232" y2="1232" x1="4720" />
        </branch>
        <branch name="point">
            <wire x2="4752" y1="1520" y2="1520" x1="4720" />
        </branch>
        <branch name="leds_gamme(2:0)">
            <wire x2="4752" y1="1376" y2="1376" x1="4720" />
        </branch>
        <branch name="pos_point(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="4128" y="1536" type="branch" />
            <wire x2="4128" y1="1536" y2="1536" x1="4032" />
            <wire x2="4240" y1="1536" y2="1536" x1="4128" />
        </branch>
        <iomarker fontsize="28" x="4752" y="1088" name="quatre_aff(3:0)" orien="R0" />
        <iomarker fontsize="28" x="4752" y="1232" name="sept_seg(6:0)" orien="R0" />
        <iomarker fontsize="28" x="4752" y="1520" name="point" orien="R0" />
        <iomarker fontsize="28" x="4752" y="1376" name="leds_gamme(2:0)" orien="R0" />
        <iomarker fontsize="28" x="4752" y="1600" name="depassement_inf" orien="R0" />
        <branch name="rst">
            <wire x2="448" y1="1152" y2="1152" x1="368" />
            <wire x2="1936" y1="1152" y2="1152" x1="448" />
            <wire x2="1936" y1="1152" y2="1328" x1="1936" />
            <wire x2="2032" y1="1328" y2="1328" x1="1936" />
            <wire x2="2816" y1="1152" y2="1152" x1="1936" />
            <wire x2="4240" y1="1152" y2="1152" x1="2816" />
            <wire x2="2816" y1="1152" y2="1344" x1="2816" />
            <wire x2="2864" y1="1344" y2="1344" x1="2816" />
            <wire x2="448" y1="1152" y2="1520" x1="448" />
            <wire x2="448" y1="1520" y2="1776" x1="448" />
            <wire x2="560" y1="1776" y2="1776" x1="448" />
            <wire x2="448" y1="1776" y2="1984" x1="448" />
            <wire x2="1152" y1="1984" y2="1984" x1="448" />
            <wire x2="560" y1="1520" y2="1520" x1="448" />
        </branch>
        <branch name="nombre_out(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3488" y="1408" type="branch" />
            <wire x2="3488" y1="1408" y2="1408" x1="3392" />
            <wire x2="3584" y1="1408" y2="1408" x1="3488" />
        </branch>
        <instance x="3584" y="1440" name="conversion" orien="R0">
        </instance>
        <instance x="2032" y="1936" name="choix_du_mode" orien="R0">
        </instance>
        <branch name="nombre_in(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2784" y="1280" type="branch" />
            <wire x2="2784" y1="1280" y2="1280" x1="2576" />
            <wire x2="2784" y1="1280" y2="1408" x1="2784" />
            <wire x2="2864" y1="1408" y2="1408" x1="2784" />
        </branch>
        <branch name="nombre_echant(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1520" type="branch" />
            <wire x2="1776" y1="1520" y2="1520" x1="944" />
            <wire x2="2032" y1="1520" y2="1520" x1="1776" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1776" y="1712" type="branch" />
            <wire x2="1776" y1="1712" y2="1712" x1="944" />
            <wire x2="2032" y1="1712" y2="1712" x1="1776" />
        </branch>
        <branch name="XLXN_39">
            <wire x2="2032" y1="1776" y2="1776" x1="1696" />
        </branch>
        <instance x="560" y="1808" name="cmpt_etal" orien="R0">
        </instance>
        <instance x="560" y="1552" name="compt_echant" orien="R0">
        </instance>
        <iomarker fontsize="28" x="368" y="1392" name="entree" orien="R180" />
        <branch name="entree">
            <wire x2="400" y1="1392" y2="1392" x1="368" />
            <wire x2="400" y1="1392" y2="1584" x1="400" />
            <wire x2="560" y1="1584" y2="1584" x1="400" />
            <wire x2="560" y1="1392" y2="1392" x1="400" />
        </branch>
        <instance x="1152" y="2192" name="choix_auto" orien="R0">
        </instance>
        <branch name="dep_sup_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1744" y="1392" type="branch" />
            <wire x2="1104" y1="1392" y2="1392" x1="944" />
            <wire x2="1104" y1="1392" y2="1776" x1="1104" />
            <wire x2="1152" y1="1776" y2="1776" x1="1104" />
            <wire x2="1744" y1="1392" y2="1392" x1="1104" />
            <wire x2="2032" y1="1392" y2="1392" x1="1744" />
        </branch>
        <branch name="dep_inf_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1744" y="1456" type="branch" />
            <wire x2="1072" y1="1456" y2="1456" x1="944" />
            <wire x2="1072" y1="1456" y2="1808" x1="1072" />
            <wire x2="1152" y1="1808" y2="1808" x1="1072" />
            <wire x2="1744" y1="1456" y2="1456" x1="1072" />
            <wire x2="2032" y1="1456" y2="1456" x1="1744" />
        </branch>
        <branch name="dep_sup_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1728" y="1584" type="branch" />
            <wire x2="1040" y1="1584" y2="1584" x1="944" />
            <wire x2="1040" y1="1584" y2="1872" x1="1040" />
            <wire x2="1152" y1="1872" y2="1872" x1="1040" />
            <wire x2="1728" y1="1584" y2="1584" x1="1040" />
            <wire x2="2032" y1="1584" y2="1584" x1="1728" />
        </branch>
        <branch name="dep_inf_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1728" y="1648" type="branch" />
            <wire x2="1008" y1="1648" y2="1648" x1="944" />
            <wire x2="1008" y1="1648" y2="1904" x1="1008" />
            <wire x2="1152" y1="1904" y2="1904" x1="1008" />
            <wire x2="1728" y1="1648" y2="1648" x1="1008" />
            <wire x2="2032" y1="1648" y2="1648" x1="1728" />
        </branch>
        <branch name="etal_on">
            <wire x2="2592" y1="1904" y2="1904" x1="2576" />
            <wire x2="4752" y1="1904" y2="1904" x1="2592" />
        </branch>
        <branch name="manu_etal">
            <wire x2="1776" y1="2128" y2="2128" x1="368" />
            <wire x2="1776" y1="1904" y2="2128" x1="1776" />
            <wire x2="2032" y1="1904" y2="1904" x1="1776" />
        </branch>
        <branch name="mode_auto">
            <wire x2="1712" y1="2064" y2="2064" x1="368" />
            <wire x2="2176" y1="2064" y2="2064" x1="1712" />
            <wire x2="1712" y1="1840" y2="2064" x1="1712" />
            <wire x2="2032" y1="1840" y2="1840" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="368" y="2128" name="manu_etal" orien="R180" />
        <iomarker fontsize="28" x="368" y="2064" name="mode_auto" orien="R180" />
        <iomarker fontsize="28" x="4752" y="1904" name="etal_on" orien="R0" />
        <iomarker fontsize="28" x="4752" y="1680" name="depassement_sup" orien="R0" />
        <instance x="2176" y="2096" name="XLXI_13" orien="R0" />
        <branch name="auto_on">
            <wire x2="2416" y1="2064" y2="2064" x1="2400" />
            <wire x2="4752" y1="2064" y2="2064" x1="2416" />
        </branch>
        <iomarker fontsize="28" x="4752" y="2064" name="auto_on" orien="R0" />
        <instance x="2864" y="1440" name="basc_D" orien="R0">
        </instance>
    </sheet>
</drawing>