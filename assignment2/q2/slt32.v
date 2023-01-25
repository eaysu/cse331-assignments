module slt32(out, a, b);

input [31:0] a, b; 
output [31:0] out;
 
wire [31:0] w;
	
   // substract second input from first input 	
	subs32 s(w, a, b);
	// returns most significant bit of result
	and(out, w[31], 1'b1);
	
endmodule
