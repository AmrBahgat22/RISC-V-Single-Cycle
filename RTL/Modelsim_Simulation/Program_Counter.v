module Program_Counter(
	
	input	wire			clk , rst_n ,
	input	wire	[31:0]	in_pc ,
	
	output	reg		[31:0]	out_pc 

);

always@(posedge clk , negedge rst_n)
begin 
	if(!rst_n) begin
		out_pc <= 0 ;
	end else begin
		out_pc <= in_pc ;
	end
end

endmodule 