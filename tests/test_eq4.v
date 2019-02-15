`timescale 1ns / 1ps

// CS 141
// Testbench for the eq4 module

module test_eq4;
    
    // Inputs
    reg [3:0] X;
    reg [3:0] Y;

    // Ouputs
    wire Z;

    // Instantiate
    eq4 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        X = 4'b1111; Y = 4'b1111; #10;
        X = 4'b0000; Y = 4'b0000; #10;
        X = 4'b0010; Y = 4'b0010; #10;
        X = 4'b1000; Y = 4'b0001; #10;
    end

    always @(X, Y) begin
        #1
        if (X == Y && Z !== 1) begin
            $display("ERROR: X = %b, Y = %b, Z = %b", X, Y, Z);
        end
        else if (X !== Y && Z == 1) begin
            $display("ERROR: X = %b, Y = %b, Z = %b", X, Y, Z);
        end
    end
endmodule

