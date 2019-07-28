module logical_shift_left(Res, a, b);
	input [31:0] a, b;
	output [31:0] Res;
	
	wire temp;
	wire [31:0] zero,MUX0,MUX1,MUX2,MUX3,resZero,resShift;
	or (temp, b[31], b[30], b[29], b[28], b[27], b[26], b[25], b[24], b[23],
			b[22], b[21], b[20], b[19], b[18], b[17], b[16], b[15], b[14], b[13],
			b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5]);
			
	ander A(resZero,zero,32'h0000_0000);
	
	LeftMuxLevel0 M0(MUX0, a, b[0]);
	LeftMuxLevel1 M1(MUX1, MUX0, b[1]);
	LeftMuxLevel2 M2(MUX2, MUX1, b[2]);
	LeftMuxLevel3 M3(MUX3, MUX2, b[3]);
	LeftMuxLevel4 M4(resShift, MUX3, b[4]);
	
	allmuxer2to1 M5(Res,resZero,resShift,temp );
endmodule 