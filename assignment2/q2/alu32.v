module alu32(result, a, b, aluop);

input [31:0] a, b;
input [2:0] aluop;
output [31:0] result;

wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8;
wire cout;

	// logical and mathmatical operations
	adder32 op1(w1, cout, a, b, 1'b0);
	subs32 op2(w2, a, b);
// mult32 op3(w3, a, b);
	xor32 op4(w4, a, b);
	and32 op5(w5, a, b);
	or32 op6(w6, a, b);
	slt32 op7(w7, a, b);
	nor32 op8(w8, a, b);
	
	
	// 32 bit 8x1 mux
	mux8_1 mux0(result[0], w1[0], w2[0], w3[0], w4[0], w5[0], w6[0], w7[0], w8[0], aluop);
	mux8_1 mux1(result[1], w1[1], w2[1], w3[1], w4[1], w5[1], w6[1], w7[1], w8[1], aluop);
	mux8_1 mux2(result[2], w1[2], w2[2], w3[2], w4[2], w5[2], w6[2], w7[2], w8[2], aluop);
	mux8_1 mux3(result[3], w1[3], w2[3], w3[3], w4[3], w5[3], w6[3], w7[3], w8[3], aluop);
	mux8_1 mux4(result[4], w1[4], w2[4], w3[4], w4[4], w5[4], w6[4], w7[4], w8[4], aluop);
	mux8_1 mux5(result[5], w1[5], w2[5], w3[5], w4[5], w5[5], w6[5], w7[5], w8[5], aluop);
	mux8_1 mux6(result[6], w1[6], w2[6], w3[6], w4[6], w5[6], w6[6], w7[6], w8[6], aluop);
	mux8_1 mux7(result[7], w1[7], w2[7], w3[7], w4[7], w5[7], w6[7], w7[7], w8[7], aluop);
	mux8_1 mux8(result[8], w1[8], w2[8], w3[8], w4[8], w5[8], w6[8], w7[8], w8[8], aluop);
	mux8_1 mux9(result[9], w1[9], w2[9], w3[9], w4[9], w5[9], w6[9], w7[9], w8[9], aluop);
	mux8_1 mux10(result[10], w1[10], w2[10], w3[10], w4[10], w5[10], w6[10], w7[10], w8[10], aluop);
	mux8_1 mux11(result[11], w1[11], w2[11], w3[11], w4[11], w5[11], w6[11], w7[11], w8[11], aluop);
	mux8_1 mux12(result[12], w1[12], w2[12], w3[12], w4[12], w5[12], w6[12], w7[12], w8[12], aluop);
	mux8_1 mux13(result[13], w1[13], w2[13], w3[13], w4[13], w5[13], w6[13], w7[13], w8[13], aluop);
	mux8_1 mux14(result[14], w1[14], w2[14], w3[14], w4[14], w5[14], w6[14], w7[14], w8[14], aluop);
	mux8_1 mux15(result[15], w1[15], w2[15], w3[15], w4[15], w5[15], w6[15], w7[15], w8[15], aluop);
	mux8_1 mux16(result[16], w1[16], w2[16], w3[16], w4[16], w5[16], w6[16], w7[16], w8[16], aluop);
	mux8_1 mux17(result[17], w1[17], w2[17], w3[17], w4[17], w5[17], w6[17], w7[17], w8[17], aluop);
	mux8_1 mux18(result[18], w1[18], w2[18], w3[18], w4[18], w5[18], w6[18], w7[18], w8[18], aluop);
	mux8_1 mux19(result[19], w1[19], w2[19], w3[19], w4[19], w5[19], w6[19], w7[19], w8[19], aluop);
	mux8_1 mux20(result[20], w1[20], w2[20], w3[20], w4[20], w5[20], w6[20], w7[20], w8[20], aluop);
	mux8_1 mux21(result[21], w1[21], w2[21], w3[21], w4[21], w5[21], w6[21], w7[21], w8[21], aluop);
	mux8_1 mux22(result[22], w1[22], w2[22], w3[22], w4[22], w5[22], w6[22], w7[22], w8[22], aluop);
	mux8_1 mux23(result[23], w1[23], w2[23], w3[23], w4[23], w5[23], w6[23], w7[23], w8[23], aluop);
	mux8_1 mux24(result[24], w1[24], w2[24], w3[24], w4[24], w5[24], w6[24], w7[24], w8[24], aluop);
	mux8_1 mux25(result[25], w1[25], w2[25], w3[25], w4[25], w5[25], w6[25], w7[25], w8[25], aluop);
	mux8_1 mux26(result[26], w1[26], w2[26], w3[26], w4[26], w5[26], w6[26], w7[26], w8[26], aluop);
	mux8_1 mux27(result[27], w1[27], w2[27], w3[27], w4[27], w5[27], w6[27], w7[27], w8[27], aluop);
	mux8_1 mux28(result[28], w1[28], w2[28], w3[28], w4[28], w5[28], w6[28], w7[28], w8[28], aluop);
	mux8_1 mux29(result[29], w1[29], w2[29], w3[29], w4[29], w5[29], w6[29], w7[29], w8[29], aluop);
	mux8_1 mux30(result[30], w1[30], w2[30], w3[30], w4[30], w5[30], w6[30], w7[30], w8[30], aluop);
	mux8_1 mux31(result[31], w1[31], w2[31], w3[31], w4[31], w5[31], w6[31], w7[31], w8[31], aluop);

endmodule
