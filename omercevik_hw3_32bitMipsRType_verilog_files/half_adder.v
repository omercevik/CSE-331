module half_adder(sum, carry_out, a, b);
	input a, b;
	output sum, carry_out;

	xor X(sum, a, b);
	and A(carry_out, a, b);
endmodule 