module 2_1_mux(input  logic in0, in1, sel0,
               output logic out);

    logic temp0, temp1, temp2;
    not 2gate0 (temp0, sel0);
    and 2gate1 (temp1, in0, temp0);
    and 2gate2 (temp2, in1, sel0);
    or  2gate3 (out, temp1, temp2);

endmodule
