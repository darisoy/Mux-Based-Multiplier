`timescale 1ns/1ns

module full_adder(input  wire in0, in1, cin,
                  output wire sum, cout);

    parameter delay = 0.05;

    wire temp0, temp1, temp2;
    xor #(delay) fa_gate0 (temp0, in0, in1);
    xor #(delay) fa_gate1 (sum, temp0, cin);
    and #(delay) fa_gate2 (temp1, in0, in1);
    and #(delay) fa_gate3 (temp2, temp0, cin);
    or  #(delay) fa_gate4 (cout , temp1, temp2);

endmodule
