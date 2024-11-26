!# /encs/bin/bash

# Uses modelsim to simulate the CPU.
# Instructions are in the ic_cache.vhd file, 
# 	program loops incrementing to 15, and then stores to memory and loads from memory.

vcom ./src/alu.vhd
vcom ./src/next_address.vhd
vcom ./src/pc_register.vhd
vcom ./src/register.vhd
vcom ./src/sign_extender.vhd
vcom ./src/data_cache.vhd
vcom ./src/ic_cache.vhd

echo " "
echo "Compilation of components complete, see for errors."

echo " "
echo " "
echo " "

vcom ./src/cpu.vhd

echo " " 
echo "CPU compilation complete, see for errors."

vsim -do ./DO/cpu_1.do cpu &
