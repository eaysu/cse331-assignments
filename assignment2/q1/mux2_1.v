module mux2_1(out, a, b, s);

input a, b, s;
output out;

wire s_not;
wire [1:0] w;

	not(s_not, s);
	
	and(w[0], b, s);
	and(w[1], a, s_not);
	or(out, w[1], w[2]);
	
endmodule	
