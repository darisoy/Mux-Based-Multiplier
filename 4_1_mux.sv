module 4_1_mux(input  logic in0, in1, in2, in3, sel0, sel1,
               output logic out);

    logic out1, out2;
    2_1_mux 4mux0 (.in0(in0), .in1(in1), .sel0(sel0), .out(out1));
    2_1_mux 4mux1 (.in0(in2), .in1(in3), .sel0(sel0), .out(out2));
    2_1_mux 4mux2 (.in0(out1), .in1(out2), .sel0(sel1), .out(out));

endmodule
