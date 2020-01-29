`timescale 1ns/1ns

module mux41(input  wire in0, in1, in2, in3, sel0, sel1,
             output wire out);

    parameter delay = 0.05;

    wire out1, out2;
    mux21 m4_mux0 (.in0(in0), .in1(in1), .sel0(sel0), .out(out1));
    mux21 m4_mux1 (.in0(in2), .in1(in3), .sel0(sel0), .out(out2));
    mux21 m4_mux2 (.in0(out1), .in1(out2), .sel0(sel1), .out(out));

endmodule
