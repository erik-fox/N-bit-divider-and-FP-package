module divider #(parameter DIVIDENDLEN=16, parameter DIVISORLEN = 8)(dividend,divisor,quotient,remainder);
localparam QUOTIENTLEN=DIVIDENDLEN;
localparam REMAINDERLEN = DIVISORLEN; 
localparam DATAPATHLEN = DIVIDENDLEN + DIVISORLEN -1;
input [DIVIDENDLEN-1:0]dividend;
input [DIVISORLEN-1:0]divisor;
output [QUOTIENTLEN-1:0]quotient; 
output [REMAINDERLEN-1:0]remainder;

endmodule
