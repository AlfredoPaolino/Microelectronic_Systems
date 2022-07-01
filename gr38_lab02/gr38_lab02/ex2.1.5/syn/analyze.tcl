analyze -library WORK -format vhdl {/home/ms22.38/Desktop/complete_adder/syn/constants.vhd /home/ms22.38/Desktop/complete_adder/syn/nd2.vhd /home/ms22.38/Desktop/complete_adder/syn/iv.vhd /home/ms22.38/Desktop/complete_adder/syn/fa.vhd /home/ms22.38/Desktop/complete_adder/syn/rca_generic.vhd /home/ms22.38/Desktop/complete_adder/syn/mux21_generic.vhd /home/ms22.38/Desktop/complete_adder/syn/pgb.vhd /home/ms22.38/Desktop/complete_adder/syn/PG.vhd /home/ms22.38/Desktop/complete_adder/syn/G.vhd /home/ms22.38/Desktop/complete_adder/syn/carry_select_block_generic.vhd /home/ms22.38/Desktop/complete_adder/syn/sum_generator.vhd /home/ms22.38/Desktop/complete_adder/syn/CLA.vhd /home/ms22.38/Desktop/complete_adder/syn/adder_generic.vhd}

elaborate ADDER_GENERIC -architecture ADD_STRUCT -library DEFAULT -parameters "NBIT = 32, NBIT_PER_BLOCK = 4"

compile -exact_map

write -hierarchy -format vhdl -output /home/ms22.38/Desktop/complete_adder/syn/post_synthesis/adder_generic.vhdl

uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }

uplevel #0 { report_area -nosplit }

uplevel #0 { report_power -analysis_effort low }
