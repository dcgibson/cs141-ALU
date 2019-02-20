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
        X = 32'b1; Y = 32'b0; Cin = 0; #10;
        X = 32'b1; Y = 32'b1; Cin = 0; #10;
        X = 32'b1; Y = 32'b0; Cin = 1; #10;

        X = 32'hFFFFFFFF; Y = 32'h0; Cin = 1; #10;
        X = 32'hFFFFFFFF; Y = 32'h1; Cin = 0; #10;

        X = 32'h0FFFFFFF; Y = 32'h0FFFFFFF; Cin = 0; #10
        
        X = 32'hFFFFFFFF; Y = 32'hFFFFFFFF; Cin = 0; #10;
        X = 32'hFFFFFFFF; Y = 32'hFFFFFFFF; Cin = 1; #10;

        X = 32'hFF00FF00; Y = 32'hFFF00000; Cin = 1; #10;
        X = 32'h9FFFFFFF; Y = 32'h9FFFFFFF; Cin = 1; #10;
    end

    always @(X, Y, Cin, S, Cout) begin
        #1;
        $display("X = %h, Y = %h, Cin = %b, S = %b %h, Cout = %b", X, Y, Cin, S[31:28], S[27:0], Cout);
        // The MSB of the inputs agree, but the MSB of the output doesn't
        if ((X[31] && Y[31] && ~S[31]) && Cout !== 1) begin
            $display("ERROR: NO OVERFLOW: X = %h, Y = %h, Cin = %b, S = %h, Cout = %b", X, Y, Cin, S, Cout);
        end
        else if ((~X[31] && ~Y[31] && S[31]) && Cout !== 1) begin
            $display("ERROR: NO OVERFLOW: X = %h, Y = %h, Cin = %b, S = %h, Cout = %b", X, Y, Cin, S, Cout);
        end
        else if (S !== X + Y + Cin) begin
            $display("ERROR: X = %h, Y= %h, Cin = %b, S = %h, Cout = %b", X, Y, Cin, S, Cout);
        end
    end
endmodule
