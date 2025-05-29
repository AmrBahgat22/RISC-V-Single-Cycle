module RISC_V_tb();
	reg		clk        ; 
	reg		rst_n      ;



RISC_V RISC_V_U(
	.clk	(clk	) ,
	.rst_n	(rst_n	)
);

always #10 clk = ~clk ;

initial begin 
	clk 	= 1 ;
	rst_n	= 1 ;
	#20
	rst_n	= 0 ;
	#20
	rst_n	= 1 ;
	#300
	$stop;
end 

endmodule