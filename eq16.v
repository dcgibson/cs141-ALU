`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: eq16
// Description: A 16-bit equality comparator.

module eq16(X, Y, Z);
    input wire [15:0] X, Y;
    output wire Z;

    wire eq_0, eq_1, eq_2, eq_3;

    eq4 EQ_0 (
        .X(X[15:12]),
        .Y(Y[15:12]),
        .Z(eq_0)
    );

    eq4 EQ_1 (
        .X(X[11:8]),
        .Y(Y[11:8]),
        .Z(eq_1)
    );

    eq4 EQ_2 (
        .X(X[7:4]),
        .Y(Y[7:4]),
        .Z(eq_2)
    );

    eq4 EQ_3 (
        .X(X[3:0]),
        .Y(Y[3:0]),
        .Z(eq_3)
    );

    assign Z = eq_0 & eq_1 & eq_2 & eq_3;
endmodule
