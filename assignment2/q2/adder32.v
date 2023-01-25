module adder32(sum, c_out, a, b, c_in);

input [31:0] a, b;				
input c_in;
output c_out;
output [31:0] sum;

wire [30:0] w;

	// 32 bit full adder
	fullAdder fa0(sum[0], w[0], a[0], b[0], c_in);
	fullAdder fa1(sum[1], w[1], a[1], b[1], w[0]);
	fullAdder fa2(sum[2], w[2], a[2], b[2], w[1]);
	fullAdder fa3(sum[3], w[3], a[3], b[3], w[2]);
	fullAdder fa4(sum[4], w[4], a[4], b[4], w[3]);
	fullAdder fa5(sum[5], w[5], a[5], b[5], w[4]);
	fullAdder fa6(sum[6], w[6], a[6], b[6], w[5]);
	fullAdder fa7(sum[7], w[7], a[7], b[7], w[6]);
	fullAdder fa8(sum[8], w[8], a[8], b[8], w[7]);
	fullAdder fa9(sum[9], w[9], a[9], b[9], w[8]);
	fullAdder fa10(sum[10], w[10], a[10], b[10], w[9]);
	fullAdder fa11(sum[11], w[11], a[11], b[11], w[10]);
	fullAdder fa12(sum[12], w[12], a[12], b[12], w[11]);
	fullAdder fa13(sum[13], w[13], a[13], b[13], w[12]);
	fullAdder fa14(sum[14], w[14], a[14], b[14], w[13]);
	fullAdder fa15(sum[15], w[15], a[15], b[15], w[14]);
	fullAdder fa16(sum[16], w[16], a[16], b[16], w[15]);
	fullAdder fa17(sum[17], w[17], a[17], b[17], w[16]);
	fullAdder fa18(sum[18], w[18], a[18], b[18], w[17]);
	fullAdder fa19(sum[19], w[19], a[19], b[19], w[18]);
	fullAdder fa20(sum[20], w[20], a[20], b[20], w[19]);
	fullAdder fa21(sum[21], w[21], a[21], b[21], w[20]);
	fullAdder fa22(sum[22], w[22], a[22], b[22], w[21]);
	fullAdder fa23(sum[23], w[23], a[23], b[23], w[22]);
	fullAdder fa24(sum[24], w[24], a[24], b[24], w[23]);
	fullAdder fa25(sum[25], w[25], a[25], b[25], w[24]);
	fullAdder fa26(sum[26], w[26], a[26], b[26], w[25]);
	fullAdder fa27(sum[27], w[27], a[27], b[27], w[26]);
	fullAdder fa28(sum[28], w[28], a[28], b[28], w[27]);
	fullAdder fa29(sum[29], w[29], a[29], b[29], w[28]);
	fullAdder fa30(sum[30], w[30], a[30], b[30], w[29]);
	fullAdder fa31(sum[31], c_out, a[31], b[31], w[30]);
	
endmodule