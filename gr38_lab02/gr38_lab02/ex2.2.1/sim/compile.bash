#!/bin/bash
rm -rf work
vlib work
vcom mux21_generic.vhd
vcom mux51_generic.vhd
vcom fa.vhd
vcom rca_generic.vhd
vcom booth_encoder_3bit.vhd
vcom boothmul.vhd
vcom tb_multiplier.vhd
