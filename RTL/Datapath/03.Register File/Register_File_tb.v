`timescale 1ns / 1ps

module Register_File_tb;

    reg clk, rst_n;
    reg [4:0] A1, A2, A3;
    reg [31:0] WD3;
    reg WE;
    wire [31:0] RD1, RD2;

    Register_File DUT (
        .clk	(clk)	,
        .rst_n	(rst_n)	,
        .A1		(A1)	,
        .A2		(A2)	,
        .A3		(A3)	,
        .WD3	(WD3)	,
        .WE		(WE)	,
        .RD1	(RD1)	,
        .RD2	(RD2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $display("Starting Register File Testbench");
        $monitor("Time: %0d, A1=%0d, A2=%0d, A3=%0d, WD3=0x%h, WE=%b | RD1=0x%h, RD2=0x%h", 
                  $time, A1, A2, A3, WD3, WE, RD1, RD2);

        // Initial values
        clk = 1;
        rst_n = 0;
        WE = 0;
        A1 = 0; A2 = 0; A3 = 0; WD3 = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Write to register 5
        #10;
        A3 = 5;
        WD3 = 32'hABCD1234;
        WE = 1;

        #10; 
		
		WE = 0; // Disable write

        // Read from register 5
        A1 = 5;
        A2 = 0;

        #10;

        // Write to register 10
        A3 = 10;
        WD3 = 32'hDEADBEEF;
        WE = 1;

        #10; WE = 0;

        // Read from register 10
        A1 = 10;

        #10;

        // End simulation
        $stop;
    end

endmodule
