module full_adder(input  wire in0, in1, cin,
                  output wire sum, cout);

    wire temp0, temp1, temp2;
    xor fa_gate0 (temp0, in0, in1);
    xor fa_gate1 (sum, temp0, cin);
    and fa_gate2 (temp1, in0, in1);
    and fa_gate3 (temp2, temp0, cin);
    or  fa_gate4 (cout , temp1, temp2);

endmodule
