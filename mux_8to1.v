`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_8to1
// Description: built from mux_4to1 and mux_2to1 gates, parameterized.

module mux_8to1(A, B, C, D, E, F, G, H, S, Z);
    parameter WIDTH = 32;

    input wire [(WIDTH-1):0] A, B, C, D, E, F, G, H;
    input wire [2:0] S;
    output wire [(WIDTH-1):0] Z;

    wire [(WIDTH)-1:0] mux_0_out, mux_1_out;

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
    mux_2to1 #(.WIDTH(WIDTH)) MUX_2 (
        .A(mux_0_out),
        .B(mux_1_out),
        .S(S[2]),
        .Z(Z)
    );
endmodule
