`timescale 1ns / 1ps
`default_nettype none

module test_mux_4to1;

    // Inputs
    reg [31:0] A, B, C, D;
    reg [1:0] S;

    // Outputs
    wire [31:0] Z;

    // Instantiate
    mux_4to1 uut (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .S(S),
        .Z(Z)
    );

    initial begin
        A = 16'h0; B = 16'h1; C = 16'h2; D = 16'h3;
        for (S = 0; S < 2'b11; S = S + 1) begin
            #10
            $display("A=%h, B=%h, C=%h, D=%h, S=%b, Z=%h",
                A, B, C, D, S, Z);
        end
    end
endmodule
