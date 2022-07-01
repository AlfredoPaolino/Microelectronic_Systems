analyze -library WORK -format vhdl {./mux21_generic.vhd ./mux51_generic.vhd ./fa.vhd ./rca_generic.vhd ./booth_encoder_3bit.vhd ./boothmul.vhd}

elaborate BOOTHMUL -architecture BOOTHMUL_STRUCT -library WORK -parameters "NBIT = 32"

compile -exact_map

write -hierarchy -format vhdl -output /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/boothmul32.vhdl

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_no_opt.txt

uplevel #0 { report_area -nosplit } >> /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_no_opt.txt

uplevel #0 { report_power -analysis_effort low } >> /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_no_opt.txt

#	-- add critical path max delay decremented by 20% --
set_max_delay 7.48 -from [all_inputs] -to [all_outputs]

compile -map_effort high

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group } > /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_opt.txt

uplevel #0 { report_area -nosplit } >> /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_opt.txt

uplevel #0 { report_power -analysis_effort low } >> /home/ms22.38/Desktop/booth_multiplier/syn/post_synthesis/report_boothmul_32bit_opt.txt
