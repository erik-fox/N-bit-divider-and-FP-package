module top();
import floatingpoint::*;
shortreal short=2.3, zero= 0.0, test;
float fp, nan, inf, fptest;

  
initial
begin
    	$dumpfile("dump.vcd"); $dumpvars;
	
	nan.sign='0;
    	nan.exponent='1;
    	nan.fraction='1;
   
 	inf.sign=0;
    	inf.exponent='1;
    	inf.fraction='0;
    
	fp=fpnumberfromshortreal(short);
	
    	printfp(fp);

    	if(isnan(nan))
        	$display("NaN1");
    	if(isnan(fpnumberfromshortreal(zero)))
        	$display("NaN2");
    	if(isnan(inf))
        	$display("NaN3");
    	if(isnan(fp))
        	$display("NaN4");

    	if(iszero(fpnumberfromshortreal(zero)))
        	$display("ZERO");
    	if(isinfinity(inf))
        	$display("infinity");
    	test=shortrealfromfpnumber(fp);
    	fptest=fpnumberfromcomponents(fp.sign,fp.exponent,fp.fraction);
    	printfp(fptest);
end
endmodule
