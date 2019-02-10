`timescale 1ns / 1ps

// CS 141
// Testbench for the OR module

module test_or;
    
    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Outputs
    wire [31:0] Z;

    // Instantiate the module
    or32 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 32'b0011;
        Y = 32'b0101;
        #10
        if (Z !== 32'b0111) begin
            $display("ERROR: X=%b, Y=%b, Z=%b", X, Y, Z);
        end
    end
endmodule
