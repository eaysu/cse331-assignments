module shifter(out, a);

input [31:0] a;
output [31:0] out;

wire [2:0] w;

	assign out[63] = a[62];
	assign out[62] = a[61];
	assign out[61] = a[60];
	assign out[60] = a[59];
	assign out[59] = a[58];
	assign out[58] = a[57];
	assign out[57] = a[56];
	assign out[56] = a[55];
	assign out[55] = a[54];
	assign out[54] = a[53];
	assign out[53] = a[52];
	assign out[52] = a[51];
	assign out[51] = a[50];
	assign out[50] = a[49];
	assign out[49] = a[48];
	assign out[48] = a[47];
	assign out[47] = a[46];
	assign out[46] = a[45];
	assign out[45] = a[44];
	assign out[44] = a[43];
	assign out[43] = a[42];
	assign out[42] = a[41];
	assign out[41] = a[40];
	assign out[40] = a[39];
	assign out[39] = a[38];
	assign out[38] = a[37];
	assign out[37] = a[36];
	assign out[36] = a[35];
	assign out[35] = a[34];
	assign out[34] = a[33];
	assign out[33] = a[32];
	assign out[32] = a[31];
	assign out[31] = a[30];
	assign out[30] = a[29];
	assign out[29] = a[28];
	assign out[28] = a[27];
	assign out[27] = a[26];
	assign out[26] = a[25];
	assign out[25] = a[24];
	assign out[24] = a[23];
	assign out[23] = a[22];
	assign out[22] = a[21];
	assign out[21] = a[20];
	assign out[20] = a[19];
	assign out[19] = a[18];
	assign out[18] = a[17];
	assign out[17] = a[16];
	assign out[16] = a[15];
	assign out[15] = a[14];
	assign out[14] = a[13];
	assign out[13] = a[12];
	assign out[12] = a[11];
	assign out[11] = a[10];
	assign out[10] = a[9];
	assign out[9] = a[8];
	assign out[8] = a[7];
	assign out[7] = a[6];
	assign out[6] = a[5];
	assign out[5] = a[4];
	assign out[4] = a[3];
	assign out[3] = a[2];
	assign out[2] = a[1];
	assign out[1] = a[0];
	
	// if negative number
	not(w[0], a[0]);				
	and(w[1], w[0], 1'b0);
	and(w[2], a[0], 1'b1);
	or(out[0], w[1], w[2]);

endmodule	