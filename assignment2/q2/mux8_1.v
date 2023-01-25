module mux8_1(out, a, b, c, d, e, f, g, h, s);

input a, b, c, d, e, f, g, h;
input [2:0] s;
output out;

wire w1, w2, w3, w4, w5, w6, w7, w8;
wire [2:0] s_not;

	// not version of ALUop selection bits
	not(s_not[0], s[0]);
	not(s_not[1], s[1]);
	not(s_not[2], s[2]);

	// select operation result according to ALUop selection bits
	and(w1, a, s_not[0], s_not[1], s_not[2]);
	and(w2, b, s[0], s_not[1], s_not[2]);
	and(w3, c, s_not[0], s[1], s_not[2]);
	and(w4, d, s[0], s[1], s_not[2]);
	and(w5, e, s_not[0], s_not[1], s[2]); 
	and(w6, f, s[0], s_not[1], s[2]);
	and(w7, g, s_not[0], s[1], s[2]);
	and(w8, h, s[0], s[1], s[2]);
	or(out, w1, w2, w3, w4, w5, w6, w7, w8);
	
endmodule