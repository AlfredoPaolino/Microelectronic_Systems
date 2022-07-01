# analyzes vhdl file(s)
analyze -library WORK -format vhdl {./RF_generic.vhd}

# elaborates design
elaborate RF_GENERIC -architecture BEH -library WORK -parameters "ADDR_BIT = 5, DATA_BIT = 32"

# compiles design
compile

# generates timing and area reports
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/RF_generic_timing_no_clock.txt
uplevel #0 { report_area -nosplit } > ./post_synthesis/RF_generic_area_no_clock.txt

# clock signal definition and report
create_clock -name "CLK" -period 2 CLK
report_clock > ./post_synthesis/RF_generic_clock_report.txt

# re-compiles design
compile

# generates timing and area reports with clock constraint
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/RF_generic_timing_clock.txt
uplevel #0 { report_area -nosplit } > ./post_synthesis/RF_generic_area_clock.txt

# combinational circuits constraint
set_max_delay 2 -from [all_inputs] -to [all_outputs]

# re-compiles design
compile

# generates timing and area reports with clock and combinational circuits constraints
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/RF_generic_timing_clock_comb_constr.txt
uplevel #0 { report_area -nosplit } > ./post_synthesis/RF_generic_area_clock_comb_constr.txt

# optimized compilation
compile -map_effort high -area_effort high

# generates optimized timing and area reports with clock and combinational circuits constraints
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/RF_generic_timing_clock_comb_constr_opt.txt
uplevel #0 { report_area -nosplit } > ./post_synthesis/RF_generic_area_clock_comb_constr_opt.txt

# saves VHDL optimized netlist
write -hierarchy -format vhdl -output ./post_synthesis/RF_generic_opt.vhdl

# saves ddc configuration file
write -hierarchy -format ddc -output /home/ms22.38/Desktop/lab03/basic_RF/syn/post_synthesis/RF_generic_opt.ddc
