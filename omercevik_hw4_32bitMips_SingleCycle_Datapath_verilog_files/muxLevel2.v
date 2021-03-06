module muxLevel2(M, A, s2);
	input [31:0] A;
	input s2;
	output [31:0] M;
	
	mux2to1 m0(M[0], A[4], A[0], s2);
	mux2to1 m1(M[1], A[5], A[1], s2);
	mux2to1 m2(M[2], A[6], A[2], s2);
	mux2to1 m3(M[3], A[7], A[3], s2);
	mux2to1 m4(M[4], A[8], A[4], s2);
	mux2to1 m5(M[5], A[9], A[5], s2);
	mux2to1 m6(M[6], A[10], A[6], s2);
	mux2to1 m7(M[7], A[11], A[7], s2);
	mux2to1 m8(M[8], A[12], A[8], s2);
	mux2to1 m9(M[9], A[13], A[9], s2);
	mux2to1 m10(M[10], A[14], A[10], s2);
	mux2to1 m11(M[11], A[15], A[11], s2);
	mux2to1 m12(M[12], A[16], A[12], s2);
	mux2to1 m13(M[13], A[17], A[13], s2);
	mux2to1 m14(M[14], A[18], A[14], s2);
	mux2to1 m15(M[15], A[19], A[15], s2);
	mux2to1 m16(M[16], A[20], A[16], s2);
	mux2to1 m17(M[17], A[21], A[17], s2);
	mux2to1 m18(M[18], A[22], A[18], s2);
	mux2to1 m19(M[19], A[23], A[19], s2);
	mux2to1 m20(M[20], A[24], A[20], s2);
	mux2to1 m21(M[21], A[25], A[21], s2);
	mux2to1 m22(M[22], A[26], A[22], s2);
	mux2to1 m23(M[23], A[27], A[23], s2);
	mux2to1 m24(M[24], A[28], A[24], s2);
	mux2to1 m25(M[25], A[29], A[25], s2);
	mux2to1 m26(M[26], A[30], A[26], s2);
	mux2to1 m27(M[27], A[31], A[27], s2);
	mux2to1 m28(M[28], 1'b0, A[28], s2);
	mux2to1 m29(M[29], 1'b0, A[29], s2);
	mux2to1 m30(M[30], 1'b0, A[30], s2);
	mux2to1 m31(M[31], 1'b0, A[31], s2);
endmodule 