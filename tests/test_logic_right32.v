`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: test_logic_right32
// Description: Testbench for logic_right32 module

module test_logic_right32;

    // Inputs
    reg [31:0] X;
    reg [31:0] Shamt;

    // Outputs
    wire [31:0] Y;

    // Instantiate
    logic_right32 uut (
        .X(X),
        .Shamt(Shamt),
        .Y(Y)
    );

    initial begin
        X = 32'h1; Shamt = 32'h0; #10;
        X = 32'h1; Shamt = 32'h1; #10;
        X = 32'hF; Shamt = 32'h2; #10;

        X = 32'hFF; Shamt = 32'h3; #10;
    end

    always @(X, Y, Shamt) begin
        #1;
        $display("X = %h, Y = %h, Shamt = %b", X, Y, Shamt[5:0]);
    end
endmodule
