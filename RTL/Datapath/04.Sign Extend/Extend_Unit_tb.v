module Extend_Unit_tb();
	
	reg		[31:7]	instr	;          // instruction part
	reg		[1:0]	immsrc	;          // immediate source selector
	
	wire	[31:0]	immext  ;         // extended immediate output
	
Extend_Unit Extend_Unit(
	.instr	(instr	),
	.immsrc	(immsrc	),
	.immext	(immext	)
);

initial begin 
	// Stimulus : I-type instruction
    instr  = 25'b111111111111_1111111111111;   
	immsrc = 2'b00;  
	#10;
    instr  = 25'b111100001111_0000111000110;   
	immsrc = 2'b00;  
	#10; 
          
    // Stimulus 2: S-type instruction 
    instr = 25'b1010101_01010101010101_0101;   
	immsrc = 2'b01;  
	#10;   
    instr = 25'b1101110_10101010000101_0100;   
	immsrc = 2'b01; 
	#10;
    
    // Stimulus 3: B-type instruction 
    instr = 25'b0_101010_101010101010_1010_1_0;
	immsrc = 2'b10;
	#10;
	
    instr = 25'b1_100110_011001101010_0010_1_0;  
	immsrc = 2'b10;  
	#10;
    
    // Stimulus 4: J-type instruction 
    instr = 25'b1_1001100110_0_11001100_11001;   
	immsrc = 2'b11;  
	#10; 
    instr = 25'b0_1010101010_1_01010101_01010;   
	immsrc = 2'b11; 
	#50;
    
    $stop;
end 

endmodule