add wave din
add wave clk
add wave reg_reset
add wave write
add wave read_a
add wave read_b
add wave write_address

add wave out_a
add wave out_b


force reg_reset 1
force clk 0 0 ns, 1 50 ns -repeat 100 ns

run 100 ns

force reg_reset 0
force write 1
force write_address x"01"
force din x"AAAA_AAAA"

run 100 ns

force write_address x"02"
force din x"5555_5555"

run 100 ns

force write 0
force read_a x"01"
force read_b x"02"

run 100 ns

force read_a x"03"

run 100 ns

force write 1
force write_address x"04"
force din x"8765_4321"

run 100 ns

force write 0
force read_a x"04"

run 100 ns

force write 0
force read_a x"05"

run 60 ns

force read_a x"01"
force reg_reset 1

run 275 ns

force reg_reset 0 

run 100 ns



