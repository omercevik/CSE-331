module allmuxer2to1(out, i, j, s);
	input [31:0] i, j;
	output [31:0] out;
	input s;
	
	mux2to1 M0(out[0], i[0], j[0], s);
	mux2to1 M1(out[1], i[1], j[1], s);
	mux2to1 M2(out[2], i[2], j[2], s);
	mux2to1 M3(out[3], i[3], j[3], s);
	mux2to1 M4(out[4], i[4], j[4], s);
	mux2to1 M5(out[5], i[5], j[5], s);
	mux2to1 M6(out[6], i[6], j[6], s);
	mux2to1 M7(out[7], i[7], j[7], s);
	mux2to1 M8(out[8], i[8], j[8], s);
	mux2to1 M9(out[9], i[9], j[9], s);
	mux2to1 M10(out[10], i[10], j[10], s);
	mux2to1 M11(out[11], i[11], j[11], s);
	mux2to1 M12(out[12], i[12], j[12], s);
	mux2to1 M13(out[13], i[13], j[13], s);
	mux2to1 M14(out[14], i[14], j[14], s);
	mux2to1 M15(out[15], i[15], j[15], s);
	mux2to1 M16(out[16], i[16], j[16], s);
	mux2to1 M17(out[17], i[17], j[17], s);
	mux2to1 M18(out[18], i[18], j[18], s);
	mux2to1 M19(out[19], i[19], j[19], s);
	mux2to1 M20(out[20], i[20], j[20], s);
	mux2to1 M21(out[21], i[21], j[21], s);
	mux2to1 M22(out[22], i[22], j[22], s);
	mux2to1 M23(out[23], i[23], j[23], s);
	mux2to1 M24(out[24], i[24], j[24], s);
	mux2to1 M25(out[25], i[25], j[25], s);
	mux2to1 M26(out[26], i[26], j[26], s);
	mux2to1 M27(out[27], i[27], j[27], s);
	mux2to1 M28(out[28], i[28], j[28], s);
	mux2to1 M29(out[29], i[29], j[29], s);
	mux2to1 M30(out[30], i[30], j[30], s);
	mux2to1 M31(out[31], i[31], j[31], s);
	
endmodule 