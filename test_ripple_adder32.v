`timescale 1ns / 1ps

// CS 141
// Testbench for the Ripple-Adder32 module

module test_ripple_adder32;

    // Inputs
    reg [31:0] X, Y;
    reg Cin;

    // Outputs
    wire Cout;
    wire [31:0] S;

    // Instantiate the module
    ripple_adder32 uut (
        .X(X),
        .Y(Y),
        .Cin(Cin),
        .Cout(Cout),
        .S(S)
    );

    initial begin
        X = 32'b11; Y = 32'b00; Cin = 0; #10
        if (S !== 32'b11 || Cout !== 0) begin
            $display("ERROR: X=%b, Y=%b, Cin=%b, S=%b, Cout=%b",
                X, Y, Cin, S, Cout);
        end
    end
endmodule
        

