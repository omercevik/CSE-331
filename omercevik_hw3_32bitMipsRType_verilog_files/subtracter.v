module subtracter (S,A,B,CarryIn);
	input [31:0] A,B;
	input CarryIn;
	output [31:0] S;
	wire [31:0] noted;
	
	noter N(noted,B);
	adder ADD(S,A,noted,CarryIn);
endmodule 