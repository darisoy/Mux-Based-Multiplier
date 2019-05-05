onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /multiplier_testbench/SIZE
add wave -noupdate -radix unsigned -childformat {{{/multiplier_testbench/p[5]} -radix unsigned} {{/multiplier_testbench/p[4]} -radix unsigned} {{/multiplier_testbench/p[3]} -radix unsigned} {{/multiplier_testbench/p[2]} -radix unsigned} {{/multiplier_testbench/p[1]} -radix unsigned} {{/multiplier_testbench/p[0]} -radix unsigned}} -expand -subitemconfig {{/multiplier_testbench/p[5]} {-height 15 -radix unsigned} {/multiplier_testbench/p[4]} {-height 15 -radix unsigned} {/multiplier_testbench/p[3]} {-height 15 -radix unsigned} {/multiplier_testbench/p[2]} {-height 15 -radix unsigned} {/multiplier_testbench/p[1]} {-height 15 -radix unsigned} {/multiplier_testbench/p[0]} {-height 15 -radix unsigned}} /multiplier_testbench/p
add wave -noupdate -radix unsigned /multiplier_testbench/x
add wave -noupdate -radix unsigned /multiplier_testbench/y
add wave -noupdate -divider cell1_last0
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/cin}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/cout}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/si}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/sin}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/sout}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/temp0}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/xi}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/xj}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/yi}
add wave -noupdate {/multiplier_testbench/dut/genblk1[0]/mult_cell1_last0/yj}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 149
configure wave -valuecolwidth 50
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
WaveRestoreZoom {0 ps} {700 ps}
