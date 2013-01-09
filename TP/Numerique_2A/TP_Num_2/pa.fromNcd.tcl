
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name TP_Num_2 -dir "D:/2EN/Nim/TP_Num_2/planAhead_run_2" -part xc3s500efg320-5
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "D:/2EN/Nim/TP_Num_2/compteur_decade.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/2EN/Nim/TP_Num_2} }
set_property target_constrs_file "compteur_decade.ucf" [current_fileset -constrset]
add_files [list {compteur_decade.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "D:/2EN/Nim/TP_Num_2/compteur_decade.ncd"
if {[catch {read_twx -name results_1 -file "D:/2EN/Nim/TP_Num_2/compteur_decade.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"D:/2EN/Nim/TP_Num_2/compteur_decade.twx\": $eInfo"
}
