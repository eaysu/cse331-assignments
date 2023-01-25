module ALUControl( ALU_Control, ALUOp, Function);  
	output reg[2:0] ALU_Control;  
	input [2:0]     ALUOp;  
	input [5:0]     Function;  
	wire [8:0]      ALUControlIn;  
	
assign ALUControlIn = {ALUOp,Function};  

always @(ALUControlIn)  
	casex (ALUControlIn)  
		9'b000xxxxxx: ALU_Control = 3'b000; // addi, lw, sw, li
		9'b001xxxxxx: ALU_Control = 3'b001; // beq, bne
		9'b101xxxxxx: ALU_Control = 3'b110; // slti
		9'b010xxxxxx: ALU_Control = 3'b100; // andi
		9'b011xxxxxx: ALU_Control = 3'b101; // ori
		9'b110100000: ALU_Control = 3'b000; // add  
		9'b110100010: ALU_Control = 3'b001; // sub 
		9'b110101010: ALU_Control = 3'b110; // slt 
		9'b110001000: ALU_Control = 3'bxxx; // jr
		9'b110100100: ALU_Control = 3'b100; // and 
		9'b110100101: ALU_Control = 3'b101; // or 
		9'b110000000: ALU_Control = 3'b011; // sll  
      9'b110000010: ALU_Control = 3'b111; // srl 
   // 9'bxxxxxxxxx: ALU_Control=3'b000; // j, jal
		default: ALU_Control = 3'b000;
	endcase
 endmodule  

 
// Verilog code for JR control unit
module jr_control
( 
	input[2:0] alu_op, 
	input [5:0] funct,
	output jrcontrol
);
	 
		assign jrcontrol = ({alu_op,funct}==9'b110001000) ? 1'b1 : 1'b0;

endmodule 