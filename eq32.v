`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: eq32
// Description: A 32-bit equality comparator

module eq32(X, Y, Z);
    input wire [31:0] X, Y;
    output wire Z;

    wire eq_0, eq_1;

    eq16 EQ_0 (
        .X(X[31:16]),
        .Y(Y[31:16]),
        .Z(eq_0)
    );

    eq16 EQ_1 (
        .X(X[15:0]),
        .Y(Y[15:0]),
        .Z(eq_1)
    );

    assign Z = eq_0 & eq_1;
endmodule
