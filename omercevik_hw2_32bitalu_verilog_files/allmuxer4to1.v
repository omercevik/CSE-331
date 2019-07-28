module allmuxer4to1(out, c0, c1, c2, c3, s1, s0);
	input [31:0] c0, c1, c2, c3;
	input s1, s0;
	output [31:0] out;
	
	mux4to1 M0(out[0], c0[0], c1[0], c2[0], c3[0], s1, s0);
	mux4to1 M1(out[1], c0[1], c1[1], c2[1], c3[1], s1, s0);
	mux4to1 M2(out[2], c0[2], c1[2], c2[2], c3[2], s1, s0);
	mux4to1 M3(out[3], c0[3], c1[3], c2[3], c3[3], s1, s0);
	mux4to1 M4(out[4], c0[4], c1[4], c2[4], c3[4], s1, s0);
	mux4to1 M5(out[5], c0[5], c1[5], c2[5], c3[5], s1, s0);
	mux4to1 M6(out[6], c0[6], c1[6], c2[6], c3[6], s1, s0);
	mux4to1 M7(out[7], c0[7], c1[7], c2[7], c3[7], s1, s0);
	mux4to1 M8(out[8], c0[8], c1[8], c2[8], c3[8], s1, s0);
	mux4to1 M9(out[9], c0[9], c1[9], c2[9], c3[9], s1, s0);
	mux4to1 M10(out[10], c0[10], c1[10], c2[10], c3[10], s1, s0);
	mux4to1 M11(out[11], c0[11], c1[11], c2[11], c3[11], s1, s0);
	mux4to1 M12(out[12], c0[12], c1[12], c2[12], c3[12], s1, s0);
	mux4to1 M13(out[13], c0[13], c1[13], c2[13], c3[13], s1, s0);
	mux4to1 M14(out[14], c0[14], c1[14], c2[14], c3[14], s1, s0);
	mux4to1 M15(out[15], c0[15], c1[15], c2[15], c3[15], s1, s0);
	mux4to1 M16(out[16], c0[16], c1[16], c2[16], c3[16], s1, s0);
	mux4to1 M17(out[17], c0[17], c1[17], c2[17], c3[17], s1, s0);
	mux4to1 M18(out[18], c0[18], c1[18], c2[18], c3[18], s1, s0);
	mux4to1 M19(out[19], c0[19], c1[19], c2[19], c3[19], s1, s0);
	mux4to1 M20(out[20], c0[20], c1[20], c2[20], c3[20], s1, s0);
	mux4to1 M21(out[21], c0[21], c1[21], c2[21], c3[21], s1, s0);
	mux4to1 M22(out[22], c0[22], c1[22], c2[22], c3[22], s1, s0);
	mux4to1 M23(out[23], c0[23], c1[23], c2[23], c3[23], s1, s0);
	mux4to1 M24(out[24], c0[24], c1[24], c2[24], c3[24], s1, s0);
	mux4to1 M25(out[25], c0[25], c1[25], c2[25], c3[25], s1, s0);
	mux4to1 M26(out[26], c0[26], c1[26], c2[26], c3[26], s1, s0);
	mux4to1 M27(out[27], c0[27], c1[27], c2[27], c3[27], s1, s0);
	mux4to1 M28(out[28], c0[28], c1[28], c2[28], c3[28], s1, s0);
	mux4to1 M29(out[29], c0[29], c1[29], c2[29], c3[29], s1, s0);
	mux4to1 M30(out[30], c0[30], c1[30], c2[30], c3[30], s1, s0);
	mux4to1 M31(out[31], c0[31], c1[31], c2[31], c3[31], s1, s0);
	
endmodule 