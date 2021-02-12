module top();
  parameter N=10 ;
  bit [N-1:0] in;
  wire [N-1:0] out; 
  twoscomplement #(N) s0(in,out);
initial
begin
    $dumpfile("dump.vcd"); $dumpvars;

  for(int i=0; i<= (1<<N); i++)
  begin
      #10
    in=i;

  end
end
endmodule
