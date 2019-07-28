module mips32_testbench ();
	reg [31:0] instruction_set;
	wire [31:0] result;
	reg clk;
	
	mips32 RTypeMips32(instruction_set, result, clk);	// Main module calls with clock.
	
	initial
	begin
		clk = 1;		// Main clock for register block.
	end
	
	initial
	begin
		$readmemb("registers.mem", RTypeMips32.Reg.registers);	// Read from registers.mem file into registers[][].
		//  add addu sub subu and or nor sll srl sltu
		//  20   21   22  23  24  25  27  00  02   2b
		//							 opcode/__rs_/__rt_/__rd_/shamt/_funct
		instruction_set = 32'b000000_10000_10001_10010_00000_100000;	// add
		#20; clk = ~clk; #20;		 				// rs=$16 rt=$17 rd=$18 s2=s0+s1 		add  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_10011_00000_100001;	// addu
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$19 s2=s0+s1 		addu s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_10100_00000_100010;	// sub
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$20 s2=s0-s1 		sub  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_10101_00000_100011;	// subu
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$21 s2=s0-s1 		subu s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_10110_00000_100100;	// and
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$22 s2=s0&s1 		and  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_10111_00000_100101;	// or
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$23 s2=s0|s1 		or   s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_11000_00000_100111;	// nor
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$24 s2=~(s0|s1)	   nor  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_11001_00001_000000;	// sll
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$25 s2=s0<<s1 		sll  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_11010_00001_000010;	// srl
		#20; clk = ~clk; #20;						// rs=$16 rt=$17 rd=$26 s2=s0>>s1 		srl  s2 s0 s1
		clk = ~clk; instruction_set = 32'b000000_10000_10001_11011_00000_101011;	// sltu
		#20;							// rs=$16 rt=$17 rd=$27 s2=s0<s1 		sltu s2 s0 s1
		
		$writememb("registers.mem", RTypeMips32.Reg.registers);	// Write into registers.mem file from registers[][].
	end
	
	initial		// Print to screen what we found in result.
	begin
		$monitor("              opcode/__rs_/__rt_/__rd_/shamt/_funct\ninstruction : %6b %5b %5b %5b %5b %6h\nresult      : %32b\n", instruction_set[31:26], instruction_set[25:21], instruction_set[20:16], instruction_set[15:11], instruction_set[10:6], instruction_set[5:0], result);
	end

endmodule 