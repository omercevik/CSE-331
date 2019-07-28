module my_NAND(A, B, F);
input A, B;
output F;
nand G(F, A, B); // first parameter must be output.
endmodule 