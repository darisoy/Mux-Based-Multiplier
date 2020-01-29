`timescale 1ns/1ns

module mux21 (input  wire in0, in1, sel0,
               output wire out);

    parameter delay = 0.05;

    wire temp0, temp1, temp2;
    not  #(delay) m2_gate0 (temp0, sel0);
    nand #(delay) m2_gate1 (temp1, in0, temp0);
    nand #(delay) m2_gate2 (temp2, in1, sel0);
    nand #(delay) m2_gate3 (out, temp1, temp2);

endmodule
