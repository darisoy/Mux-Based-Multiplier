module cell2(input  logic xj, yj, cin, cj, sin
             output logic sj, cjp1, cout, sout, xiyi);

    logic temp0;
    full_adder cell2_fa0 (.in0(xj), .in1(yj), .cin(cj), .sum(sj), .cout(cjp1));
    and cell2_and0 (xiyi, xj, yj);
    and cell2_and1 (temp0, cj, xiyi);
    full_adder cell2_fa1 (.in0(temp0), .in1(sin), .cin(cin), .sum(sout), .cout(cout));

endmodule
