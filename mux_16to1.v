`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_16to1
// Description: A parameterized 16-to-1 multiplexer, built off
// the 8-to-1 mux and 2-to-1 mux.

module mux_16to1(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, S, Z);
    parameter WIDTH = 32;

    input wire [(WIDTH-1):0] A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;
    input wire [3:0] S;
    output wire [(WIDTH-1):0] Z;

    wire [(WIDTH)-1:0] mux_0_out, mux_1_out;

    // Use the three least-significant bits to select two outputs
    // to continue on to the 2-to-1 mux.
    mux_8to1 #(.WIDTH(WIDTH)) MUX_0 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G),
        .H(H),
        .S(S[2:0]),
        .Z(mux_0_out)
    );
    mux_8to1 #(.WIDTH(WIDTH)) MUX_1 (
        .A(I),
        .B(J),
        .C(K),
        .D(L),
        .E(M),
        .F(N),
        .G(O),
        .H(P),
        .S(S[2:0]),
        .Z(mux_1_out)
    );

    // Uses the most-significant bit to select final output.
    mux_2to1 #(.WIDTH(WIDTH)) MUX_2 (
        .A(mux_0_out),
        .B(mux_1_out),
        .S(S[3]),
        .Z(Z)
    );
endmodule

