module Program_Counter_tb();

	reg			clk    ;
	reg			rst_n  ;
	reg	 [31:0]	in_pc  ;
	
	wire [31:0]	out_pc ;

	Program_Counter DUT(
		.clk	(clk	)   ,
		.rst_n	(rst_n	)   ,
		.in_pc	(in_pc	)   ,
		.out_pc (out_pc )  );
	
	always #5 clk = ~clk;

initial begin 
	clk   = 1 ;
	rst_n = 1 ;
	in_pc = 32'd0 ;
	#10
	rst_n = 0 ;
	#10
	in_pc = 32'd200 ;
	rst_n = 1 ;
	#10
	in_pc = 32'd50 ;
	#10
	in_pc = 32'd100 ;
	#10
	in_pc = 32'd200 ;
	#50
	$stop;
	
end
	
endmodule 