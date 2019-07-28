module mux2to1(out,i1,i0,s);
    output out;
    input i1,i0,s;
	 wire u,m,n;
    not (u,s);
    and (m,s,i1);
    and (n,u,i0);
    or (out,m,n);
endmodule 