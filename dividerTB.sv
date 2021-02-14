module top();
  parameter DIVIDEND =6;
  parameter DIVISOR =3;
  bit [DIVIDEND-1:0] dividend;
  bit [DIVISOR-1:0] divisor;
  wire [DIVIDEND-1:0] quotient;
  wire [DIVISOR-1:0] remainder;
  divider  #(DIVIDEND,DIVISOR)d0(dividend,divisor,quotient, remainder);
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
      for(int i=0; i<=(1<<(DIVISOR+DIVIDEND)); i++)
      begin
        	#10
      		{divisor,dividend}=i;
      end
    end
  
endmodule
