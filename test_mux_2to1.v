`timescale 1ns / 1ps
`default_nettype none

module test_mux_2to1;

    // Inputs
    reg [31:0] A, B;
    reg S;

    // Outputs
    wire [31:0] Z;

    // Instantiate
    mux_2to1 uut (
        .A(A),
        .B(B),
        .S(S),
        .Z(Z)
    );

    initial begin
        A = 16'h0; B = 16'h1; S = 0; #10
        $display("S = %b, Z = %h", S, Z);

        A = 16'h0; B = 16'h1; S = 1; #10
        $display("S = %b, Z = %h", S, Z);
    end
endmodule
