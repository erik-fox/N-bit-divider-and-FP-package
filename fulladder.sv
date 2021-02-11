module fulladder (a,b, cin, s, cout);
input a, b, cin;
output logic s, cout;

always_comb
begin
	s=a^b^cin;
	cout=(a&b)|((a^b)&cin);
end

endmodule
