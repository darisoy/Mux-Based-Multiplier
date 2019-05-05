# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./multiplier.sv"
vlog "./mux21.sv"
vlog "./mux41.sv"
vlog "./cell1.sv"
vlog "./cell2.sv"
vlog "./cla.sv"
vlog "./full_adder.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work multiplier_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do multiplier_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
