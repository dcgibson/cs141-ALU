`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: ripple_adder32
// Description: Sums two 32-bit inputs and a carry in bit to
//  produce a 32-bit result and a carry out. Based on the
//  Ripple-Carry.

module ripple_adder32(X, Y, Cin, Cout, S);
    input wire [31:0] X, Y;
    input wire Cin;

    output wire [31:0] S;
    output wire Cout;

    // These wires will connect the carry out bit
    // from one Full-Adder to the carry in of the next.
    // We need 33 instead of 31 because one will bring in
    // the initial carry in bit, and one to bring the
    // last carry out bit to the test for overflow.
    wire w [32:0];

    assign w[0] = Cin;

    // Generates 32 Full-Adder gates, with the carry out
    // of each being connected to the carry in of the next.
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
    
    // Overflow test
    assign Cout = w[32] ^ w[31];
endmodule
