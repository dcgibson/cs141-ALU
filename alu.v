`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// CS 141 - Spring 2019
// Module Name:    alu 
// Author(s): Bailee Sharpe, David Gibson
// Description: CS 141 programming assignment 2
//
//
//////////////////////////////////////////////////////////////////////////////////
`include "alu_defines.v"

module alu(X,Y,Z,op_code, equal, overflow, zero);

	//port definitions - customize for different bit widths
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire [31:0] Z;
	input  wire [3:0] op_code;
	
	output wire equal, overflow, zero;

	wire [31:0] and_out, or_out, xor_out, nor_out, add_sub_out, slt_out, srl_out, sll_out, sra_out;
	//functional blocks
	

    and32 AND_0 (
      .X(X),
      .Y(Y),
      .Z(and_out)
	);

	or32 OR_0 (
      .X(X),
      .Y(Y),
      .Z(or_out)
	);

	xor32 XOR_0 (
      .X(X),
      .Y(Y),
      .Z(xor_out)
	);

	nor32 NOR_0 (
      .X(X),
      .Y(Y),
      .Z(nor_out)
	);

    // Route op_code[1] into Cin, to determine whether
    // we are adding or subtracting
	ripple_add_sub32 ADD_SUB_0 (
      .X(X),
      .Y(Y),
      .Cin(op_code[1]),
      .Cout(overflow),
      .S(add_sub_out)
	);

	// Each output from the above gates is routed into the 16-to-1 mux.
	// Based on the op_code, the appropriate result is outputted as Z.

	mux_16to1 MUX_0 (
      .A(and_out),          // op_code 0000
      .B(or_out),           // op_code 0001
      .C(xor_out),          // op_code 0010
      .D(nor_out),          // op_code 0011
      .E(0),                // op_code 0100
      .F(add_sub_out),      // op_code 0101  Addition
      .G(add_sub_out),      // op_code 0110  Subtraction
      .H(slt_out),          // op_code 0111
      .I(srl_out),          // op_code 1000
      .J(sll_out),          // op_code 1001
      .K(sra_out),          // op_code 1010
      .L(0),
      .M(0),
	  .N(0),
      .O(0),
      .P(0),
      .S(op_code),
      .Z(Z)
	);

endmodule
`default_nettype wire //some Xilinx IP requires that the default_nettype be set to wire
