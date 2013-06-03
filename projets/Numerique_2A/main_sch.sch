<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="rst" />
        <signal name="entree" />
        <signal name="dep_sup_etal" />
        <signal name="dep_inf_etal" />
        <signal name="nombre_etal(13:0)" />
        <signal name="dep_sup_echant" />
        <signal name="dep_inf_echant" />
        <signal name="nombre_echant(13:0)" />
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
        <signal name="clk" />
        <signal name="nombre_in(13:0)" />
        <signal name="nombre_out(13:0)" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="entree" />
        <port polarity="Output" name="depassement_inf" />
        <port polarity="Output" name="depassement_sup" />
        <port polarity="Output" name="quatre_aff(3:0)" />
        <port polarity="Output" name="sept_seg(6:0)" />
        <port polarity="Output" name="point" />
        <port polarity="Output" name="leds_gamme(2:0)" />
        <port polarity="Input" name="clk" />
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
            <timestamp>2013-4-16T8:55:9</timestamp>
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
            <timestamp>2013-4-9T9:42:29</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="compteur_echantillonage">
            <timestamp>2013-4-9T9:59:58</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="choix_etal_echant">
            <timestamp>2013-4-16T6:27:34</timestamp>
            <rect width="416" x="64" y="-512" height="276" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <rect width="64" x="480" y="-492" height="24" />
            <line x2="544" y1="-480" y2="-480" x1="480" />
            <line x2="544" y1="-448" y2="-448" x1="480" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-268" height="24" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
        </blockdef>
        <blockdef name="bascule_D">
            <timestamp>2013-4-16T9:28:33</timestamp>
            <rect width="400" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <block symbolname="compteur_etalonnage" name="cmpt_etal">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_etal" name="depassement_sup" />
            <blockpin signalname="dep_inf_etal" name="depassement_inf" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="compteur_echantillonage" name="cmpt_ech">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_echant" name="depassement_sup" />
            <blockpin signalname="dep_inf_echant" name="depassement_inf" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="choix_etal_echant" name="choix">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="nombre_in(13:0)" name="nombre(13:0)" />
            <blockpin signalname="depassement_inf" name="depassement_inf" />
            <blockpin signalname="depassement_sup" name="depassement_sup" />
            <blockpin signalname="dep_inf_echant" name="dep_inf_echant" />
            <blockpin signalname="dep_sup_echant" name="dep_sup_echant" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre_echant(13:0)" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre_etal(13:0)" />
            <blockpin signalname="dep_sup_etal" name="dep_sup_etal" />
            <blockpin signalname="dep_inf_etal" name="dep_inf_etal" />
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
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <branch name="entree">
            <wire x2="544" y1="1280" y2="1280" x1="368" />
            <wire x2="560" y1="1280" y2="1280" x1="544" />
            <wire x2="544" y1="1280" y2="1664" x1="544" />
            <wire x2="560" y1="1664" y2="1664" x1="544" />
        </branch>
        <iomarker fontsize="28" x="368" y="1088" name="clk" orien="R180" />
        <iomarker fontsize="28" x="368" y="1152" name="rst" orien="R180" />
        <iomarker fontsize="28" x="368" y="1280" name="entree" orien="R180" />
        <instance x="560" y="1888" name="cmpt_etal" orien="R0">
        </instance>
        <instance x="560" y="1504" name="cmpt_ech" orien="R0">
        </instance>
        <instance x="1168" y="1888" name="choix" orien="R0">
        </instance>
        <branch name="dep_sup_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="976" y="1664" type="branch" />
            <wire x2="976" y1="1664" y2="1664" x1="944" />
            <wire x2="1024" y1="1664" y2="1664" x1="976" />
            <wire x2="1024" y1="1568" y2="1664" x1="1024" />
            <wire x2="1168" y1="1568" y2="1568" x1="1024" />
        </branch>
        <branch name="dep_inf_etal">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="976" y="1728" type="branch" />
            <wire x2="976" y1="1728" y2="1728" x1="944" />
            <wire x2="1056" y1="1728" y2="1728" x1="976" />
            <wire x2="1056" y1="1600" y2="1728" x1="1056" />
            <wire x2="1168" y1="1600" y2="1600" x1="1056" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="976" y="1792" type="branch" />
            <wire x2="976" y1="1792" y2="1792" x1="944" />
            <wire x2="1088" y1="1792" y2="1792" x1="976" />
            <wire x2="1088" y1="1632" y2="1792" x1="1088" />
            <wire x2="1168" y1="1632" y2="1632" x1="1088" />
        </branch>
        <branch name="dep_sup_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="1280" type="branch" />
            <wire x2="1008" y1="1280" y2="1280" x1="944" />
            <wire x2="1072" y1="1280" y2="1280" x1="1008" />
            <wire x2="1072" y1="1280" y2="1472" x1="1072" />
            <wire x2="1168" y1="1472" y2="1472" x1="1072" />
        </branch>
        <branch name="dep_inf_echant">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="992" y="1344" type="branch" />
            <wire x2="992" y1="1344" y2="1344" x1="944" />
            <wire x2="1040" y1="1344" y2="1344" x1="992" />
            <wire x2="1040" y1="1344" y2="1504" x1="1040" />
            <wire x2="1168" y1="1504" y2="1504" x1="1040" />
        </branch>
        <branch name="nombre_echant(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1008" y="1408" type="branch" />
            <wire x2="1008" y1="1408" y2="1408" x1="944" />
            <wire x2="1008" y1="1408" y2="1536" x1="1008" />
            <wire x2="1168" y1="1536" y2="1536" x1="1008" />
        </branch>
        <branch name="depassement_inf">
            <wire x2="1808" y1="1440" y2="1440" x1="1712" />
            <wire x2="1808" y1="1440" y2="1664" x1="1808" />
            <wire x2="3856" y1="1664" y2="1664" x1="1808" />
        </branch>
        <branch name="depassement_sup">
            <wire x2="1728" y1="1472" y2="1472" x1="1712" />
            <wire x2="1728" y1="1472" y2="1696" x1="1728" />
            <wire x2="3856" y1="1696" y2="1696" x1="1728" />
        </branch>
        <branch name="hex_un(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3248" y="1216" type="branch" />
            <wire x2="3248" y1="1216" y2="1216" x1="3152" />
            <wire x2="3360" y1="1216" y2="1216" x1="3248" />
        </branch>
        <branch name="hex_deux(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="1280" type="branch" />
            <wire x2="3264" y1="1280" y2="1280" x1="3152" />
            <wire x2="3360" y1="1280" y2="1280" x1="3264" />
        </branch>
        <branch name="hex_trois(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="1344" type="branch" />
            <wire x2="3264" y1="1344" y2="1344" x1="3152" />
            <wire x2="3360" y1="1344" y2="1344" x1="3264" />
        </branch>
        <branch name="hex_quatre(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3264" y="1408" type="branch" />
            <wire x2="3264" y1="1408" y2="1408" x1="3152" />
            <wire x2="3360" y1="1408" y2="1408" x1="3264" />
        </branch>
        <branch name="quatre_aff(3:0)">
            <wire x2="3872" y1="1088" y2="1088" x1="3840" />
        </branch>
        <instance x="2704" y="1440" name="conversion" orien="R0">
        </instance>
        <instance x="3360" y="1568" name="affichage" orien="R0">
        </instance>
        <branch name="sept_seg(6:0)">
            <wire x2="3872" y1="1232" y2="1232" x1="3840" />
        </branch>
        <branch name="point">
            <wire x2="3872" y1="1520" y2="1520" x1="3840" />
        </branch>
        <branch name="leds_gamme(2:0)">
            <wire x2="3872" y1="1376" y2="1376" x1="3840" />
        </branch>
        <branch name="pos_point(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3248" y="1536" type="branch" />
            <wire x2="3248" y1="1536" y2="1536" x1="3152" />
            <wire x2="3360" y1="1536" y2="1536" x1="3248" />
        </branch>
        <iomarker fontsize="28" x="3872" y="1088" name="quatre_aff(3:0)" orien="R0" />
        <iomarker fontsize="28" x="3872" y="1232" name="sept_seg(6:0)" orien="R0" />
        <iomarker fontsize="28" x="3872" y="1520" name="point" orien="R0" />
        <iomarker fontsize="28" x="3872" y="1376" name="leds_gamme(2:0)" orien="R0" />
        <branch name="nombre_in(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1840" y="1408" type="branch" />
            <wire x2="1840" y1="1408" y2="1408" x1="1712" />
            <wire x2="1952" y1="1408" y2="1408" x1="1840" />
        </branch>
        <iomarker fontsize="28" x="3856" y="1696" name="depassement_sup" orien="R0" />
        <iomarker fontsize="28" x="3856" y="1664" name="depassement_inf" orien="R0" />
        <branch name="rst">
            <wire x2="448" y1="1152" y2="1152" x1="368" />
            <wire x2="448" y1="1152" y2="1472" x1="448" />
            <wire x2="560" y1="1472" y2="1472" x1="448" />
            <wire x2="448" y1="1472" y2="1856" x1="448" />
            <wire x2="560" y1="1856" y2="1856" x1="448" />
            <wire x2="1104" y1="1152" y2="1152" x1="448" />
            <wire x2="1104" y1="1152" y2="1440" x1="1104" />
            <wire x2="1168" y1="1440" y2="1440" x1="1104" />
            <wire x2="1824" y1="1152" y2="1152" x1="1104" />
            <wire x2="3360" y1="1152" y2="1152" x1="1824" />
            <wire x2="1824" y1="1152" y2="1344" x1="1824" />
            <wire x2="1952" y1="1344" y2="1344" x1="1824" />
        </branch>
        <branch name="clk">
            <wire x2="496" y1="1088" y2="1088" x1="368" />
            <wire x2="496" y1="1088" y2="1376" x1="496" />
            <wire x2="560" y1="1376" y2="1376" x1="496" />
            <wire x2="496" y1="1376" y2="1760" x1="496" />
            <wire x2="560" y1="1760" y2="1760" x1="496" />
            <wire x2="1136" y1="1088" y2="1088" x1="496" />
            <wire x2="1136" y1="1088" y2="1216" x1="1136" />
            <wire x2="1136" y1="1216" y2="1408" x1="1136" />
            <wire x2="1168" y1="1408" y2="1408" x1="1136" />
            <wire x2="2704" y1="1216" y2="1216" x1="1136" />
            <wire x2="1872" y1="1088" y2="1088" x1="1136" />
            <wire x2="3360" y1="1088" y2="1088" x1="1872" />
            <wire x2="1872" y1="1088" y2="1280" x1="1872" />
            <wire x2="1952" y1="1280" y2="1280" x1="1872" />
        </branch>
        <instance x="1952" y="1440" name="basc_D" orien="R0">
        </instance>
        <branch name="nombre_out(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2592" y="1408" type="branch" />
            <wire x2="2592" y1="1408" y2="1408" x1="2480" />
            <wire x2="2704" y1="1408" y2="1408" x1="2592" />
        </branch>
    </sheet>
</drawing>