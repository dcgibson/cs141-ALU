`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: ripple_adder32
// Description: Sums two 32-bit inputs and a carry in bit to
//  produce a 32-bit result and a carry out. Based on the
//  Ripple-Carry Adder in the textbook.

module ripple_adder32(X, Y, Cin, Cout, S);
    input wire [31:0] X, Y;
    input wire Cin;

    output wire [31:0] S;
    output wire Cout;

    wire [32:0] w;

    assign w[0] = Cin;

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin
            full_adder full_add_gen (
                .A(X[i]),
                .B(Y[i]),
                .Cin(w[i]),
                .Cout(w[i+1]),
                .S(S[i])
            );
        end
    endgenerate

    assign Cout = w[32];
endmodule
