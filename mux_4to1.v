`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: mux_4to1
// Taken from the section on parameters from Verilog Cheatsheet

module mux_4to1(A, B, C, D, S, Z);
    parameter WIDTH = 32;

    input wire [(WIDTH-1):0] A, B, C, D;
    input wire [1:0] S;
    output wire [(WIDTH-1):0] Z;

    wire [(WIDTH)-1:0] mux_0_out, mux_1_out;

    mux_2to1 #(.WIDTH(WIDTH)) MUX_0 (
        .X(A),
        .Y(B),
        .S(S[1]),
        .Z(mux_0_out)
    );
    mux_2to1 #(.WIDTH(WIDTH)) MUX_1 (
        .X(C),
        .Y(D),
        .S(S[1]),
        .Z(mux_1_out)
    );
    mux_2to1 #(.WIDTH(WIDTH)) MUX_2 (
        .X(mux_0_out),
        .Y(mux_1_out),
        .S(S[0]),
        .Z(Z)
    );
endmodule


