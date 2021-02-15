module top();
import floatingpoint::*;
shortreal short=2.3, zero= 0.0, test;
float fp, nan, inf, fptest;

  
initial
  begin
    nan.sign='0;
    nan.exponent='1;
    nan.fraction='1;
   
    inf.sign=0;
    inf.exponent='1;
    inf.fraction='0;
    
    #10
    $dumpfile("dump.vcd"); $dumpvars;
	fp=fpnumberfromshortreal(short);
    printfp(fp);
    if(isnan(nan))
        $display("NaN");
    if(iszero(fpnumberfromshortreal(zero)))
        $display("ZERO");
    if(isinfinity(inf))
        $display("infinity");
    test=shortrealfromfpnumber(fp);
    fptest=fpnumberfromcomponents(fp.sign,fp.exponent,fp.fraction);
    printfp(fptest);
  end
endmodule
