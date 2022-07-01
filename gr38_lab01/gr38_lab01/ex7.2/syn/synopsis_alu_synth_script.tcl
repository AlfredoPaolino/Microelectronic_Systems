analyze -library WORK -format vhdl {./constants.vhd ./alu_type.vhd ./alu.vhd}
elaborate ALU -architecture BEHAVIOR -library WORK -parameters "N = 4"
compile -exact_map
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } >> ./reports/report_alu_beh.txt
uplevel #0 { report_area -nosplit } >> ./reports/report_alu_beh.txt

