onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /multiplier_testbench/SIZE
add wave -noupdate -radix unsigned -childformat {{{/multiplier_testbench/p[5]} -radix unsigned} {{/multiplier_testbench/p[4]} -radix unsigned} {{/multiplier_testbench/p[3]} -radix unsigned} {{/multiplier_testbench/p[2]} -radix unsigned} {{/multiplier_testbench/p[1]} -radix unsigned} {{/multiplier_testbench/p[0]} -radix unsigned}} -subitemconfig {{/multiplier_testbench/p[5]} {-height 15 -radix unsigned} {/multiplier_testbench/p[4]} {-height 15 -radix unsigned} {/multiplier_testbench/p[3]} {-height 15 -radix unsigned} {/multiplier_testbench/p[2]} {-height 15 -radix unsigned} {/multiplier_testbench/p[1]} {-height 15 -radix unsigned} {/multiplier_testbench/p[0]} {-height 15 -radix unsigned}} /multiplier_testbench/p
add wave -noupdate -radix unsigned /multiplier_testbench/x
add wave -noupdate -radix unsigned /multiplier_testbench/y
add wave -noupdate /multiplier_testbench/dut/last_sout
add wave -noupdate /multiplier_testbench/dut/last_xiyi
add wave -noupdate -divider {cell2 last}
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cin
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cj
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cjp1
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cout
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/sin
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/sj
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/sout
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/temp0
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/temp1
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/xiyi
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/xj
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/yj
add wave -noupdate -divider {full adder}
add wave -noupdate /multiplier_testbench/dut/mult_fa/cin
add wave -noupdate /multiplier_testbench/dut/mult_fa/cout
add wave -noupdate /multiplier_testbench/dut/mult_fa/in0
add wave -noupdate /multiplier_testbench/dut/mult_fa/in1
add wave -noupdate /multiplier_testbench/dut/mult_fa/sum
add wave -noupdate -divider Cj-1
add wave -noupdate /multiplier_testbench/dut/mult_cell2_first/cj
add wave -noupdate /multiplier_testbench/dut/mult_cell2_first/cjp1
add wave -noupdate -divider Cj-2
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell2/cj}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell2/cjp1}
add wave -noupdate -divider Cj-3
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cj
add wave -noupdate /multiplier_testbench/dut/mult_cell2_last/cjp1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {546 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 91
configure wave -valuecolwidth 38
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {580 ps}
