module cla(input  logic a0, a1, b0, b1, cin,
           output logic s0, s1, cout);

    logic p1, g1, p0, g0, c1, temp0, temp1;
    xor cla_gate0 (p1, a1, b1);
    and cla_gate1 (g1, a1, b1);

    xor cla_gate2 (p0, a0, b0);
    and cla_gate3 (g0, a0, b0);

    xor cla_gate4 (s0, p0, cin);

    and cla_gate5 (temp0, p0, cin);
    or  cla_gate6 (c1, temp0, g0);
    xor cla_gate7 (s1, c1, p1);

    and cla_gate8 (temp1, p1, c1);
    or  cla_gate9 (cout, temp1, g1);

endmodule

module cla_testbench();
    logic a0, a1, b0, b1, cin, s0, s1, cout;

    cla dut (.*);

    integer i, j;
    initial begin
        j = 0;
        for (i = 0; i < 32; i++) begin
            {a0, a1, b0, b1, cin} = i; #10;
            if (({a1, a0} + {b1, b0} + {1'b0, cin}) == {cout, s1, s0}) j++;
            assert (({a1, a0} + {b1, b0} + {1'b0, cin}) == {cout, s1, s0} ) $display ("Correct: %b%b + %b%b + %b =  %b%b%b", a1, a0, b1, b0, cin, cout, s1, s0);
                else $display("WRONG:   %b%b + %b%b + %b != %b%b%b", a1, a0, b1, b0, cin, cout, s1, s0);
        end
        $display("test complete");
        $display("%0d out of %0d calculations are correct", j, i);
    end


endmodule
