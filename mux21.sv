module mux21 (input  logic in0, in1, sel0,
               output logic out);

    logic temp0, temp1, temp2;
    not m2_gate0 (temp0, sel0);
    and m2_gate1 (temp1, in0, temp0);
    and m2_gate2 (temp2, in1, sel0);
    or  m2_gate3 (out, temp1, temp2);

endmodule
