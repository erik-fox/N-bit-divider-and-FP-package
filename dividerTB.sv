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
         		$display("error");
         		$display("quotient %d, expected: %d", quotient[DIVIDEND-1:0],(dividend/divisor));
            		$display("remainder: %d, expected: %d", remainder, (dividend - ((dividend/divisor)*divisor)));
		end
       		else if(remainder!==dividend - (quotient*divisor))
        	begin
          		$display("error remainder: %d, expected: %d", remainder, (dividend - ((dividend/divisor)*divisor)));
        	end
       	 	else
			/*
         		$display("dividend: %d divisor: %d quotient: %d remainder %d", dividend, divisor, quotient, remainder);
			*/
      
      	end        
end
  
endmodule
