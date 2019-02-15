`timescale 1ns / 1ps

// CS 141
// Testbench for the eq32 module.

module test_eq32;
    
    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Outputs
    wire Z;

    // Instantiate
    eq32 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 32'h0; Y = 32'h0; #10;
        X = 32'hF; Y = 32'hF; #10;
        X = 32'hFFFF0000; Y = 32'hFFFF0000; #10
        X = 32'hF0F0ABCD; Y = 32'hF0F0ABCD; #10

        X = 32'h0; Y = 32'h1; #10;
        X = 32'hF0000000; Y = 32'hE0000000; #10;
    end

    always @(X, Y) begin
        #1;
        if (X == Y && Z !== 1) begin
            $display("ERROR: X = %h, Y = %h, Z = %b", X, Y, Z);
        end
        else if (X !== Y && Z == 1) begin
            $display("ERROR: X = %h, Y = %h, Z = %b", X, Y, Z);
        end
    end
endmodule
