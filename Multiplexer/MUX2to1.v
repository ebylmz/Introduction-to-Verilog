module MUX2to1(input[1:0] I, input S, input E, output Y);
	// data flow model
	// assign Y = E & ((I[0] & ~S) | (I[1] & S));
	
	// gate level model
	wire notS;
	not (notS, S);
	
	wire[1:0] out;
	and a1(out[0], I[0], notS, E);
	and a2(out[1], I[1], S, E);
	or result(Y, out[0], out[1]);
endmodule