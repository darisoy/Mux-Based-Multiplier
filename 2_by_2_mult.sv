module 2_by_2_mult(input  logic x0, x1, y0, y1,
                   output logic p0, p1, p2, p3);
    logic temp0, temp1;
    cell2 mult_cell2_0 (.xj(x0), .yj(y0), .cin(1'b0), .cj(1'b0), .sin(1'b0), .sj(temp0), .cjp1(temp1), .cout(), .sout(), .xiyi(p0));

    logic temp2;
    cell1 mult_cell1_0 (.xj(x1), .yj(y1), .sin(1'b0), .cin(1'b0), .xi(x0), .yi(y0), .si(temp0), .cout(temp2), .sout(p1));

    logic temp3, temp4;
    cell2 mult_cell2_1 (.xj(x1), .yj(y1), .cin(temp2), .cj(temp1), .sin(1'b0), .sj(), .cjp1(), .cout(), .sout(temp3), .xiyi(temp4));

    full_adder mult_cell2_0 (.in0(temp3), .in1(temp4), .cin(1'b0), .sum(p2), .cout(p3));

endmodule

module 2_by_2_mult_testbench ();

endmodule
