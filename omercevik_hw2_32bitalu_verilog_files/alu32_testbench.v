module alu32_testbench(); 
reg [31:0]a, b;
reg ALUselector2, ALUselector1, ALUselector0;

wire [31:0]result;
wire ZeroBit,V;

alu32 alu32tb(ALUselector2, ALUselector1, ALUselector0, a, b, result, ZeroBit, V);

initial begin

//	ALU 000
ALUselector2 = 1'b0; ALUselector1 = 1'b0; ALUselector0 = 1'b0;
a = 32'hAF00_0001; b = 32'hADE0_0001;
#10;
a = 32'hABC0_DF02; b = 32'h1FA0_C001;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

// ALU 001
ALUselector2 = 1'b0; ALUselector1 = 1'b0; ALUselector0 = 1'b1;
a = 32'hAF00_0001; b = 32'hADE0_0001;
#10;
a = 32'hABC0_DF02; b = 32'h1FA0_C001;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

// ALU 010
ALUselector2 = 1'b0; ALUselector1 = 1'b1; ALUselector0 = 1'b0;
a = 32'hAF00_0001; b = 32'hADE0_0001;
#10;
a = 32'hABC0_DF02; b = 32'h0000_C001;
#10;
a = 32'h1234_5678; b = 32'h000F_CB01;
#10;
 
// ALU 011
ALUselector2 = 1'b0; ALUselector1 = 1'b1; ALUselector0 = 1'b1;
a = 32'hAF00_0001; b = 32'hADE0_0001;
#10;
a = 32'hABC0_DF02; b = 32'h1FA0_C001;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;
 
// ALU 100
ALUselector2 = 1'b1; ALUselector1 = 1'b0; ALUselector0 = 1'b0;
a = 32'hAF00_0501; b = 32'hAD00_0001;
#10;
a = 32'hABC0_DF02; b = 32'h1FA0_C001;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

// ALU 101
ALUselector2 = 1'b1; ALUselector1 = 1'b0; ALUselector0 = 1'b1;
a = 32'hAF00_0001; b = 32'h0000_0002;
#10;
a = 32'hABC0_DF02; b = 32'h0000_001F;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

// ALU 110
ALUselector2 = 1'b1; ALUselector1 = 1'b1; ALUselector0 = 1'b0;
a = 32'hAF00_CD01; b = 32'h0000_0001;
#10;
a = 32'hABC0_DF03; b = 32'h0000_001F;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

// ALU 111
ALUselector2 = 1'b1; ALUselector1 = 1'b1; ALUselector0 = 1'b1;
a = 32'hAF00_0001; b = 32'hADE0_F0A1;
#10;
a = 32'hABC0_DF02; b = 32'h1FA0_C0B1;
#10;
a = 32'h1234_5678; b = 32'hD59F_CB01;
#10;

end

initial begin
$monitor("Selector : %1b%1b%1b\n     A = %32b\n     B = %32b\n\nResult = %32b  Zero Bit : %1b  OverFlow : %1b\n", ALUselector2, ALUselector1, ALUselector0, a, b, result, ZeroBit, V);
end
endmodule 