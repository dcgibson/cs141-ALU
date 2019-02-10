`timescale 1ns / 1ps

// CS 141
// Testbench for the XOR module

module test_xor;
    
    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Ouputs
    wire [31:0] Z;

    // Instantiate the module
    xor32 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 32'b0011;
        Y = 32'b0101;
        #10
        if (Z !== 32'b0110) begin
            $display("ERROR: X=%b, Y=%b, Z=%b", X, Y, Z);
        end
    end
endmodule
