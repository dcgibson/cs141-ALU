`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: eq4
// Description: A 4-bit equality comparator.

module eq4(X, Y, Z);
    input wire [3:0] X, Y;
    output wire Z;
    
    wire xnor_0, xnor_1, xnor_2, xnor_3;

    assign xnor_0 = ~(X[0] ^ Y[0]);
    assign xnor_1 = ~(X[1] ^ Y[1]);
    assign xnor_2 = ~(X[2] ^ Y[2]);
    assign xnor_3 = ~(X[3] ^ Y[3]);

    assign Z = xnor_0 & xnor_1 & xnor_2 & xnor_3;
endmodule
