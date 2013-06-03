<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="rst" />
        <signal name="clk" />
        <signal name="entree" />
        <signal name="dep_sup_echant" />
        <signal name="dep_inf_echant" />
        <signal name="nombre_echant(13:0)" />
        <signal name="dep_inf_etal" />
        <signal name="dep_sup_etal" />
        <signal name="nombre_etal_raw(13:0)" />
        <signal name="nombre_etal(13:0)" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="entree" />
        <port polarity="Output" name="dep_sup_echant" />
        <port polarity="Output" name="dep_inf_echant" />
        <port polarity="Output" name="nombre_echant(13:0)" />
        <port polarity="Output" name="dep_inf_etal" />
        <port polarity="Output" name="dep_sup_etal" />
        <port polarity="Output" name="nombre_etal(13:0)" />
        <blockdef name="detect_front_entree">
            <timestamp>2013-3-27T10:58:43</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="compteur_echantillonnage">
            <timestamp>2013-5-21T8:38:53</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="compteur_etalonnage">
            <timestamp>2013-5-21T8:44:5</timestamp>
            <rect width="256" x="64" y="-240" height="240" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="correction_etalonnage">
            <timestamp>2013-5-21T8:43:8</timestamp>
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="528" x="64" y="-192" height="192" />
            <rect width="64" x="592" y="-172" height="24" />
            <line x2="656" y1="-160" y2="-160" x1="592" />
        </blockdef>
        <block symbolname="detect_front_entree" name="detecteur_fron_entree">
            <blockpin signalname="entree" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_1" name="front" />
        </block>
        <block symbolname="compteur_echantillonnage" name="compteur_par_echantillonnage">
            <blockpin signalname="XLXN_1" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_echant" name="depassement_sup" />
            <blockpin signalname="dep_inf_echant" name="depassement_inf" />
            <blockpin signalname="nombre_echant(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="compteur_etalonnage" name="compteur_par_etalonnage">
            <blockpin signalname="XLXN_1" name="entree" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="dep_sup_etal" name="depassement_sup" />
            <blockpin signalname="dep_inf_etal" name="depassement_inf" />
            <blockpin signalname="nombre_etal_raw(13:0)" name="nombre(13:0)" />
        </block>
        <block symbolname="correction_etalonnage" name="correcteur_etalonnage">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="nombre_etal_raw(13:0)" name="nombre_etal_in(13:0)" />
            <blockpin signalname="nombre_etal(13:0)" name="nombre_etal_out(13:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="736" y="608" name="detecteur_fron_entree" orien="R0">
        </instance>
        <instance x="1344" y="1056" name="compteur_par_etalonnage" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1232" y1="512" y2="512" x1="1120" />
            <wire x2="1232" y1="512" y2="832" x1="1232" />
            <wire x2="1344" y1="832" y2="832" x1="1232" />
            <wire x2="1360" y1="512" y2="512" x1="1232" />
        </branch>
        <branch name="rst">
            <wire x2="1280" y1="400" y2="400" x1="640" />
            <wire x2="1280" y1="400" y2="640" x1="1280" />
            <wire x2="1280" y1="640" y2="1024" x1="1280" />
            <wire x2="1280" y1="1024" y2="1088" x1="1280" />
            <wire x2="2000" y1="1088" y2="1088" x1="1280" />
            <wire x2="1344" y1="1024" y2="1024" x1="1280" />
            <wire x2="1360" y1="640" y2="640" x1="1280" />
        </branch>
        <branch name="clk">
            <wire x2="672" y1="448" y2="448" x1="640" />
            <wire x2="672" y1="448" y2="576" x1="672" />
            <wire x2="736" y1="576" y2="576" x1="672" />
            <wire x2="1328" y1="448" y2="448" x1="672" />
            <wire x2="1328" y1="448" y2="576" x1="1328" />
            <wire x2="1328" y1="576" y2="928" x1="1328" />
            <wire x2="1344" y1="928" y2="928" x1="1328" />
            <wire x2="1328" y1="928" y2="1072" x1="1328" />
            <wire x2="1792" y1="1072" y2="1072" x1="1328" />
            <wire x2="1360" y1="576" y2="576" x1="1328" />
            <wire x2="2000" y1="1024" y2="1024" x1="1792" />
            <wire x2="1792" y1="1024" y2="1072" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="640" y="448" name="clk" orien="R180" />
        <branch name="entree">
            <wire x2="720" y1="512" y2="512" x1="640" />
            <wire x2="736" y1="512" y2="512" x1="720" />
        </branch>
        <branch name="dep_sup_echant">
            <wire x2="1760" y1="512" y2="512" x1="1744" />
            <wire x2="2672" y1="512" y2="512" x1="1760" />
        </branch>
        <branch name="dep_inf_echant">
            <wire x2="1760" y1="576" y2="576" x1="1744" />
            <wire x2="2672" y1="576" y2="576" x1="1760" />
        </branch>
        <branch name="nombre_echant(13:0)">
            <wire x2="1760" y1="640" y2="640" x1="1744" />
            <wire x2="2672" y1="640" y2="640" x1="1760" />
        </branch>
        <branch name="dep_inf_etal">
            <wire x2="1744" y1="896" y2="896" x1="1728" />
            <wire x2="2688" y1="896" y2="896" x1="1744" />
        </branch>
        <branch name="dep_sup_etal">
            <wire x2="1744" y1="832" y2="832" x1="1728" />
            <wire x2="2688" y1="832" y2="832" x1="1744" />
        </branch>
        <instance x="1360" y="672" name="compteur_par_echantillonnage" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2672" y="640" name="nombre_echant(13:0)" orien="R0" />
        <iomarker fontsize="28" x="2672" y="576" name="dep_inf_echant" orien="R0" />
        <instance x="2000" y="1120" name="correcteur_etalonnage" orien="R0">
        </instance>
        <branch name="nombre_etal_raw(13:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1792" y="960" type="branch" />
            <wire x2="1792" y1="960" y2="960" x1="1728" />
            <wire x2="1984" y1="960" y2="960" x1="1792" />
            <wire x2="2000" y1="960" y2="960" x1="1984" />
        </branch>
        <branch name="nombre_etal(13:0)">
            <wire x2="2688" y1="960" y2="960" x1="2656" />
        </branch>
        <iomarker fontsize="28" x="2688" y="960" name="nombre_etal(13:0)" orien="R0" />
        <iomarker fontsize="28" x="640" y="512" name="entree" orien="R180" />
        <iomarker fontsize="28" x="640" y="400" name="rst" orien="R180" />
        <iomarker fontsize="28" x="2688" y="832" name="dep_sup_etal" orien="R0" />
        <iomarker fontsize="28" x="2688" y="896" name="dep_inf_etal" orien="R0" />
        <iomarker fontsize="28" x="2672" y="512" name="dep_sup_echant" orien="R0" />
    </sheet>
</drawing>