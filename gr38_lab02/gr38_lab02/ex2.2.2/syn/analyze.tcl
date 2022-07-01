analyze -library WORK -format vhdl {./mux21_generic.vhd ./mux51_generic.vhd ./fa.vhd ./rca_generic.vhd ./booth_encoder_3bit.vhd ./boothmul.vhd}

elaborate BOOTHMUL -architecture BOOTHMUL_STRUCT -library WORK -parameters "NBIT = 8"

compile -exact_map

write -hierarchy -format vhdl -output ./post_synthesis/boothmul8.vhdl

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > ./post_synthesis/report_boothmul_8bit_no_opt.txt

uplevel #0 { report_area -nosplit } >> ./post_synthesis/report_boothmul_8bit_no_opt.txt

uplevel #0 { report_power -analysis_effort low } >> ./post_synthesis/report_boothmul_8bit_no_opt.txt

report_timing -nworst 10 > post_synthesis/report_boothmul_8bit_no_opt_worst10.txt

