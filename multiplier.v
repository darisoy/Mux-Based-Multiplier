//this module creates a SIZExSIZE multiplier circuit
module multiplier #(parameter SIZE = 4) (input  logic [(SIZE - 1):0] x, y,
                                         output logic [((2 * SIZE) - 1):0] p);

    //initalize variables
    logic [SIZE - 3:0] cell2_xiyi, cell2_sin, cell2_sout, cell2_cout;
    logic [SIZE - 2:0] cell2_sj, cla_c, cell2_cj, cell2_cin;
    logic [SIZE - 3:0] cla_b1;
    logic [SIZE - 2:0] cell1_c [SIZE - 3:0];
    logic [SIZE - 2:0] cell1_s [SIZE - 3:0];
    logic last_xiyi, last_sout;
    assign cla_c[0] = 1'b0;

    //creates the first two cells used in each multiplier
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
                            .cout   (cell2_cin[0]),
                            .sout   (p[1])
                            );

    genvar step, row;
    generate
        //generate the cells for each step
        for (step = 0; step < SIZE - 2; step++)  begin
            assign cell1_s[step][0] = 1'b0;
            assign cell1_c[step][0] = 1'b0;

            //generate cell1-s needed for each step
            for (row = 0; row < step; row++) begin
                cell1 mult_cell1 (
                                        .xj     (x[step + 2]),
                                        .yj     (y[step + 2]),
                                        .sin    ((step == SIZE - 3) ? 1'b0: cell1_s[step][row]),
                                        .cin    (cell1_c[step][row]),
                                        .xi     (x[row]),
                                        .yi     (y[row]),
                                        .si     (cell2_sj[row]),
                                        .cout   (cell1_c[step][row + 1]),
                                        .sout   (cell1_s[step - 1][row + 1])
                                        );
            end

            //create the cells that are the same in each step
            cell1 mult_cell1_last0 (
                                    .xj     (x[step + 2]),
                                    .yj     (y[step + 2]),
                                    .sin    ((step == SIZE - 3) ? 1'b0 : cell1_s[step][step]),
                                    .cin    (cell1_c[step][step]),
                                    .xi     (x[step]),
                                    .yi     (y[step]),
                                    .si     (cell2_sj[step]),
                                    .cout   (cell1_c[step][step + 1]),
                                    .sout   (cell2_sin[step])
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
                                    .sin    ((step == SIZE - 3) ? 1'b0: cell1_s[step][step + 1]),
                                    .cin    (cell1_c[step][step + 1]),
                                    .xi     (x[step + 1]),
                                    .yi     (y[step + 1]),
                                    .si     (cell2_sj[step + 1]),
                                    .cout   (cell2_cin[step + 1]),
                                    .sout   (cla_b1[step])
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

    //creates the last two cells used in each multiplier
    //attach it to the end of the last step
    cell2 mult_cell2_last (
                            .xj     (x[SIZE - 1]),
                            .yj     (y[SIZE - 1]),
                            .cin    (cell2_cin[SIZE - 2]),
                            .cj     (cell2_cj[SIZE - 2]),
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

module multiplier_testbench #(parameter SIZE = 6) ();
    logic [(SIZE - 1):0] x, y;
    logic [((2 * SIZE) - 1):0] p;
    logic [((2 * SIZE) - 1):0] expected;

    multiplier #(SIZE) dut(.x, .y, .p);

    integer i, j, k;
    initial begin
        j = 0;
        for (i = 0; i < (2 ** (2 * SIZE)); i++) begin
            {x, y} = i; #10;
            expected = x * y;
            assert (expected == p) begin
                j++;
                $display ("correct: %d * %d =  %0d", x, y, p);
            end
            else begin
                $display("ERROR:   %d * %d != %0d", x, y, p);
                $display("         at X = %b and Y = %b", x, y);
                for (k = 0; k < (2 * SIZE); k++) begin
                    if (p[k] != expected[k])
                        $display("         bit %0d is wrong, expected %b, returned %b", k, expected[k], p[k]);
                end
            end
        end
        $display("test complete");
        $display("%0d out of %0d calculations are correct", j, i);
    end
endmodule
