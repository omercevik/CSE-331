module adder32bit(S,A,B);
	input [31:0] A,B;
	output [31:0] S;
	adder AND(S,A,B,1'b0);
endmodule 