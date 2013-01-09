
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name TP_Num_2 -dir "D:/2EN/Nim/TP_Num_2/planAhead_run_1" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/2EN/Nim/TP_Num_2/compteur_decade.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/2EN/Nim/TP_Num_2} }
set_property target_constrs_file "compteur_decade.ucf" [current_fileset -constrset]
add_files [list {compteur_decade.ucf}] -fileset [get_property constrset [current_run]]
link_design
