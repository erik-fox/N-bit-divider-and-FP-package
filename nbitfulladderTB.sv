module top();
  parameter N=2;
  bit [N-1:0] a,b;
  wire [N-1:0] s; 
  wire cout;
  nbitfulladder #(N)f0(a,b,s,cout);
  
initial
begin
    $dumpfile("dump.vcd"); $dumpvars;

  for(int i=0; i<=(1<<(N*2))-1; i++)
  begin
      #10
    {a,b}=i;
    $display("i %d",i);  
  end
end
endmodule
