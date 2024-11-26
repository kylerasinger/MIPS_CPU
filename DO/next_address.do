add wave rt
add wave rs
add wave pc
add wave target_address
add wave branch_type
add wave pc_sel

add wave next_pc

force rt x"AAAA_AAAA"
force rs x"0BBB_BBBB"
force pc x"0000_0006"
force target_address x"00000AA"

run 10 ns

#no branch OK
force branch_type 00
force pc_sel 00

run 10 ns

#jump target instructions OK 
force branch_type 00
force pc_sel 01 
force target_address x"0000_00AA"

run 10 ns

#jump register OK
force pc_sel 10
force rs x"000C_CCCC"

run 10 ns

#beq true will branch
force branch_type 01
force pc_sel 00
force rs x"0AAA_AAAA"
force rt x"0AAA_AAAA"

run 5 ns
run 5 ns

#beq false wont brnach
force branch_type 01
force pc_sel 00
force rs x"0BBB_BBBB"
force rt x"0AAA_AAAA"

run 5 ns
run 5 ns

#bne true will branch
force branch_type 10
force pc_sel 00
force rs x"0BBB_BBBB"
force rt x"0AAA_AAAA"

run 5 ns
run 5 ns

#bne false wont branch
force branch_type 10
force pc_sel 00
force rs x"0AAA_AAAA"
force rt x"0AAA_AAAA"

run 5 ns
run 5 ns

#bltz true will branch
force branch_type 11
force pc_sel 00
force rs x"FF01_AAAA"

run 5 ns
run 5 ns

#bltz false wont branch
force branch_type 11
force pc_sel 00
force rs x"0000_5555"

run 5 ns
run 5 ns

