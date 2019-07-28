module control_unit(opcode,RegDst,MemRead,MemtoReg,ALUOp1,ALUOp0,MemWrite,ALUSrc,RegWrite,Branch,Jump,andi,addiu,ori);

	input [5:0] opcode;
	output RegDst,MemRead,MemtoReg,ALUOp1,ALUOp0,MemWrite,ALUSrc,RegWrite,Branch,Jump,andi,addiu,ori;

	wire OP0,OP1,OP2,OP3,OP4,OP5,lw,Rtype,BeqType,sw,JS,a0,a1;

	not O0(OP0,opcode[0]);
	not O1(OP1,opcode[1]);
	not O2(OP2,opcode[2]);
	not O3(OP3,opcode[3]);
	not O4(OP4,opcode[4]);
	not O5(OP5,opcode[5]);
	
	and LWS(lw,opcode[0],opcode[1],OP2,OP3,OP4,opcode[5]);
	and BS(BeqType,OP0,OP1,opcode[2],OP3,OP4,OP5);
	and SWS(sw,opcode[0],opcode[1],OP2,opcode[3],OP4,opcode[5]);
	and RT(Rtype,OP0,OP1,OP2,OP3,OP4,OP5);
	and J(JS,OP0,opcode[1],OP2,OP3,OP4,OP5);
	
	and ANDDi(andi,OP5,OP4,opcode[3],opcode[2],OP1,OP0);
	and ORRi(ori,OP5,OP4,opcode[3],opcode[2],OP1,opcode[0]);
	and ADDDiu(addiu,OP5,OP4,opcode[3],OP2,OP1,opcode[0]);
	
	and H0(a0,opcode[3],OP1);
	and H1(a1,OP2,OP1);
	
	buf RDest(RegDst,Rtype);
	or ASrc(ALUSrc,lw,sw,andi,ori,addiu);
	buf MemREG(MemtoReg,lw);
	or REGWR(RegWrite,Rtype,lw,andi,ori,addiu);
	buf MEMR(MemRead,lw);
	buf MEMW(MemWrite,sw);
	buf BEQ(Branch,BeqType);
	or AOP1(ALUOp1,a0,a1);
	or AOP0(ALUOp0,opcode[2],a0);
	buf JSS(Jump,JS);
	
endmodule 