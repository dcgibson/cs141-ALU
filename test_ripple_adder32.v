`timescale 1ns / 1ps

// CS 141
// Testbench for the Ripple-Adder32 module

module test_ripple_adder32;

    // Inputs
    reg X[31:0];
    reg Y[31:0];
    reg Cin;

    // Outputs
    wire Cout;
    wire S[31:0];

    // Instantiate the module
    ripple_adder32 uut (
        .X(X[31:0]),
        .Y(Y[31:0]),
        .Cin(Cin),
        .Cout(Cout),
        .S(S[31:0])
    );

    initial begin
        X = 32'b1; Y = 32'b0; Cin = 0; #10
        if (S !== 32'b1 || Cout !== 0) begin
            $display("ERROR: X=%b, Y=%b, Cin=%b, S=%b, Cout=%b",
                X, Y, Cin, S, Cout);
        end
    end
endmodule
        

