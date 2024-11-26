# MIPS_CPU
A CPU designed in VHDL with MIPS architecture, capable of running machine code on an FPGA board.

## Sources
The MIPS greensheet which describes all instructions can be found [here](https://courses.cs.washington.edu/courses/cse378/09au/MIPS_Green_Sheet.pdf).

## How to run
The CPU was simulated using Modelsim HDL simulator. If you'd like to simulate it on your own, you must:
1. Set your Modelsim source.
2. Run the runme.sh script.

If you'd like to change the machine code loaded into the CPU, it can be found in the ic_cache.vhd source file. 
