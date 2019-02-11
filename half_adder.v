`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: Half-Adder
// Description: Computes the sum of two 1-bit inputs, assigning the
//              sum to S, and any carry bit to C

module half_adder(A, B, C, S);
    input wire A, B;
    output wire C, S;

    assign C = A & B;
    assign S = A ^ B;
endmodule
