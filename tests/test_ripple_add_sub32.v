`timescale 1ns / 1ps

// CS 141
// Testbench for the Ripple-Add-Sub32 module

module test_ripple_add_sub32;

    // Inputs
    reg [31:0] X, Y;
    reg Cin;

    // Outputs
    wire Cout;
    wire [31:0] S;

    // Instantiate the module
    ripple_add_sub32 uut (
        .X(X),
        .Y(Y),
        .Cin(Cin),
        .Cout(Cout),
        .S(S)
    );

    initial begin
        X = 32'h0000; Y = 32'h0001; Cin = 0; #10;
        X = 32'hF000; Y = 32'h000F; Cin = 0; #10;
        X = 32'hF0000000; Y = 32'h10000000; Cin = 0; #10;
        X = 32'h9FFFFFFF; Y = 32'h9FFFFFFF; Cin = 0; #10;

        X = 32'h0001; Y = 32'h0001; Cin = 1; #10;
        X = 32'h000F; Y = 32'h000E; Cin = 1; #10;
        X = 32'hFFFF; Y = 32'hFF88; Cin = 1; #10;

        X = 32'hF0000000; Y = 32'hF0000000; Cin = 1; #10;
        X = 32'h80000000; Y = 32'h7FFFFFFF; Cin = 1; #10;
    end

    always @(X, Y, Cin, S) begin
        #1;

        $display("X=%h, Y=%h, Cin=%b, S=%b %h, Cout=%b", X, Y, Cin, S[31:28], S[27:0], Cout);

        // Testing for overflow, needs to test whether X equals Y, otherwise
        // a result of 0 triggers overflow warning
        if ((X[31] && Y[31] && ~S[31]) && Cout !== 1 && X !== Y) begin
            $display("ERROR: NO OVERFLOW: X = %h, Y = %h, Cin = %b, S = %h, Cout = %b", X, Y, Cin, S, Cout);
        end
        else if ((~X[31] && ~Y[31] && S[31]) && Cout !== 1) begin
            $display("ERROR: NO OVERFLOW: X = %h, Y = %h, Cin = %b, S = %h, Cout = %b", X, Y, Cin, S, Cout);
        end
    end
endmodule
