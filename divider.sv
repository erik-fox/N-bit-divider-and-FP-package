module divider #(parameter DIVIDENDLEN=16, parameter DIVISORLEN = 8)(dividend,divisor,quotient,remainder);
parameter N=4;
localparam QUOTIENTLEN=DIVIDENDLEN;
localparam REMAINDERLEN = DIVISORLEN; 
localparam DATAPATHLEN = DIVIDENDLEN + DIVISORLEN -1;
input bit[DIVIDENDLEN-1:0]dividend;
input bit[DIVISORLEN-1:0]divisor;
output bit [QUOTIENTLEN-1:0]quotient; 
output bit [REMAINDERLEN-1:0]remainder;

wire [DATAPATHLEN-1:0] w1 [(QUOTIENTLEN)];
wire [DATAPATHLEN-1:0] w2 [(QUOTIENTLEN)];
wire [DATAPATHLEN-1:0] w3 [(QUOTIENTLEN)];
wire [DATAPATHLEN-1:0] w4 [(QUOTIENTLEN)];
genvar i;

generate
	for (i=0;i<=(QUOTIENTLEN)-1;i++)
	begin:divider
		if(i==0)
		begin
        		nbitshifter #((QUOTIENTLEN-1-i),DIVISORLEN,DATAPATHLEN) n(divisor,w1[i]);
          		twoscomplement#(DATAPATHLEN) t(w1[i],w2[i]);
          		nbitfulladder #(DATAPATHLEN) a(dividend,w2[i],w3[i],quotient[QUOTIENTLEN-1-i]);
          		mux2_1 #(DATAPATHLEN) m(dividend,w3[i],quotient[QUOTIENTLEN-1-i],w4[i]);
		end
		else if(i==QUOTIENTLEN-1)
		begin
        		twoscomplement#(DATAPATHLEN) t(divisor,w2[i]);
          		nbitfulladder #(DATAPATHLEN) a(w4[i-1],w2[i],w3[i],quotient[QUOTIENTLEN-1-i]);
          		mux2_1 #(DATAPATHLEN) m(w4[i-1], w3[i], quotient[QUOTIENTLEN-1-i],remainder);
		end
		else
		begin
          		nbitshifter #((QUOTIENTLEN-1-i),DIVISORLEN,DATAPATHLEN) n(divisor, w1[i]); 
         		twoscomplement#(DATAPATHLEN) t(w1[i], w2[i]);
          		nbitfulladder #(DATAPATHLEN) a( w4[i-1],w2[i], w3[i],quotient[QUOTIENTLEN-1-i]);
          		mux2_1 #(DATAPATHLEN) m(w4[i-1],w3[i],quotient[QUOTIENTLEN-1-i],w4[i]);
		end	
	end
endgenerate

endmodule
