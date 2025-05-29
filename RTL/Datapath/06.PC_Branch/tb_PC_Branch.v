`timescale 1ns / 1ps

module tb_PC_Branch;

    // Inputs
    reg [31:0] in_1_PC_Branch;
    reg [31:0] in_2_PC_Branch;

    // Output
    wire [31:0] out_PC_Branch;

    // Instantiate the Unit Under Test (UUT)
    PC_Branch DUT (
        .in_1_PC_Branch	(in_1_PC_Branch	),
        .in_2_PC_Branch	(in_2_PC_Branch	),
        .out_PC_Branch	(out_PC_Branch	)	
    );

    initial begin
        $display("Time | in_1           | in_2           | out (in_1 + in_2)");

        // Test 1
        in_1_PC_Branch = 32'd4;
        in_2_PC_Branch = 32'd8;
		
        #10
		$display("%4t | %d | %d | %d", $time, in_1_PC_Branch, in_2_PC_Branch, out_PC_Branch);

        // Test 2
        in_1_PC_Branch = 32'd100;
        in_2_PC_Branch = 32'd24;
		
        #10 
		$display("%4t | %d | %d | %d", $time, in_1_PC_Branch, in_2_PC_Branch, out_PC_Branch);

        // Test 3
        in_1_PC_Branch = 32'd0;
        in_2_PC_Branch = 32'd0;
		
        #10 
		$display("%4t | %d | %d | %d", $time, in_1_PC_Branch, in_2_PC_Branch, out_PC_Branch);

        // Test 4 (Negative offset test using 2's complement)
        in_1_PC_Branch = 32'd100;
        in_2_PC_Branch = -32'd4; // Equivalent to PC - 4
		
        #10 
		$display("%4t | %d | %d | %d", $time, in_1_PC_Branch, in_2_PC_Branch, out_PC_Branch);

        $finish;
    end

endmodule
