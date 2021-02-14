package floatingpoint;
localparam EXPONENT_BITS=8;
localparam FRACTION_BITS=23;
typedef struct{
	bit sign;
	bit [EXPONENT_BITS-1:0] exponent;
	bit [FRACTION_BITS-1:0] fraction;
}float;
/*
//construct a floating point number from component (return type float)
function float fpnumberfromcomponents(input bit sign, bit [EXPONENT_BITS-1:0]exp, bit [FRACTION_BITS-1:0]frac);

//construct floating point number from short real (return type float)
function float fpnumberfromshortreal(input shortreal sr);

//return shortreal representation of floating point number
function shortreal shortrealfromfpnumber (input float f);

//retrun true(1) if f is zero
function bit iszero(float f);

//return true if f is NaN
function bit isnan(float f);

//return true if f is infinity (+/-)
function bit isinfinity(float f);

//print a floating point number's components (sign,exponent,fraction)
function void printfp(float f);

//NOTES: shortreal is single precison (32bit) fp number; $shortrealtobits() $bitstoshortreal()
*/
endpackage
