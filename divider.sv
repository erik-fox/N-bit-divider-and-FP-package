module divider #(parameter DIVIDENDLEN=16, parameter DIVISORLEN = 8)(dividend,divisor,quotient,remainder);
parameter N=4;
localparam QUOTIENTLEN=DIVIDENDLEN;
localparam REMAINDERLEN = DIVISORLEN; 
localparam DATAPATHLEN = DIVIDENDLEN + DIVISORLEN -1;
input [DIVIDENDLEN-1:0]dividend;
input [DIVISORLEN-1:0]divisor;
output [QUOTIENTLEN-1:0]quotient; 
output [REMAINDERLEN-1:0]remainder;

wire [DATAPATHLEN-1:0] w [(N*QUOTIENTLEN)];
genvar i;

generate
	for (i=0;i<QUOTIENTLEN-1;i=i+N)
	begin:divider
		if(i==0)
		begin
			nbitshifter #((QUOTIENTLEN-i),DIVISORLEN,DATAPATHLEN) n(divisor,w[i]);
			twoscomplement#(DATAPATHLEN) t(w[i],w[i+1]);
			nbitadder #(DATAPATHLEN) a(dividend,w[i+1],w[i+2],quotient[QUOTIENTLEN-i]);
			mux2_1 #(DATAPATHLEN) m(dividend,w[i+2],quotient[QUOTIENTLEN-i],w[i+3]);
		end
		else if(i==QUOTIENTLEN-1)
		begin
			nbitshifter #((QUOTIENTLEN-i),DIVISORLEN,DATAPATHLEN) n(divisior,w[i]);
			twoscomplement#(DATAPATHLEN) t(w[i],w[i+1]);
			nbitadder #(DATAPATHLEN) a(w[i-1],w[i+1],w[i+2],quotient[QUOTIENTLEN-i]);
			mux2_1 #(DATAPATHLEN) m(w[i-1], w[i+2], quotient[QUOTIENTLEN-i],remainder);
		end
		else
		begin
			nbitshifter #((QUOTIENTLEN-i),DIVISORLEN,DATAPATHLEN) n(divisor, w[i]);
			twoscomplement#(DATAPATHLEN) t(w[i],w[i+1]);
			nbitadder #(DATAPATHLEN) a( w[i-1],w[i+1],quotient[QUOTIENTLEN-i]);
			mux2_1 #(DATAPATHLEN) m(w[i-1],w[i+2],quotient[QUOTIENTLEN-i],w[i+3]);
		end	
	end
endgenerate

endmodule
