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
	
	wire [31:0] and_out, or_out, xor_out, nor_out, add_out, sub_out, slt_out, srl_out, sll_out, sra_out;
		//functional blocks
	
   //YOUR CODE HERE - remember to use a separate file for each module you create
   wire [31:0] and_0, or_0, xor_0, nor_0, add_0, sub_0, slt_0, srl_0, sll_0, sra_0;

   and32 AND_0 (
      .X(X),
      .Y(Y),
      .Z(and_0)
  );

  or32 OR_0 (
      .X(X),
      .Y(Y),
      .Z(or_0)
  );

  xor32 XOR_0 (
      .X(X),
      .Y(Y),
      .Z(xor_0)
  );

  nor32 NOR_0 (
      .X(X),
      .Y(Y),
      .Z(nor_0)
  );

  ripple_adder32 ADD_0 (
      .X(X),
      .Y(Y),
      .Cin(1'b0),
      .Cout(overflow),
      .S(add_0)
  );

  mux_16to1 MUX_0 (
      .A(and_0),    // op_code 0000
      .B(or_0),     // op_code 0001
      .C(xor_0),    // op_code 0010
      .D(nor_0),    // op_code 0011
      .E(0),        // op_code 0100
      .F(add_0),    // op_code 0101
      .G(sub_0),    // op_code 0110
      .H(slt_0),    // op_code 0111
      .I(srl_0),    // op_code 1000
      .J(sll_0),    // op_code 1001
      .K(sra_0),    // op_code 1010
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
