module fullAdder(sum, c_out, a, b, c_in);

input a, b, c_in;
output sum, c_out;

wire [2:0] w;

	xor(w[0], a, b);
	xor(sum, w[0], c_in);
	and(w[1], w[0], c_in);
	and(w[2], a, b);
	or(c_out, w[1], w[2]);

endmodule