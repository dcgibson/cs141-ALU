`timescale 1ns / 1ps

// CS 141
// Testbench for the NOR module

module test_nor;
    
    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Ouputs
    wire [31:0] Z;

    // Instantiate the module
    nor32 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 32'b0011;
        Y = 32'b0101;
        #10
        if (Z[3:0] !== 4'b1000) begin
            $display("ERROR: X=%b, Y=%b, Z[3:0]=%b", X, Y, Z[3:0]);
        end
    end
endmodule
