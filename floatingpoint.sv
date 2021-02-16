module top();
import floatingpoint::*;
shortreal short=2.3, zero= 0.0, test;
float fp, nan, inf, fptest, denorm;

  
initial
begin
    	$dumpfile("dump.vcd"); $dumpvars;
	
	denorm.sign='0;
	denorm.exponent='0;
	denorm.fraction='1;
	
	nan.sign='0;
    	nan.exponent='1;
    	nan.fraction='1;
  
	inf.sign=0;
    	inf.exponent='1;
    	inf.fraction='0;
    
	fp=fpnumberfromshortreal(short);
	
	printfp(denorm);
    	printfp(fp);
 	printfp(fpnumberfromshortreal(zero));
  	printfp(inf);
  	printfp(nan);
    	
	if(isdenorm(denorm))
		$display("Denorm1");
	if(isdenorm(inf))
		$display("Denorm2");
	if(isdenorm(nan))
		$display("Denorm3");
	if(isdenorm(fp))
		$display("Denorm4");
	if(isdenorm(fpnumberfromshortreal(zero)))
		$display("Denorm5");
	
  	if(isnan(nan))
        	$display("NaN1");
    	if(isnan(fpnumberfromshortreal(zero)))
        	$display("NaN2");
    	if(isnan(inf))
        	$display("NaN3");
    	if(isnan(fp))
        	$display("NaN4");
	if(isnan(denorm))
		$display("NaN5");

    	if(iszero(fpnumberfromshortreal(zero)))
          	$display("ZERO1");
 	if(iszero(nan))
    		$display("ZERO2");    	
  	if(iszero(fp))
          	$display("ZERO3");    				
  	if(iszero(inf))
            	$display("ZERO4");
	if(iszero(denorm))
		$display("ZERO5");
	
  	if(isinfinity(inf))
         	$display("infinity1");
  	if(isinfinity(nan))
          	$display("infinity2");
  	if(isinfinity(fp))
          	$display("infinity3");
   	if(isinfinity(fpnumberfromshortreal(zero)))
         	 $display("infinity4");
	if(isinfinity(denorm))
		$display("infinity5");
  
    	test=shortrealfromfpnumber(fp);
  	$display("Short real: %f",test);
  
    	fptest=fpnumberfromcomponents(fp.sign,fp.exponent,fp.fraction);
    	printfp(fptest);
end
endmodule
