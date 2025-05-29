module Instruction_Memory_tb();

	reg		[31:0]	instr_address	;
	
	wire	[31:0]	instruction  	;
	
	Instruction_Memory DUT(
		.instr_address	(instr_address	)  ,
		.instruction	(instruction	) );


initial begin 
	$monitor("time = %t  |  address = %d   |  instruction = %h",$time, instr_address, instruction);

	instr_address = 0 ;
	#10
	instr_address = 4 ;
	#10 
	instr_address = 8 ;
	#10 
	instr_address = 12 ;
	#10 
	instr_address = 16 ;
	#10 
	instr_address = 20 ;
	#10 
	instr_address = 24 ;
	#10 
	instr_address = 28 ;
	#10 
	instr_address = 32 ;
	#50
	$stop;
end 
endmodule 