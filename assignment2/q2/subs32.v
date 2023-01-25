module subs32(out, a, b);				
					
input [31:0] a, b;
output [31:0] out;

wire [31:0] w1, w2;
wire c_out1, c_out2;

	// taking 2's complement of second input
	not32 n(w1, b);
	adder32 a1(w2, c_out1, w1, 32'b1, 1'b0);
	// adds first input and 2's complement of second input
	adder32 a2(out, c_out2, w2, a, 1'b0);

endmodule