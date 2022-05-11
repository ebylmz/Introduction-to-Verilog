module decoder2to4(input[1:0] I, input E, output[3:0] Y);
	// data flow model
	// assign Y[0] = E & ~I[1] & ~I[0];
	// assign Y[1] = E & ~I[1] & I[0];
	// assign Y[2] = E & I[1] & ~I[0];
	// assign Y[3] = E & I[1] & I[0];
	
	// gate level model
	wire[1:0] notI;
	not n0(notI[0], I[0]);
	not n1(notI[1], I[1]);
	
	and a0(Y[0], notI[1], notI[0], E);
	and a1(Y[1], notI[1], I[0], E);
	and a2(Y[2], I[1], notI[0], E);
	and a3(Y[3], I[1], I[0], E);
	
endmodule