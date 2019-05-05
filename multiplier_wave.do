onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /multiplier_testbench/SIZE
add wave -noupdate -radix unsigned -childformat {{{/multiplier_testbench/p[9]} -radix unsigned} {{/multiplier_testbench/p[8]} -radix unsigned} {{/multiplier_testbench/p[7]} -radix unsigned} {{/multiplier_testbench/p[6]} -radix unsigned} {{/multiplier_testbench/p[5]} -radix unsigned} {{/multiplier_testbench/p[4]} -radix unsigned} {{/multiplier_testbench/p[3]} -radix unsigned} {{/multiplier_testbench/p[2]} -radix unsigned} {{/multiplier_testbench/p[1]} -radix unsigned} {{/multiplier_testbench/p[0]} -radix unsigned}} -expand -subitemconfig {{/multiplier_testbench/p[9]} {-height 15 -radix unsigned} {/multiplier_testbench/p[8]} {-height 15 -radix unsigned} {/multiplier_testbench/p[7]} {-height 15 -radix unsigned} {/multiplier_testbench/p[6]} {-height 15 -radix unsigned} {/multiplier_testbench/p[5]} {-height 15 -radix unsigned} {/multiplier_testbench/p[4]} {-height 15 -radix unsigned} {/multiplier_testbench/p[3]} {-height 15 -radix unsigned} {/multiplier_testbench/p[2]} {-height 15 -radix unsigned} {/multiplier_testbench/p[1]} {-height 15 -radix unsigned} {/multiplier_testbench/p[0]} {-height 15 -radix unsigned}} /multiplier_testbench/p
add wave -noupdate -radix unsigned /multiplier_testbench/x
add wave -noupdate -radix unsigned /multiplier_testbench/y
add wave -noupdate /multiplier_testbench/dut/cell1_c
add wave -noupdate /multiplier_testbench/dut/cell1_s
add wave -noupdate -expand /multiplier_testbench/dut/cell2_cin
add wave -noupdate /multiplier_testbench/dut/cell2_cj
add wave -noupdate -expand /multiplier_testbench/dut/cell2_cout
add wave -noupdate -expand /multiplier_testbench/dut/cell2_sin
add wave -noupdate /multiplier_testbench/dut/cell2_sj
add wave -noupdate /multiplier_testbench/dut/cell2_sout
add wave -noupdate /multiplier_testbench/dut/cell2_xiyi
add wave -noupdate /multiplier_testbench/dut/cla_b1
add wave -noupdate /multiplier_testbench/dut/cla_c
add wave -noupdate /multiplier_testbench/dut/last_sout
add wave -noupdate /multiplier_testbench/dut/last_xiyi
add wave -noupdate -divider {cla step1}
add wave -noupdate {/multiplier_testbench/dut/genblk1[1]/mult_cla/b1}
add wave -noupdate -divider {cell1 12}
add wave -noupdate {/multiplier_testbench/dut/genblk1[1]/mult_cell1_last1/sin}
add wave -noupdate -divider {cell1 21}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/cin}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/cout}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/si}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/sin}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/sout}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/temp0}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/xi}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/xj}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/yi}
add wave -noupdate {/multiplier_testbench/dut/genblk1[2]/genblk1[1]/mult_cell1/yj}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {164 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {9611 ps} {10274 ps}
