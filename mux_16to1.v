`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_16to1
// Description: parameterized

module mux_16to1(A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, S, Z);
    parameter WIDTH = 32;

    input wire [(WIDTH-1):0] A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;
    input wire [3:0] S;
    output wire [(WIDTH-1):0] Z

    wire mux_0_out, mux_1_out;

    mux_8to1 #(.WIDTH(WIDTH)) MUX_0 (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G),
        .H(H),
        .S(S[3:1]),
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
        .S(S[3:1]),
        .Z(mux_1_out)
    );
    mux_2to1 #(.N(WIDTH)) MUX_2 (
        .X(mux_0_out),
        .Y(mux_1_out),
        .S(S[0]),
        .Z(Z)
    );
endmodule

