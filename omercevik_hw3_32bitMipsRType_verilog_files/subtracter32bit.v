module subtracter32bit(S,A,B);
	input [31:0] A,B;
	output [31:0] S;
	subtracter SUB(S,A,B,1'b1);
endmodule 