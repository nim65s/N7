
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name TP_VHDL -dir "D:/Saurel/TP_VHDL/planAhead_run_2" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "sept_seg.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {sept_seg.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top sept_seg $srcset
add_files [list {sept_seg.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
