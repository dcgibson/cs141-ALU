`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_32to1
// Description: Parameterized 32-to-1 mux, built off 8-to-1 mux
// and 2-to-1 mux.

module mux_32to1(a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, k1, l1, m1,
    n1, o1, p1, a2, b2, c2, d2, e2, f2, g2, h2, i2, j2, k2, l2, m2, 
    n2, o2, p2, S, Z);

    parameter WIDTH = 1;

    input wire [(WIDTH-1):0] a1, b1, c1, d1, e1, f1, g1, h1, i1,
        j1, k1, l1, m1, n1, o1, p1, a2, b2, c2, d2, e2, f2, g2, h2,
        i2, j2, k2, l2, m2, n2, o2, p2;
    input wire [4:0] S;
    output wire [(WIDTH-1):0] Z;

    wire [(WIDTH)-1:0] mux_0_out, mux_1_out;

    mux_16to1 #(.WIDTH(WIDTH)) MUX_0 (
        .A(a1), .B(b1), .C(c1), .D(d1),
        .E(e1), .F(f1), .G(g1), .H(h1),
        .I(i1), .J(j1), .K(k1), .L(l1),
        .M(m1), .N(n1), .O(o1), .P(p1),
        .S(S[3:0]),
        .Z(mux_0_out)
    );

    mux_16to1 #(.WIDTH(WIDTH)) MUX_1 (
        .A(a2), .B(b2), .C(c2), .D(d2),
        .E(e2), .F(f2), .G(g2), .H(h2),
        .I(i2), .J(j2), .K(k2), .L(l2),
        .M(m2), .N(n2), .O(o2), .P(p2),
        .S(S[3:0]),
        .Z(mux_1_out)
    );

    mux_2to1 #(.WIDTH(WIDTH)) MUX_2 (
        .A(mux_0_out),
        .B(mux_1_out),
        .S(S[4]),
        .Z(Z)
    );
endmodule
