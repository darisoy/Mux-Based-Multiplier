`timescale 1ns/1ns

module mult2by2 (input  logic x0, x1, y0, y1,
                 output logic p0, p1, p2, p3);

    parameter delay = 0.05;

    logic temp0, temp1;
    cell2 mult_cell2_0 (.xj(x0), .yj(y0), .cin(1'b0), .cj(1'b0), .sin(1'b0), .sj(temp0), .cjp1(temp1), .cout(), .sout(), .xiyi(p0));

    logic temp2;
    cell1 mult_cell1_0 (.xj(x1), .yj(y1), .sin(1'b0), .cin(1'b0), .xi(x0), .yi(y0), .si(temp0), .cout(temp2), .sout(p1));

    logic temp3, temp4;
    cell2 mult_cell2_1 (.xj(x1), .yj(y1), .cin(temp2), .cj(temp1), .sin(1'b0), .sj(), .cjp1(), .cout(), .sout(temp3), .xiyi(temp4));

    full_adder mult_fa_0 (.in0(temp3), .in1(temp4), .cin(1'b0), .sum(p2), .cout(p3));

endmodule

module mult2by2_testbench ();
    logic [1:0] x, y;
    logic [3:0] p;
    mult2by2 dut (.x0(x[0]), .x1(x[1]), .y0(y[0]), .y1(y[1]), .p0(p[0]), .p1(p[1]), .p2(p[2]), .p3(p[3]));

    integer i;
    initial begin
        for (i = 0; i < 16; i++) begin
            {x, y} = i; #10;
            assert ((x * y) == p) $display ("%d times %d equals %d (%b x %b = %b)", x, y, p, x, y, p);
                else $error("ERROR: %d times %d DOES NOT equals %d (%b x %b != %b)", x, y, p, x, y, p);
        end
    end

endmodule
