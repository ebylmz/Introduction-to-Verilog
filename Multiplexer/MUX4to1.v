module mux4to1(input[3:0] I, input[1:0] S, input E, output Y);
	// data flow model
	// assign Y = E & ((~S[1] & ~S[0] & I[0]) | (~S[1] & S[0] & I[1]) | 
	//			(S[1] & ~S[0] & I[2]) | (S[1] & S[0] & I[3]));
	
	// gate level model
	wire[1:0] out;
	mux2to1 MUX1(.I(I[1:0]), .S(S[0]), .E(E), .Y(out[0]));
	mux2to1 MUX2(.I(I[3:2]), .S(S[0]), .E(E), .Y(out[1]));
	mux2to1 MUX3(.I(out), .S(S[1]), .E(E), .Y(Y));
endmodule