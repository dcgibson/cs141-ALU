`timescale 1ns / 1ps

// CS 141
// Testbench for the Ripple-Add-Sub4 module

module test_ripple_add_sub4;

    // Inputs
    reg [3:0] X, Y;
    reg Cin;

    // Outputs
    wire Cout;
    wire [3:0] S;

    // Instantiate the module
    ripple_add_sub4 uut (
        .X(X),
        .Y(Y),
        .Cin(Cin),
        .Cout(Cout),
        .S(S)
    );

    initial begin
        X = 4'b0000; Y = 4'b0001; Cin = 0; #10;
        X = 4'b1000; Y = 4'b0001; Cin = 0; #10;
        X = 4'b1000; Y = 4'b1100; Cin = 0; #10;

        X = 4'b0001; Y = 4'b0001; Cin = 1; #10;
        X = 4'b0000; Y = 4'b0100; Cin = 1; #10; 
        X = 4'b1001; Y = 4'b1000; Cin = 1; #10;
        X = 4'b1111; Y = 4'b0001; Cin = 1; #10;
        X = 4'b1000; Y = 4'b1000; Cin = 1; #10;


    end

    always @(X, Y, Cin) begin
        #1;

        $display("X=%b, Y=%b, Cin=%b, S=%b, Cout=%b", X, Y, Cin, S, Cout);
    end
endmodule
