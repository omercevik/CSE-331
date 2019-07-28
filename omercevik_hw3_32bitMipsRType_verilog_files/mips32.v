module mips32(instruction, result, clk);	// Main RType Mips Module

	input [31:0] instruction;
	input clk;						// Input clock from testbench.
	output [31:0] result;
	wire [2:0] ALUselector;
	wire [31:0] A, B, sltuResult, tempResult, shamtResult, shiftResA, shiftResB;
	wire ShamtSelector, ShamtXor, zero, ovf;
		
	mips_registers Reg(A, B, result, instruction[25:21], instruction[20:16], instruction[15:11], 1'b1, clk );	// Register block.
	
	control_unit CU(ALUselector, instruction[5:0]);		// ALU control unit.
	
	shamt32bit Sham(shamtResult, instruction[10:6]);	// 32 bit shamount result.
	
	xor ShamtX(ShamtXor, ALUselector[0], ALUselector[1]);		// Calculating shift amount signal.
	and ShamtAnd(ShamtSelector, ShamtXor, ALUselector[2]);	// Calculating shift amount signal.
	allmuxer2to1 M0(shiftResA, B, A, ShamtSelector);				// Shift amount signal is 1 then $rt selects, otherwise $rs.
	allmuxer2to1 M2(shiftResB, shamtResult, B, ShamtSelector);	// Shift amount signal is 1 then shift amount result selects, otherwise $rt.
	
	alu32 ALU32(ALUselector[2], ALUselector[1], ALUselector[0], shiftResA, shiftResB, tempResult, zero, ovf);	// Evaluate ALU operations.
	
	buffer32bit S(sltuResult, tempResult[31]);	// 32 bit sltu result.
	
	allmuxer2to1 M1(result, sltuResult, tempResult, instruction[3]);	// Selecting sltu result or ALU result.
	
endmodule 