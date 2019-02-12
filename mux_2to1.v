`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_2to1
// Taken from the section on parameters from Verilog Cheatsheet

module mux_2to1(X, Y, S, Z);
    parameter N = 32;

    input wire [(N-1):0] X, Y;
    input wire S;
    output wire [(N-1):0] Z;

    assign Z = S ? Y : X;
endmodule
