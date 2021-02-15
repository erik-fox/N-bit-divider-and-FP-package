module top();
import floatingpoint::*;
shortreal short=(2/3);
float fp;
  
initial
  #10
  fpnumberfromshortnumber(short);
  #10
endmodule
