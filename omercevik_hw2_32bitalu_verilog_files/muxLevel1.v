module muxLevel1(M, A, s1);
	input [31:0] A;
	input s1;
	output [31:0] M;
	
	mux2to1 m0(M[0], A[2], A[0], s1);
	mux2to1 m1(M[1], A[3], A[1], s1);
	mux2to1 m2(M[2], A[4], A[2], s1);
	mux2to1 m3(M[3], A[5], A[3], s1);
	mux2to1 m4(M[4], A[6], A[4], s1);
	mux2to1 m5(M[5], A[7], A[5], s1);
	mux2to1 m6(M[6], A[8], A[6], s1);
	mux2to1 m7(M[7], A[9], A[7], s1);
	mux2to1 m8(M[8], A[10], A[8], s1);
	mux2to1 m9(M[9], A[11], A[9], s1);
	mux2to1 m10(M[10], A[12], A[10], s1);
	mux2to1 m11(M[11], A[12], A[11], s1);
	mux2to1 m12(M[12], A[14], A[12], s1);
	mux2to1 m13(M[13], A[15], A[13], s1);
	mux2to1 m14(M[14], A[16], A[14], s1);
	mux2to1 m15(M[15], A[17], A[15], s1);
	mux2to1 m16(M[16], A[18], A[16], s1);
	mux2to1 m17(M[17], A[19], A[17], s1);
	mux2to1 m18(M[18], A[20], A[18], s1);
	mux2to1 m19(M[19], A[21], A[19], s1);
	mux2to1 m20(M[20], A[22], A[20], s1);
	mux2to1 m21(M[21], A[23], A[21], s1);
	mux2to1 m22(M[22], A[24], A[22], s1);
	mux2to1 m23(M[23], A[25], A[23], s1);
	mux2to1 m24(M[24], A[26], A[24], s1);
	mux2to1 m25(M[25], A[27], A[25], s1);
	mux2to1 m26(M[26], A[28], A[26], s1);
	mux2to1 m27(M[27], A[29], A[27], s1);
	mux2to1 m28(M[28], A[30], A[28], s1);
	mux2to1 m29(M[29], A[31], A[29], s1);
	mux2to1 m30(M[30], A[31], A[30], s1);
	mux2to1 m31(M[31], A[31], A[31], s1);
endmodule 