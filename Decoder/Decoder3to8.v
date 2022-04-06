module Decoder3to8(input[2:0] I, input E, output[7:0] Y);
	// data flow model
	// assign Y[0] = E & ~I[2] & ~I[1] & ~I[0];
	// assign Y[1] = E & ~I[2] & ~I[1] & I[0];
	// assign Y[2] = E & ~I[2] & I[1] & ~I[0];
	// assign Y[3] = E & ~I[2] & I[1] & I[0];
	// assign Y[4] = E & I[2] & ~I[1] & ~I[0];
	// assign Y[5] = E & I[2] & ~I[1] & I[0];
	// assign Y[6] = E & I[2] & I[1] & ~I[0];
	// assign Y[7] = E & I[2] & I[1] & I[0];
	
	// gate level model
	// E is not used !!!
	Decoder2to4 d1(.E(~I[2]), .I(I[1:0]), .Y(Y[3:0]));
	Decoder2to4 d2(.E(I[2]), .I(I[1:0]), .Y(Y[7:4]));
endmodule