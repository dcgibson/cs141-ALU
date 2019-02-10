`timescale 1ns / 1ps

// CS 141
// Testbench for the AND module

module test_and;

    // Inputs
    reg [31:0] X;
    reg [31:0] Y;

    // Outputs
    wire [31:0] Z;

    // Instantiate the module
    and32 uut (
        .X(X),
        .Y(Y),
        .Z(Z)
    );

    initial begin
        // Initialize inputs
        X = 32'b1111;
        Y = 32'b1111;
        #10
        if (Z !== 32'b1111) begin
            $display("ERROR: X=%b, Y=%b, Z=%b", X, Y, Z);
        end

        X = 32'b11110000;
        Y = 32'b11001100;
        #10
        if (Z !== 32'b11000000) begin
            $display("ERROR: X=%b, Y=%b, Z=%b", X, Y, Z);
        end
    end
endmodule

