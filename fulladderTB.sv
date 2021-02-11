module top();
  bit a,b,cin;
  wire s, cout;
  fulladder f0(a,b,cin,s,cout);
  
initial
begin
    $dumpfile("dump.vcd"); $dumpvars;
    
  for(int i=0; i<=8; i++)
  begin
    #10
    {cin, a,b}=i;
    $display("i %d",i);  
  end
end
endmodule
