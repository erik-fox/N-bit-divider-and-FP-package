module top();
  parameter BITSHIFT= 3, BITIN = 3, BITOUT=8 ;
  bit [BITIN-1:0] in;
  wire [BITOUT-1:0] out; 
  nbitshifter #(BITSHIFT,BITIN,BITOUT) s0(in,out);
initial
begin
    $dumpfile("dump.vcd"); $dumpvars;

  for(int i=0; i<= (1<<BITIN); i++)
  begin
      #10
    in=i;

  end
end
endmodule
