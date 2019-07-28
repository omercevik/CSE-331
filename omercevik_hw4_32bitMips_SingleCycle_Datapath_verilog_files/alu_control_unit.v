module alu_control_unit(select_bits_ALU, function_code, ALUop1, ALUop0, andi, addiu, ori);

	input [5:0] function_code;
	input ALUop1,ALUop0,andi,addiu,ori;
	output [2:0] select_bits_ALU;

	wire NF1,NF2,NF3,NF5,AOP1,AOP0;
	wire and1,and2,and3,and4,and5,and6,and7,and8,and9,and10;
	wire or0,or1,or2;
	wire a0,a1,a2,aa0,aa1,aa2;
	
	not NN1(NF1,function_code[1]);
	not NN2(NF2,function_code[2]);
	not NN3(NF3,function_code[3]);
	not NN5(NF5,function_code[5]);
	
	not A0(AOP0,ALUop0);
	not A1(AOP1,ALUop1);
	
	and AND1(and1,ALUop1,NF5);
	and AND2(and2,ALUop1,NF2,function_code[1]);
	and AND3(and3,ALUop1,function_code[1],function_code[0]);
	and AND4(and4,ALUop1,function_code[3]);
	and AND5(and5,AOP1,AOP0);
	and AND6(and6,AOP0,NF3,NF2,NF1);
	and AND7(and7,AOP0,function_code[2],function_code[1]);
	and AND8(and8,ALUop1,function_code[1],NF5);
	and AND9(and9,ALUop1,function_code[2],function_code[0]);
	and AND10(and10,ALUop1,function_code[2],function_code[1]);
	
	or ALU2(or2,ALUop0,and1,and2,and3,and4);
	or ALU1(or1,and5,and6,and7);
	or ALU0(or0,and8,and9,and10);

	mux2to1 M2(a2,1'b0,or2,andi);	
	mux2to1 M1(a1,1'b0,or1,andi);	
	mux2to1 M0(a0,1'b0,or0,andi);
	
	mux2to1 M02(aa2,1'b0,a2,ori);
	mux2to1 M01(aa1,1'b0,a1,ori);
	mux2to1 M00(aa0,1'b1,a0,ori);
	
	mux2to1 M002(select_bits_ALU[2],1'b0,aa2,addiu);
	mux2to1 M001(select_bits_ALU[1],1'b1,aa1,addiu);
	mux2to1 M000(select_bits_ALU[0],1'b0,aa0,addiu);
	
endmodule 