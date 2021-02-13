module mux2_1(input in_0, input in_1, input sel, output out);

assign out = sel?in_1:in_0;

endmodule
