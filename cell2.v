module cell2(input  wire xj, yj, cin, cj, sin,
             output wire sj, cjp1, cout, sout, xiyi);

    wire temp0, temp1;
    full_adder cell2_fa0 (.in0(xj), .in1(yj), .cin(cj), .sum(sj), .cout(cjp1));
    and cell2_and0 (temp1, xj, yj);
    and cell2_and1 (temp0, cj, temp1);
    full_adder cell2_fa1 (.in0(temp0), .in1(sin), .cin(cin), .sum(sout), .cout(cout));
    assign xiyi = temp1;

endmodule
