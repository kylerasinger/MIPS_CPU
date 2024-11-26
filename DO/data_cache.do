add wave data_in
add wave reset
add wave clk
add wave address
add wave data_write

add wave data_out

force clk 0 0 ns, 1 50 ns -repeat 100 ns

force reset 1

run 100 ns

force reset 0

force data_write 1
force address 00001
force data_in x"1234ABCD"

run 100 ns

force data_write 0
force address 00001

run 100 ns

force address 00001
force data_in x"8888BBBB"

run 100 ns

force reset 1

run 100 ns
