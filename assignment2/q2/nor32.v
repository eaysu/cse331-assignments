module nor32(out, a, b);

input [31:0] a, b;
output [31:0] out;

   // 32 bit nor operation
	nor(out[0], a[0], b[0]);
	nor(out[1], a[1], b[1]);
	nor(out[2], a[2], b[2]);
	nor(out[3], a[3], b[3]);
	nor(out[4], a[4], b[4]);
	nor(out[5], a[5], b[5]);
	nor(out[6], a[6], b[6]);
	nor(out[7], a[7], b[7]);
	nor(out[8], a[8], b[8]);
	nor(out[9], a[9], b[9]);
	nor(out[10], a[10], b[10]);
	nor(out[11], a[11], b[11]);
	nor(out[12], a[12], b[12]);
	nor(out[13], a[13], b[13]);
	nor(out[14], a[14], b[14]);
	nor(out[15], a[15], b[15]);
	nor(out[16], a[16], b[16]);
	nor(out[17], a[17], b[17]);
	nor(out[18], a[18], b[18]);
	nor(out[19], a[19], b[19]);
	nor(out[20], a[20], b[20]);
	nor(out[21], a[21], b[21]);
	nor(out[22], a[22], b[22]);
	nor(out[23], a[23], b[23]);
	nor(out[24], a[24], b[24]);
	nor(out[25], a[25], b[25]);
	nor(out[26], a[26], b[26]);
	nor(out[27], a[27], b[27]);
	nor(out[28], a[28], b[28]);
	nor(out[29], a[29], b[29]);
	nor(out[30], a[30], b[30]);
	nor(out[31], a[31], b[31]);

endmodule