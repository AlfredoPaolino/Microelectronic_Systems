proc retrieve_max_path {timing_report} {
	set report_fp [open $timing_report r]

	while {[gets $report_fp line] >= 0} {
		if {[regexp {data arrival time} $line]} {
			puts $line
			regexp {[0-9\.]+} $line max_path_string
			scan $max_path_string "%f" MAX_PATH
		}
	}


	close $report_fp

	return $MAX_PATH
}

# analyzes vhdl file(s)
analyze -library WORK -format vhdl {./sipisoAluControl.vhd ./sipisoalu.vhd}

# elaborates design
elaborate SIPISOALU -architecture A -library WORK

# synthesis with no constraints
compile -map_effort high 

# generates timing report
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/sipiso_timing.txt

set MAX_PATH [retrieve_max_path "./post_synthesis/sipiso_timing.txt"]
puts "MAX_PATH = $MAX_PATH"

# generates power reports
	# overall power dissipation
uplevel #0 { report_power } > ./post_synthesis/sipiso_power_no_opt.txt
	# cells only power dissipation
uplevel #0 { report_power -cell } > ./post_synthesis/sipiso_power_no_opt_cells_only.txt
	# nets only power dissipation
uplevel #0 { report_power -net } > ./post_synthesis/sipiso_power_no_opt_nets_only.txt

#set MAX_PATH [expr $MAX_PATH + 0.20]

# creates clock signal
create_clock -name "CLK" -period $MAX_PATH CLK


# generates power reports with clock
uplevel #0 { report_power } > ./post_synthesis/sipiso_power_no_opt_clock.txt
return
set_max_dynamic_power 500 uW
compile -map_effort high 
report_power > ./post_synthesis/sipiso_pwopt_2pw.rpt
report_timing > ./post_synthesis/sipiso_pwopt_2t.rpt
report_power -cell > ./post_synthesis/sipiso_constraint_power_cell.rpt
report_power -net > ./post_synthesis/sipiso_constraint_power_net.rpt

