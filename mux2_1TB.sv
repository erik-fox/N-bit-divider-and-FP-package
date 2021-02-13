module top();
  bit in_0,in_1,sel;
  wire out;
  mux2_1 m0(in_0,in_1,sel,out);
 
  initial
    begin
    $dumpfile("dump.vcd"); $dumpvars;
      for(int i=0; i<=(8); i++)
        	#10
  			{sel,in_1, in_0}=i;
    end
  
endmodule
