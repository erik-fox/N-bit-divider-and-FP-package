module top();
  parameter DIVIDEND =16;
  parameter DIVISOR =8;
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
      		{divisor,dividend}=i;
        	#10
		if(quotient[DIVIDEND-1:0]!==(dividend/divisor))
		begin
			$display("quotient %d", quotient[DIVIDEND-1:0]);
			$display("%d", (dividend/divisor));
		end
	end
    end
  
endmodule
