`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: Ripple-Adder32
// Description: Sums two 32-bit inputs and a carry in bit to
//  produce a 32-bit result and a carry out. Based on the
//  Ripple-Carry Adder in the textbook.

module ripple_adder32(X, Y, Cin, Cout, S);
    input wire [31:0] X, Y;
    input wire Cin;

    output wire [31:0] S;
    output wire Cout;

    wire [31:0] c;

    assign c[0] = Cin;

    generate
        genvar i;
        for (i = 1; i < 32; i = i + 1) begin
            full_adder full_add_gen (
                .A(X[i],
                .B(Y[i],
                .Cin(p[i-1]),
                .Cout(p[i]),
                .S(S[i])
            );
        end
    endgenerate

    assign Cout = p[31];
endmodule
