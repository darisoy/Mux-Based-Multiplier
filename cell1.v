module cell1(input  wire xj, yj, sin, cin, xi, yi, si,
             output wire cout, sout);

    wire temp0;
    mux41      cell1_mux (.in0(1'b0), .in1(yi), .in2(xi), .in3(si), .sel0(xj), .sel1(yj), .out(temp0));
    full_adder cell1_fa  (.in0(temp0), .in1(sin), .cin(cin), .sum(sout), .cout(cout));

endmodule
