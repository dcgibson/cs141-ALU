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
        // GTKWave test
        $dumpfile("ripple_adder32.vcd");
        $dumpvars(0, uut);
        X = 32'b11; Y = 32'b00; Cin = 0; #10
        X = 32'b11; Y = 32'b01; Cin = 0; #10
        X = 32'b11; Y = 32'b00; Cin = 1; #10
        X = 32'b1011; Y = 32'b0111; Cin = 1; #10
        X = 32'hFFFFFFFF; Y = 32'b1; Cin = 1; #10
        X = 32'hFFFFFFFF; Y = 32'hFFFFFFFF; Cin = 1; #10
		  $finish;
    end
endmodule
        

