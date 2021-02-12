module nbitshifter #(parameter BITSHIFT = 5, parameter BITIN =3 , parameter BITOUT=8) (input [BITIN-1:0]in, output [BITOUT-1:0]out);

assign out = in<<BITSHIFT;

endmodule
