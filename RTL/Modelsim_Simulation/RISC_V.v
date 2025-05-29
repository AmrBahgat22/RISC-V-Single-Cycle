module RISC_V(
	input	wire	clk         	,
	input	wire	rst_n 
);

	wire			PcSrc			;
	wire			Zero			;
	wire			MemWrite		;
	wire	[1:0]	immsrc			;
	wire	[2:0]	ALUControl		;
	wire	[1:0]	ResultSrc		;
	
	wire	[31:0]	PCPlus4 		;
	wire	[31:0]	PCTarget 		;
	wire	[31:0]	in_pc 			;
	wire	[31:0]	out_pc 			;
	wire	[31:0]	instruction 	;
	wire	[31:0]	WD3				;
	wire	[31:0]	RD2				;
	wire	[31:0]	in_A			;
	wire	[31:0]	in_B			;
	wire	[31:0]	immext			;
	wire	[31:0]	alu_result		;
	wire	[31:0]	ReadData		;
	
// 1) first Multiplexer 
MUX MUX_U_1(
	.in_1			(PCPlus4			)	,
    .in_2			(PCTarget			)	,
    .sel 			(PcSrc				)	,
    .out       		(in_pc				)  
);

// 2) Program counter 
Program_Counter Program_Counter_U(
	
	.clk 			(clk				)	, 
	.rst_n 			(rst_n				)	,
	.in_pc 			(in_pc				)	,
	.out_pc 		(out_pc				)

);

// 3) Instruction Memory
Instruction_Memory Instruction_Memory_U (
	.instr_address	(out_pc				) 	,
	.instruction  	(instruction		)  
);

// 4) Program Counter Plus 4
PC_Plus_4 PC_Plus_4_U(
	.PC 			(out_pc				) 	,
	.PCPlus4 		(PCPlus4			)
	
);

// 5) Extend Unit
Extend_Unit Extend_Unit_U(
	.instr			(instruction[31:7]	) 	,        
	.immsrc			(immsrc				) 	,        	
	.immext     	(immext				)        	
);

// 6) Register File
Register_File Register_File_U(
	.clk 			(clk				)  	, 
	.A1  			(instruction[19:15]	)  	, 
	.A2  			(instruction[24:20]	) 	, 
	.A3	 			(instruction[11:7]	)	, 
	.WD3			(WD3				)	, 
	.WE  			(RegWrite			)  	, 
	.RD1 			(in_A				)  	, 
	.RD2 			(RD2				)    
	
);

// 7) Controller Unit
Controller_Unit Controller_Unit_U(
	.Zero			(Zero				)	,
    .Instr      	(instruction		)	,
    .MemWrite   	(MemWrite			)	,
    .RegWrite   	(RegWrite			)	,
    .ImmSrc     	(immsrc				)	,
    .ALUSrc     	(ALUSrc				)	,
    .ALUControl 	(ALUControl			)	,
    .ResultSrc  	(ResultSrc			)	,
    .PcSrc     		(PcSrc				)
);

// 8) second Multiplexer 
MUX MUX_U_2(
	.in_1			(RD2				)	,
    .in_2			(immext				)	,
    .sel 			(ALUSrc				)	,
    .out       		(in_B				)
);

// 9) program counter branch "target "
PC_Branch PC_Branch_U(
	.PC 			(out_pc				)	,
	.ImmExt 		(immext				)	,
	.PCTarget   	(PCTarget			)
);			

//10) ALU
ALU ALU_U(
    .in_A			(in_A				)	,    
    .in_B			(in_B				)	,    
    .alu_sel		(ALUControl			)	,    
	
    .zero			(Zero				)	,       
    .alu_result 	(alu_result			)	 
);

//11) Data Memory
Data_Memory Data_Memory_U (

    .clk			(clk				)	,
    .A				(alu_result			)	,     
    .WD				(RD2				)	,     
    .WE				(MemWrite			)	,     
		
    .RD 			(ReadData			) 		
);
// 12) Third Multiplexer
J_MUX J_MUX_U(

	.ALUResult		(alu_result			)	,	
    .ReadData		(ReadData			)	,	
    .PCPlus4		(PCTarget			)	,	
    .ResultSrc		(ResultSrc			)	,	
	
    .Result			(WD3				)		
);
endmodule 
