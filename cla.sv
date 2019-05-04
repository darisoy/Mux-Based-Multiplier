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

    and cla_gate8 (temp1, p1, cin);
    or  cla_gate9 (cout, temp1, g1);

endmodule
