module mips_memory
( write_data_address, write_data, read_mem, signal_mem_write, signal_mem_read, clk );

	output reg [31:0] read_mem;
	input [31:0] write_data_address, write_data;
	input signal_mem_write, signal_mem_read, clk;
	
	reg [31:0] memory [255:0];

	always @(posedge clk)			// While clock is posedge do below.
	begin
		if( signal_mem_read == 1'b1 )	// If signal read is 1 then do below.
		begin
			read_mem <= memory[write_data_address];	// Read into read_mem content from memory[write_data_address].
		end
		if( signal_mem_write == 1'b1 )	// If signal write is 1 then do below.
		begin
			memory[write_data_address] <= write_data;	// Write write_data content to memory[write_data_address].
		end
	end
	
endmodule 