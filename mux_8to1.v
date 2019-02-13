`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_8to1
// Description: A parameterized 8-to-1 multiplexer, built off of
// the 4-to-1 mux and 2-to-1 mux.

module mux_8to1(A, B, C, D, E, F, G, H, S, Z);
    parameter WIDTH = 32;

    input wire [(WIDTH-1):0] A, B, C, D, E, F, G, H;
    input wire [2:0] S;
    output wire [(WIDTH-1):0] Z;

    wire [(WIDTH)-1:0] mux_0_out, mux_1_out;

    // Use the two least-significant bits to select 2 outputs
    // to continue on to the 2-to-1 mux.
    mux_4to1 #(.WIDTH(WIDTH)) MUX_0 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S(S[1:0]),
        .Z(mux_0_out)
    );

    mux_4to1 #(.WIDTH(WIDTH)) MUX_1 (
        .A(E),
        .B(F),
        .C(G),
        .D(H),
        .S(S[1:0]),
        .Z(mux_1_out)
    );

    // Uses the most-significant bit to select final output.
    mux_2to1 #(.WIDTH(WIDTH)) MUX_2 (
        .A(mux_0_out),
        .B(mux_1_out),
        .S(S[2]),
        .Z(Z)
    );
endmodule
