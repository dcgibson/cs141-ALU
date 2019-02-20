`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module name: ripple_add_sub32
// Description: Combination of 32-bit adder and subtractor.

module ripple_add_sub32(X, Y, Cin, Cout, S);
    input wire [31:0] X, Y;
    input wire Cin;

    output wire [31:0] S;
    output wire Cout;

    wire w [32:0];
    wire v [31:0];  // Wires carrying Y[i] or notY[i] to fulladder
    wire [31:0] notY;

    assign w[0] = Cin;
    assign notY = ~Y;
    
    // First, generates a 2:1 multiplexer, using the Cin bit as
    // the selector, that chooses between the ith bit of Y and the
    // ith bit of notY. Outputs go into the ith 'v' wire, that is
    // used as input to the full adder.
    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin
            mux_2to1 y_noty_mux (
                .A(Y[i]),
                .B(notY[i]),
                .S(Cin),
                .Z(v[i])
            );

            full_adder full_add_gen (
                .A(X[i]),
                .B(v[i]),
                .Cin(w[i]),
                .Cout(w[i+1]),
                .S(S[i])
            );
        end
    endgenerate

    // Overflow test
    assign Cout = w[32] ^ w[31];
endmodule
    
