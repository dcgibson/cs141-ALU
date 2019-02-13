`timescale 1ns / 1ps
`default_nettype none

module test_mux_16to1;
    
    // Inputs
    reg [31:0] A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P;
    reg [3:0] S;
    
    // Outputs
    wire [31:0] Z;

    // Instantiate the module
    mux_16to1 uut (
        .A(A), .B(B), .C(C), .D(D),
        .E(E), .F(F), .G(G), .H(H),
        .I(I), .J(J), .K(K), .L(L),
        .M(M), .N(N), .O(O), .P(P),
        .S(S), 
        .Z(Z)
    );

    initial begin
        A = 16'h0; B = 16'h1; C = 16'h2; D = 16'h3; E = 16'h4; F = 16'h5;
        G = 16'h6; H = 16'h7; I = 16'h8; J = 16'h9; K = 16'hA; L = 16'hB;
        M = 16'hC; N = 16'hD; O = 16'hE; P = 16'hF;

        for (S = 0; S < 4'b1111; S = S + 1) begin
            
            #10

            $display("S = %b, Z = %h", S, Z);
        end
    end
endmodule
