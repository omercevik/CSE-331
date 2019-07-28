module alu32(ALUselector2, ALUselector1, ALUselector0, a, b, res, Zero0, OverFlow);
	input ALUselector2, ALUselector1, ALUselector0;
	input [31:0] a, b;
	output [31:0] res;
	output Zero0, OverFlow;
	
	wire [31:0] orRes,andRes,xorRes,norRes,addRes,subRes,rshiftRes,lshiftRes,Mux41,Mux42;
	wire n1, n2, n3, ov1, ov2;
	
	ander AND(andRes, a, b);
	orer  O(orRes, a, b);
	xorer X(xorRes, a, b);
	norer N(norRes, a, b);
	adder32bit ADD(addRes, a, b);
	subtracter32bit SUB(subRes, a, b);
	logical_shift_right RS(rshiftRes, a, b);
	logical_shift_left LS(lshiftRes, a, b);
	
	allmuxer4to1 MUX400(Mux41, andRes, orRes, addRes, xorRes, ALUselector1, ALUselector0);
	allmuxer4to1 MUX401(Mux42, subRes, rshiftRes, lshiftRes, norRes, ALUselector1, ALUselector0);
	allmuxer2to1 MUX2(res, Mux42, Mux41, ALUselector2);
	
	not N1(n1, res[31]);
	not N2(n2, a[31]);
	not N3(n3, b[31]);
	and OV1(ov1, n1, a[31], b[31]);
	and OV2(ov2, n2, n3, res[31]);
	or  OVERFLOWBIT(OverFlow, ov1, ov2);
	
	ZeroFounder Z0(res, Zero0);
endmodule 