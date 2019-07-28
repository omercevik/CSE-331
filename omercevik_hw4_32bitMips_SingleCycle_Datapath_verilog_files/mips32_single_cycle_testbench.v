module mips32_single_cycle_testbench();

	wire [31:0] R;
	reg [31:0] instr;
	reg [31:0] instructions [19:0];
	wire zero, ovf, jumpSignal, Branched, MemRead, MemWrite, RegWrite, RegDst, MemtoReg, ALUSrc;
	wire [2:0] ALUselector;
	
	reg clk, clk2;
	reg [7:0] index;
	
	mips32_single_cycle M(instr,R,clk,zero,ovf,jumpSignal,Branched,MemRead,MemWrite,RegWrite,RegDst,MemtoReg,ALUSrc,ALUselector);
	
	always
	begin
		#50 clk = ~clk;
	end
	
	always
	begin
		#150 clk2 = ~clk2;
	end
	
	initial
	begin
		clk = 0;
		clk2 = 0;
		index = 0;
		M.P.PCnext = 32'd0;
		$readmemb("registers.mem",M.Reg.registers);
		$readmemb("instr_memory.mem",instructions);
		$readmemb("memory.mem",M.MM.memory);
	end
	
	always @(*)
	begin
		index = index + 1;
		assign instr = instructions[M.P.PCnext];
		if( index === 8'd19 )
		begin
			$stop;
		end
	end
	
	always @(posedge clk2)
	begin
		$writememb("registers.mem",M.Reg.registers);
		$writememb("memory.mem",M.MM.memory);
	end
	
	initial
	begin
		$monitor("J Type    opcode/____target___jump___address___\nI Type    opcode/__rs_/__rt_/_____immediate____\nR Type    opcode/__rs_/__rt_/__rd_/shamt/_funct\nInst   :  %6b %5b %5b %5b %5b %6b\nResult :  %32b\nZero : %1b  Overflow : %1b  JumpSignal : %1b  BranchSignal : %1b  MemoryReadSignal : %1b MemoryWriteSignal : %1b  RegisterWriteSignal : %1b\nRegisterDestSignal : %1b  MemoryToRegSignal : %1b  ALUSrcSignal : %1b   ALUselector : %3b\nPC     :  %32d\n\n",instr[31:26],instr[25:21],instr[20:16],instr[15:11],instr[10:6],instr[5:0],R,zero,ovf,jumpSignal,Branched,MemRead,MemWrite,RegWrite,RegDst,MemtoReg,ALUSrc,ALUselector,M.P.PCnext);
	end

endmodule 