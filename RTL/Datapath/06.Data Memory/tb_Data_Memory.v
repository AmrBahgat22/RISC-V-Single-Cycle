`timescale 1ns / 1ps

module tb_Data_Memory;

    // Inputs
    reg clk;
    reg rst_n;
    reg [31:0] A;
    reg [31:0] WD;
    reg WE;

    // Output
    wire [31:0] RD;

    // Instantiate the Data_Memory module
    Data_Memory uut (
        .clk	(clk	),
        .rst_n	(rst_n	),
        .A		(A		),
        .WD		(WD		),
        .WE		(WE		),
        .RD		(RD		)
    );
	
    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Time | WE | Address | Write Data | Read Data");

        // Initialize signals
        clk = 0;
        rst_n = 0;
        A = 0;
        WD = 0;
        WE = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Write 32'hDEADBEEF to address 5
        #10;
        A = 32'd20; // address 5 * 4 = 20
        WD = 32'hDEADBEEF;
        WE = 1;

        // Wait for write
        #10;
        WE = 0;

        // Read back from address 5
        #5;
        A = 32'd20;
        #5;
        $display("%4t | %b  | %d    | %h      | %h", $time, WE, A, WD, RD);

        // Write to address 8
        A = 32'd32; // address 8 * 4 = 32
        WD = 32'hCAFEBABE;
        WE = 1;
        #10;
        WE = 0;

        // Read back from address 8
        #5;
        A = 32'd32;
        #5;
        $display("%4t | %b  | %d    | %h      | %h", $time, WE, A, WD, RD);

        // Reset again to test memory clearing
        #10;
        rst_n = 0;
        #10;
        rst_n = 1;
        WE = 0;

        // Read from address 5 again (should be 0 after reset)
        A = 32'd20;
        #10;
        $display("%4t | %b  | %d    | %h      | %h", $time, WE, A, WD, RD);

        $finish;
    end

endmodule
