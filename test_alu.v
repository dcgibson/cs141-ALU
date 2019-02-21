`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:   CS141
// Engineer:  Avinash Uttamchandani
//
////////////////////////////////////////////////////////////////////////////////

`include "alu_defines.v"

module test_alu;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [3:0] op_code;

	// Outputs
	wire [31:0] Z;
	wire equal;
	wire overflow;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.op_code(op_code),
		.equal(equal), 
		.overflow(overflow), 
		.zero(zero)
	);

	integer error = 0;
	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		op_code = 0;
		
		
		// YOUR CODE HERE
		// loop through all important test vectors
		// this triggers the always block
       
        for (op_code = 0; op_code <= 4'b0111; op_code = op_code + 4'b0001) begin
            X = 32'hFFFFFFFF; Y = 32'hFFFFFFFF; #10;
            X = 32'h00000000; Y = 32'hFFFFFFFF; #10;
            X = 32'hFFFFFFFF; Y = 32'h00000000; #10;
            X = 32'h00000000; Y = 32'h00000000; #10;
            X = 32'h0000000F; Y = 32'h000000FF; #10;
            X = 32'hFFFFFFFF; Y = 32'hFFFF0000; #10;
            X = 32'hF0000000; Y = 32'h10000000; #10;
            X = 32'h01111111; Y = 32'hFEEEEEEE; #10;

            X = 32'h9FFFFFFF; Y = 32'h9FFFFFFF; #10;
            X = 32'h80000000; Y = 32'h7FFFFFFF; #10;
        end
    end

	// an 'always' block is executed whenever any of the variables in the sensitivity
	// list are changed (X, Y, or op_code in this case)
	always @(X,Y,op_code) begin
		#1;
		case (op_code)

			`ALU_OP_AND: begin
				//only executes when the op code is 0000 (AND)
				if( Z !== (X & Y) ) begin
					$display("ERROR: AND: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
					error = error + 1;
				end
			end

			`ALU_OP_XOR: begin
                if (Z !== (X ^ Y)) begin
                    $display("ERROR: XOR: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
                    error = error + 1;
                end
			end

			`ALU_OP_OR: begin
                if (Z !== (X | Y)) begin
                    $display("ERROR: OR: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
                    error = error + 1;
                end
			end

			`ALU_OP_NOR: begin
                if (Z !== (~(X | Y))) begin
                    $display("ERROR: NOR: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
                    error = error + 1;
                end
			end

			`ALU_OP_ADD: begin
                // Test to see if there was overflow, by comparing
                // the most-significant bits of the two inputs. If 
                // they agree, but the most-significant bit of the output
                // is the opposite sign, overflow has occurred.
                // Also tests whether X equals Y. If they do, and both are
                // negative, then the test would wrongly think a result of
                // 0 indicated overflow. 
                if ((X[31] && Y[31] && ~Z[31]) && overflow !== 1 && !equal) begin
                    $display("ERROR: ADD: op_code = %b, X = %h, Y = %h, Z = %h, overflow = %b", op_code, X, Y, Z, overflow);
                    error = error + 1;
                end
                else if ((~X[31] && ~Y[31] && Z[31]) && overflow !== 1) begin
                    $display("ERROR: ADD: op_code = %b, X = %h, Y = %h, Z = %h, overflow = %b", op_code, X, Y, Z, overflow);
                    error = error + 1;
                end

                // If no overflow, make sure Z is the sum of X and Y
                else if (Z !== X + Y) begin
                    $display("ERROR: ADD: op_code = %b, X = %h, Y = %h, Z = %h, overflow = %b", op_code, X, Y, Z, overflow);
                    error = error + 1;
                end
			end

			`ALU_OP_SUB: begin
                if (X[31] !== Y[31] && Y[31] == Z[31] && overflow !== 1) begin
                    $display("ERROR: SUB: op_code = %b, X = %h, Y = %h, Z = %h, overflow = %b", op_code, X, Y, Z, overflow);
                end
                else if (Z !== X - Y) begin
                    $display("ERROR: SUB: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
                    error = error + 1;
                end
			end
			`ALU_OP_SLT: begin
               if (X[31] > Y[31] && Z !== 32'b1) begin
                   $display("ERROR: SLT: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
               end
               else if (X[31] == Y[31] && X[30:0] < Y[30:0] && Z !== 32'b1) begin

                   $display("ERROR: SLT: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
               end
			end
			`ALU_OP_SRL: begin
                if (X >> Y !== Z) begin
                    $display("ERROR: SRL: op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
                end
			end
			`ALU_OP_SLL: begin
			end
			`ALU_OP_SRA: begin
			end
			default : begin
				//executes at default
				if (Z !== 32'd0) begin
					$display("ERROR HAPPENED! invalid op code, Z was not zero, op_code = %b, X = %h, Y = %h, Z = %h", op_code, X, Y, Z);
				end
			end
		endcase
		
	end
	
endmodule

