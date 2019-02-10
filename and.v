`timescale 1ns / 1ps
`default_nettype none

//  CS 141
//  Module Name: AND
//  Description: computes the bitwise OR of two 32-bit inputs

module and32(X, Y, Z);
    input wire [31:0] X, Y;
    output wire [31:0] Z;

    assign Z = X & Y;
endmodule
