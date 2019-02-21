`timescale 1ns / 1ps
`default_nettype none

// CS 141
// Module Name: logic_right32

module logic_right32(X, Shamt, Y);
    input wire [31:0] X;
    input wire [31:0] Shamt;

    wire [63:0] w;
    wire [31:0] shifted;    // temp variable to hold shifted value
    wire grt32;             // hold whether Shamt > 32

    output wire [31:0] Y;

    assign w[63:32] = 0;

    // Test whether Shamt > 32
    assign grt32 = | Shamt[31:6];

    generate
        genvar i;
        for (i = 0; i < 32; i = i + 1) begin
            assign w[i] = X[i];
            mux_32to1 mux_32_gen (
                .a1(w[i]), .b1(w[i+1]), .c1(w[i+2]), .d1(w[i+3]),
                .e1(w[i+4]), .f1(w[i+5]), .g1(w[i+6]), .h1(w[i+7]),
                .i1(w[i+8]), .j1(w[i+9]), .k1(w[i+10]), .l1(w[i+11]),
                .m1(w[i+12]), .n1(w[i+13]), .o1(w[i+13]), .p1(w[i+14]),
                .a2(w[i+15]), .b2(w[i+16]), .c2(w[i+17]), .d2(w[i+18]),
                .e2(w[i+19]), .f2(w[i+20]), .g2(w[i+21]), .h2(w[i+22]),
                .i2(w[i+23]), .j2(w[i+24]), .k2(w[i+25]), .l2(w[i+26]),
                .m2(w[i+27]), .n2(w[i+28]), .o2(w[i+29]), .p2(w[i+30]),
                .S(Shamt[4:0]),
                .Z(shifted[i])
            );
        end
    endgenerate

    mux_2to1 MUX_0 (
        .A(shifted),
        .B(32'b0),
        .S(grt32),
        .Z(Y)
    );

endmodule

