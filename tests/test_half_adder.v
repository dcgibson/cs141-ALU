`timescale 1ns / 1ps

// CS 141
// Testbench for the Half-Adder module

module test_half_adder;
    
    // Inputs
    reg A;
    reg B;

    // Outputs
    wire C;
    wire S;

    // Instantiate the module
    half_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .S(S)
    );

    initial begin
        A = 0; B = 0;
        #10
        if (C !== 0 || S !== 0) begin
            $display("ERROR: A=%b, B=%b, C=%b, S=%b", A, B, C, S);
        end
        A = 0; B = 1;
        #10
        if (C !== 0 || S !== 1) begin
            $display("ERROR: A=%b, B=%b, C=%b, S=%b", A, B, C, S);
        end
        A = 1; B = 0;
        #10
        if (C !== 0 || S !== 1) begin
            $display("ERROR: A=%b, B=%b, C=%b, S=%b", A, B, C, S);
        end
        A = 1; B = 1;
        #10
        if (C !== 1 || S !== 0) begin
            $display("ERROR: A=%b, B=%b, C=%b, S=%b", A, B, C, S);
        end
    end
endmodule




