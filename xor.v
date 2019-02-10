`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: XOR
// Description: computes the bitwise XOR of two 32-bit inputs

module xor32(X, Y, Z);
    input wire [31:0] X, Y;
    output wire [31:0] Z;

    assign Z = X ^ Y;
endmodule
