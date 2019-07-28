module nextPC(PC, PCnext, clk);

	input clk;
	input [31:0] PC;
	output reg [31:0] PCnext;

	always @(posedge clk)
	begin
		PCnext = PC;
	end

endmodule 