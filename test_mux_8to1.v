`timescale 1ns / 1ps
`default_nettype none

module test_mux_8to1;

    // Inputs
    reg [31:0] A, B, C, D, E, F, G, H;
    reg [2:0] S;

    // Outputs
    wire [31:0] Z;

    // Instantiate
    mux_8to1 uut (
        .A(A), .B(B), .C(C), .D(D),
        .E(E), .F(F), .G(G), .H(H),
        .S(S), .Z(Z)
    );

    initial begin
        A = 16'h0; B = 16'h1; C = 16'h2; D = 16'h3;
        E = 16'h4; F = 16'h5; G = 16'h6; H = 16'h7;
        for (S = 0; S <= 3'b11; S = S + 3'b1) begin
            #10
            $display("A=%h, B=%h, C=%h, D=%h, E=%h, \nF=%h, G=%h, H=%h, S=%b, Z=%h",
                A, B, C, D, E, F, G, H, S, Z);
        end
    end
endmodule
