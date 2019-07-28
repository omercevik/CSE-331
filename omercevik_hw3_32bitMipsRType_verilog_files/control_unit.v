module control_unit(select_bits_ALU, function_code);

input [5:0] function_code;
output [2:0] select_bits_ALU;

wire n5,n2,n1,a1,a2,a3,a4;

not N5(n5, function_code[5]);
not N2(n2, function_code[2]);
not N1(n1, function_code[1]);

and A3(a3, n5, function_code[1]);
and A4(a4, function_code[0], function_code[2]);
or O0(select_bits_ALU[0], a3, a4);

and A1(a1, n2, n1);
and A2(a2, function_code[2], function_code[1]);
or O1(select_bits_ALU[1], a1, a2);

or O2(select_bits_ALU[2], n5, function_code[1]);

endmodule 