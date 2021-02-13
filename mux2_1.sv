module mux2_1 #(parameter N=8)(input [N-1:0] in_0, input [N-1:0] in_1, input sel, output [N-1:0] out);

assign out = sel?in_1:in_0;

endmodule
