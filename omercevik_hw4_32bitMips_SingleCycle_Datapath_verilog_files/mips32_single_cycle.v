module mips32_single_cycle(instruction, result, clk, zero, ovf, jumpSignal, Branched, MemRead, MemWrite, RegWrite, RegDst, MemtoReg, ALUSrc, ALUselector);	// Main Single Cycle Datapath Mips Module
	
	input [31:0] instruction;
	input clk;						// Input clock from testbench.
	output [31:0] result;
	output zero, ovf, jumpSignal, Branched, MemRead, MemWrite, RegWrite, RegDst, MemtoReg, ALUSrc;
	output [2:0] ALUselector;
	wire [31:0] A, B, sltuResult, tempResult, shamtResult, shiftResA, shiftResB, signExtended, ALUResult;
	wire [31:0] MemOut, signExtAdded, tempPC, PC, PCnext, PCplusFour, RTypeImm, JumpTarget, zeroExtended, SgZr;
	wire [4:0] RegDstRes;
	wire ShamtSelector, ShamtXor, Branch, andi, addiu, ori, NI1, NI2, NI4, sltuSgn, SignorZero;
	wire ALUOp1,ALUOp0;
	
	nextPC P(PC,PCnext,clk);
			
	adder32bit PCPLUS4(PCplusFour,PCnext,32'd1);
		
	signExtend Sign(instruction[15:0],signExtended);
	
	zeroExtend ZE(instruction[15:0],zeroExtended);
		
	adder32bit ALSL(signExtAdded,PCplusFour,signExtended);
	
	jumpedAddress JMP(JumpTarget,instruction[25:0]);

	control_unit CU(instruction[31:26],RegDst,MemRead,MemtoReg,ALUOp1,ALUOp0,MemWrite,ALUSrc,RegWrite,Branch,jumpSignal,andi,addiu,ori);
	
	and BB(Branched,Branch,zero);

	allmuxer2to1 JJ(tempPC,signExtAdded,PCplusFour,Branched);
	
	allmuxer2to1 JB(PC,JumpTarget,tempPC,jumpSignal);
	
	mux2to1 REGDEST0(RegDstRes[0],instruction[11],instruction[16],RegDst);
	mux2to1 REGDEST1(RegDstRes[1],instruction[12],instruction[17],RegDst);
	mux2to1 REGDEST2(RegDstRes[2],instruction[13],instruction[18],RegDst);
	mux2to1 REGDEST3(RegDstRes[3],instruction[14],instruction[19],RegDst);
	mux2to1 REGDEST4(RegDstRes[4],instruction[15],instruction[20],RegDst);
	
	mips_registers Reg(A, B, result, instruction[25:21], instruction[20:16], RegDstRes, RegWrite, clk );	// Register block.
		
	alu_control_unit ALUCU(ALUselector,instruction[5:0],ALUOp1,ALUOp0,andi,addiu,ori);		// ALU control unit.
	
	shamt32bit Sham(shamtResult, instruction[10:6]);	// 32 bit shamount result.
	
	xor ShamtX(ShamtXor, ALUselector[0], ALUselector[1]);		// Calculating shift amount signal.
	and ShamtAnd(ShamtSelector, ShamtXor, ALUselector[2]);	// Calculating shift amount signal.
	allmuxer2to1 M0(shiftResA, B, A, ShamtSelector);				// Shift amount signal is 1 then $rt selects, otherwise $rs.
	allmuxer2to1 M2(shiftResB, shamtResult, B, ShamtSelector);	// Shift amount signal is 1 then shift amount result selects, otherwise $rt.
	
	or SZ(SignorZero, andi, ori);
	
	allmuxer2to1 SignZero(SgZr,zeroExtended,signExtended,SignorZero);
	allmuxer2to1 RI(RTypeImm,SgZr,shiftResB,ALUSrc);
	
	alu32 ALU32(ALUselector[2], ALUselector[1], ALUselector[0], shiftResA, RTypeImm, tempResult, zero, ovf);	// Evaluate ALU operations.
	
	buffer32bit S(sltuResult, tempResult[31]);	// 32 bit sltu result.
	
	not I1(NI1,instruction[1]);
	not I2(NI2,instruction[2]);
	not I4(NI4,instruction[4]);
	and sltuSS(sltuSgn,instruction[0],NI1,NI2,instruction[3],NI4,instruction[5]);
	
	allmuxer2to1 M1(ALUResult, sltuResult, tempResult, sltuSgn);	// Selecting sltu result or ALU result.
	
	mips_memory MM(ALUResult, shiftResB, MemOut, MemWrite, MemRead, clk);
	
	allmuxer2to1 RRR(result,MemOut,ALUResult,MemtoReg);
	
endmodule 