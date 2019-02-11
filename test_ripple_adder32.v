`timescale 1ns / 1ps

// CS 141
// Testbench for the Ripple-Adder32 module

module test_ripple_adder32;

    // Inputs
    reg [31:0] tX, tY;
    reg tCin;

    // Outputs
    wire tCout;
    wire [31:0] tS;

    // Instantiate the module
    ripple_adder32 uut (
        .X(tX[31:0]),
        .Y(tY),
        .Cin(tCin),
        .Cout(tCout),
        .S(tS)
    );

    initial begin
        tX = 32'b1; tY = 32'b0; tCin = 0; #10
        if (tS !== 32'b1 || tCout !== 0) begin
            $display("ERROR: X=%b, Y=%b, Cin=%b, S=%b, Cout=%b",
                tX, tY, tCin, tS, tCout);
        end
    end
endmodule
        

