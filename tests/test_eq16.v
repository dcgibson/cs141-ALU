`timescale 1ns / 1ps

// CS 141
// Testbench for the eq16 module

module test_eq16;
    
    // Inputs
    reg [15:0] X;
    reg [15:0] Y;

    // Outputs
    wire Z;

    // Instantiate
    eq16 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 16'hFFFF; Y = 16'hFFFF; #10;
        X = 16'h0000; Y = 16'h0000; #10;
        X = 16'h000F; Y = 16'h000F; #10;

        X = 16'h0001; Y = 16'h1000; #10;
        X = 16'h00F0; Y = 16'h00FF; #10;
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
