`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: Full-Adder
// Description: Extends the half-adder by accepting a carry-in bit

module full_adder(A, B, Cin, Cout, S);
    input wire A, B, Cin;
    output wire Cout, S;

    assign Cout = (A & B) | (A & Cin) | (B & Cin);
    assign S = A ^ B ^ Cin;

endmodule
