module datapath (product, clk, reset, write, shift_right, multiplicand, multiplier);

input clk, reset, write, shift_right;
input [31:0] multiplicand, multiplier;
output reg [63:0] product;

wire c_in, c_out;
wire [31:0] sum, w1, w2, w4, w5;
wire [63:0] w3, shifted;

	mux32_2_1 mux1(w1, multiplier, [63:32] product, reset);
	mux32_2_1 mux2(w2, sum, [63:32] product, write);
	shifter s(shifted, [63:0] product);	
	mux64_2_1 mux3(w3, shifted, [63:0] product, shift_right);
	mux32_2_1 mux2(w4, [63:32] w3, w2, write);
	mux32_2_1 mux2(w5, w4, w1, reset);
			  
adder32 add(sum, c_out, multiplicand, w5, c_in);

endmodule
