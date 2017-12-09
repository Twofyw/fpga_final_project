# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param simulator.modelsimInstallPath C:/modeltech_pe_10.4c/win32pe
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir Z:/vivado/fpga_final_project/fpga_final_project.cache/wt [current_project]
set_property parent.project_path Z:/vivado/fpga_final_project/fpga_final_project.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo z:/vivado/fpga_final_project/fpga_final_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/new/blend.v
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/new/drawing.v
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/new/game.v
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/new/top.v
}
read_vhdl -library xil_defaultlib {
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/imports/vivado/ADXL362Ctrl.vhd
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/imports/vivado/AccelArithmetics.vhd
  Z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/imports/vivado/SPI_If.vhd
}
read_ip -quiet z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all z:/vivado/fpga_final_project/fpga_final_project.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc Z:/vivado/fpga_final_project/fpga_final_project.srcs/constrs_1/imports/vivado/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files Z:/vivado/fpga_final_project/fpga_final_project.srcs/constrs_1/imports/vivado/Nexys4DDR_Master.xdc]


synth_design -top top -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
