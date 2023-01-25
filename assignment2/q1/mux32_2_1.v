module mux32_2_1(out, a, b, s);

input [31:0] a, b,
input s;
output [31:0] out;

	mux2_1 mux1(out[0], a[0], b[0], s);
	mux2_1 mux1(out[1], a[1], b[1], s);
	mux2_1 mux2(out[2], a[2], b[2], s);
	mux2_1 mux3(out[3], a[3], b[3], s);
	mux2_1 mux4(out[4], a[4], b[4], s);
	mux2_1 mux5(out[5], a[5], b[5], s);
	mux2_1 mux6(out[6], a[6], b[6], s);
	mux2_1 mux7(out[7], a[7], b[7], s);
	mux2_1 mux8(out[8], a[8], b[8], s);
	mux2_1 mux9(out[9], a[9], b[9], s);
	mux2_1 mux10(out[10], a[10], b[10], s);
	mux2_1 mux11(out[11], a[11], b[11], s);
	mux2_1 mux12(out[12], a[12], b[12], s);
	mux2_1 mux13(out[13], a[13], b[13], s);
	mux2_1 mux14(out[14], a[14], b[14], s);
	mux2_1 mux15(out[15], a[15], b[15], s);
	mux2_1 mux16(out[16], a[16], b[16], s);
	mux2_1 mux17(out[17], a[17], b[17], s);
	mux2_1 mux18(out[18], a[18], b[18], s);
	mux2_1 mux19(out[19], a[19], b[19], s);
	mux2_1 mux20(out[20], a[20], b[20], s);
	mux2_1 mux21(out[21], a[21], b[21], s);
	mux2_1 mux22(out[22], a[22], b[22], s);
	mux2_1 mux23(out[23], a[23], b[23], s);
	mux2_1 mux24(out[24], a[24], b[24], s);
	mux2_1 mux25(out[25], a[25], b[25], s);
	mux2_1 mux26(out[26], a[26], b[26], s);
	mux2_1 mux27(out[27], a[27], b[27], s);
	mux2_1 mux28(out[28], a[28], b[28], s);
	mux2_1 mux29(out[29], a[29], b[29], s);
	mux2_1 mux30(out[30], a[30], b[30], s);
	mux2_1 mux31(out[31], a[31], b[31], s);
	
endmodule	