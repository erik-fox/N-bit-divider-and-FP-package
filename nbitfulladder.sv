module nbitfulladder #(parameter N= 8) (a,b, s, cout);
input [N-1:0] a,b;
output [N-1:0] s;
output cout;

wire [N-1:0] w;
genvar i;
generate
	for(i=0;i<N;i++)
	begin
		if(i==0)
			fulladder m( a[i],b[i],1'b0, s[i],w[i]);
		else if(i==N-1)
			fulladder m(a[i],b[i],w[i],s[i], cout);
		else
			fulladder m(a[i],b[i],w[i],s[i],w[i]);
	end
endgenerate

endmodule
