`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: ripple_add_sub4
// Description: Takes the signed sum or difference of X and Y,
//      depending on Cin.
// FOR TESTING PURPOSES ONLY

module ripple_add_sub4(X, Y, Cin, Cout, S);
    input wire [3:0] X, Y;
    input wire Cin;

    output wire [3:0] S;
    output wire Cout;

    wire w [4:0];
    wire [3:0] v;   // Wires carrying Y or notY to fulladder
    wire [3:0] notY;

    assign w[0] = Cin;

    assign notY = ~Y;

    // The 2:1 multiplexer chooses between Y and notY, using
    // the Cin bit as the selector. Outputs into the 'v'
    // bus, which will be fed into the generated full-adder
    // gates.
    mux_2to1 b_notb_mux (
        .A(Y),
        .B(notY),
        .S(Cin),
        .Z(v)
    );

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin
            full_adder full_add_gen (
                .A(X[i]),
                .B(v[i]),
                .Cin(w[i]),
                .Cout(w[i+1]),
                .S(S[i])
            );
        end
    endgenerate

    // Overflow test
    assign Cout = w[4] ^ w[3];
endmodule


        
