`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: nor32
// Description: computes the bitwise NOR of two 32-bit inputs

module nor32(X, Y, Z);
    input wire [31:0] X, Y;
    output wire [31:0] Z;

    assign Z = X ~| Y;
endmodule
