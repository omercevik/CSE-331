module jumpedAddress(jump_out,target_address);

	input [25:0] target_address;
	output [31:0] jump_out;
	
	buf J0(jump_out[0],target_address[0]);
	buf J1(jump_out[1],target_address[1]);
	buf J2(jump_out[2],target_address[2]);
	buf J3(jump_out[3],target_address[3]);
	buf J4(jump_out[4],target_address[4]);
	buf J5(jump_out[5],target_address[5]);
	buf J6(jump_out[6],target_address[6]);
	buf J7(jump_out[7],target_address[7]);
	buf J8(jump_out[8],target_address[8]);
	buf J9(jump_out[9],target_address[9]);
	buf J10(jump_out[10],target_address[10]);
	buf J11(jump_out[11],target_address[11]);
	buf J12(jump_out[12],target_address[12]);
	buf J13(jump_out[13],target_address[13]);
	buf J14(jump_out[14],target_address[14]);
	buf J15(jump_out[15],target_address[15]);
	buf J16(jump_out[16],target_address[16]);
	buf J17(jump_out[17],target_address[17]);
	buf J18(jump_out[18],target_address[18]);
	buf J19(jump_out[19],target_address[19]);
	buf J20(jump_out[20],target_address[20]);
	buf J21(jump_out[21],target_address[21]);
	buf J22(jump_out[22],target_address[22]);
	buf J23(jump_out[23],target_address[23]);
	buf J24(jump_out[24],target_address[24]);
	buf J25(jump_out[25],target_address[25]);
	buf J26(jump_out[26],1'b0);
	buf J27(jump_out[27],1'b0);
	buf J28(jump_out[28],1'b0);
	buf J29(jump_out[29],1'b0);
	buf J30(jump_out[30],1'b0);
	buf J31(jump_out[31],1'b0);
	
endmodule 