module signExtend(imm, Ext);

	input [15:0] imm;
	output [31:0] Ext;

	buf B0(Ext[0],imm[0]);
	buf B1(Ext[1],imm[1]);
	buf B2(Ext[2],imm[2]);
	buf B3(Ext[3],imm[3]);
	buf B4(Ext[4],imm[4]);
	buf B5(Ext[5],imm[5]);
	buf B6(Ext[6],imm[6]);
	buf B7(Ext[7],imm[7]);
	buf B8(Ext[8],imm[8]);
	buf B9(Ext[9],imm[9]);
	buf B10(Ext[10],imm[10]);
	buf B11(Ext[11],imm[11]);
	buf B12(Ext[12],imm[12]);
	buf B13(Ext[13],imm[13]);
	buf B14(Ext[14],imm[14]);
	buf B15(Ext[15],imm[15]);
	buf B16(Ext[16],imm[15]);
	buf B17(Ext[17],imm[15]);
	buf B18(Ext[18],imm[15]);
	buf B19(Ext[19],imm[15]);
	buf B20(Ext[20],imm[15]);
	buf B21(Ext[21],imm[15]);
	buf B22(Ext[22],imm[15]);
	buf B23(Ext[23],imm[15]);
	buf B24(Ext[24],imm[15]);
	buf B25(Ext[25],imm[15]);
	buf B26(Ext[26],imm[15]);
	buf B27(Ext[27],imm[15]);
	buf B28(Ext[28],imm[15]);
	buf B29(Ext[29],imm[15]);
	buf B30(Ext[30],imm[15]);
	buf B31(Ext[31],imm[15]);

endmodule 