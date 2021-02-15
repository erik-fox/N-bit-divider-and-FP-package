module top();
import floatingpoint::*;
shortreal short=2.3, zero= 0.0;
float fp, nan;
  
initial
  begin
    nan.sign='0;
    nan.exponent='1;
    nan.fraction='1;
    #10
    $dumpfile("dump.vcd"); $dumpvars;
	fp=fpnumberfromshortreal(short);
    printfp(fp);
    if(isnan(nan))
      $display("NaN");
    if(iszero(fpnumberfromshortreal(zero)))
        $display("ZERO");

  end
endmodule
