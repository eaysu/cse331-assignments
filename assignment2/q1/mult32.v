module mult32(out, a, b);

input [31:0] a, b;
output [31:0] out;
reg [31:0] multiplier, multiplicand;
reg clk;
reg reset = 1;
reg [63:0] product;

wire [2:0] w;
wire [63:0] w2;

always@(negedge clk)
	reset <= 0;

always@(posedge clk)
	product <= w2 >> 1;
	
control c(w[0], w[1], clock, w[2], reset);
datapath d(w2, w[2], clk, reset, w[0], w[1], multiplicand, multiplier);

endmodule