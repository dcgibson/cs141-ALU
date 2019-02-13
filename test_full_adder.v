`timescale 1ns / 1ps

// CS 141
// Testbench for the Full-Adder module

module test_full_adder;

    // Inputs
    reg A;
    reg B;
    reg Cin;

    // Outputs
    wire Cout;
    wire S;

    // Instantiate the module
    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .S(S)
    );
    
    // checker
    always @(A or Y) begin
        #1
        if (Cout == (A && B)) begin
            $display("ERROR: A=%b, B=%b, Cout=%b", A, B, Cout);
            $stop;
        end
    end

    initial begin
        // GTKWave test
        $dumpfile("full_adder.vcd");
        $dumpvars(0, uut);
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;
        $finish;
    end
endmodule

