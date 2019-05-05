module multiplier
#(parameter SIZE = 4)
(
    input  logic [(SIZE - 1):0] x, y,
    output logic [((2 * SIZE) - 1):0] p
);

    logic [SIZE - 3:0] cell2_xiyi, cell2_sin, cell2_sout, cell2_cout, cell2_cj, cell2_cin;
    logic [SIZE - 2:0] cell2_sj, cla_c;
    logic [SIZE - 3:0] cla_b1;
    logic [SIZE - 2:0] cell1_c [SIZE - 3:0];
    logic [SIZE - 2:0] cell1_s [SIZE - 3:0];

    assign cla_c[0] = 1'b0;

    cell2 mult_cell2_first (
                            .xj     (x[0]),
                            .yj     (y[0]),
                            .cin    (1'b0),
                            .cj     (1'b0),
                            .sin    (1'b0),
                            .sj     (cell2_sj[0]),
                            .cjp1   (cell2_cj[0]),
                            .cout   (),
                            .sout   (),
                            .xiyi   (p[0])
                            );


    cell1 mult_cell1_first (
                            .xj     (x[1]),
                            .yj     (y[1]),
                            .sin    (1'b0),
                            .cin    (1'b0),
                            .xi     (x[0]),
                            .yi     (y[0]),
                            .si     (cell2_sj[0]),
                            .cout   (cell2_cin[0]),    //location of the destination
                            .sout   (p[1])
                            );

    genvar step, row;
    generate
        for (step = 0; step < SIZE - 2; step++)  begin
            assign cell1_s[step][0] = 1'b0;
            assign cell1_c[step][0] = 1'b0;
            for (row = 0; row < step; row++) begin
                cell1 mult_cell1 (
                                        .xj     (x[step + 2]),
                                        .yj     (y[step + 2]),
                                        .sin    ((step == SIZE - 3) ? 1'b0: cell1_s[step][row]),       //locaiton of this node
                                        .cin    (cell1_c[step][row]),       //locaiton of this node
                                        .xi     (x[row]),
                                        .yi     (y[row]),
                                        .si     (cell2_sj[row]),
                                        .cout   (cell1_c[step][row + 1]),       //location of the destination
                                        .sout   (cell1_s[step - 1][row + 1])    //location of the destination
                                        );
            end
            cell1 mult_cell1_last0 (
                                    .xj     (x[step + 2]),
                                    .yj     (y[step + 2]),
                                    .sin    ((step == SIZE - 3) ? 1'b0 : cell1_s[step][step]),              //locaiton of this node
                                    .cin    (cell1_c[step][step]),              //locaiton of this node
                                    .xi     (x[step]),
                                    .yi     (y[step]),
                                    .si     (cell2_sj[step]),
                                    .cout   (cell1_c[step][step + 1]),          //location of the destination
                                    .sout   (cell2_sin[step])           //location of the destination
                                    );

            cell2 mult_cell2 (
                                .xj     (x[step + 1]),
                                .yj     (y[step + 1]),
                                .cin    (cell2_cin[step]),
                                .cj     (cell2_cj[step]),
                                .sin    (cell2_sin[step]),
                                .sj     (cell2_sj[step + 1]),
                                .cjp1   (cell2_cj[step + 1]),
                                .cout   (cell2_cout[step]),
                                .sout   (cell2_sout[step]),
                                .xiyi   (cell2_xiyi[step])
                                );

            cell1 mult_cell1_last1 (
                                    .xj     (x[step + 2]),
                                    .yj     (y[step + 2]),
                                    .sin    ((step == SIZE - 3) ? 1'b0: cell1_s[step][step + 1]), //locaiton of this node
                                    .cin    (cell1_c[step][step + 1]), //location of this node
                                    .xi     (x[step + 1]),
                                    .yi     (y[step + 1]),
                                    .si     (cell2_sj[step + 1]),
                                    .cout   (cell2_cin[step + 1]),          //location of the destination
                                    .sout   (cla_b1[step])           //location of the destination
                                    );

            cla mult_cla (
                                .a0     (cell2_xiyi[step]),
                                .a1     (cell2_cout[step]),
                                .b0     (cell2_sout[step]),
                                .b1     (cla_b1[step]),
                                .cin    ((step == 0)? 1'b0: cla_c[step]),
                                .s0     (p[(2 * (step + 1))]),
                                .s1     (p[(2 * (step + 1)) + 1]),
                                .cout   (cla_c[step + 1])
                                );
        end
    endgenerate

    logic last_xiyi, last_sout;
    cell2 mult_cell2_last (
                            .xj     (x[SIZE - 1]),
                            .yj     (y[SIZE - 1]),
                            .cin    (cell2_cin[SIZE - 3]),
                            .cj     (cell2_cj[SIZE - 3]),
                            .sin    (1'b0),
                            .sj     (),
                            .cjp1   (),
                            .cout   (),
                            .sout   (last_sout),
                            .xiyi   (last_xiyi)
                           );

    full_adder mult_fa (
                            .in0    (last_sout),
                            .in1    (last_xiyi),
                            .cin    (cla_c[SIZE - 2]),
                            .sum    (p[(2 * SIZE) - 2]),
                            .cout   (p[(2 * SIZE) - 1])
                        );

endmodule

module multiplier_testbench #(parameter SIZE = 10) ();
    logic [(SIZE - 1):0] x, y;
    logic [((2 * SIZE) - 1):0] p;

    multiplier #(SIZE) dut(.x, .y, .p);

    integer i, j;
    initial begin
        j = 0;
        for (i = 0; i < (2 ** (2 * SIZE)); i++) begin
            {x, y} = i; #10;
            if (x * y == p) j++;
            assert ((x * y) == p) $display ("correct: %d * %d =  %0d", x, y, p);
                else $display("ERROR:   %d * %d != %0d", x, y, p);
        end
        $display("test complete");
        $display("%0d out of %0d calculations are correct", j, i);
    end
endmodule
