module encoder8to3(input[7:0] Y, output[2:0] A);
	// data flow model
	// assign A[0] = Y[1] | Y[3] | Y[5] | Y[7];
	// assign A[1] = Y[2] | Y[3] | Y[6] | Y[7];
	// assign A[2] = Y[4] | Y[5] | Y[6] | Y[7];
	
	// gate level model
	or o0(A[0], Y[1], Y[3], Y[5], Y[7]);
	or o1(A[1], Y[2], Y[3], Y[6], Y[7]);
	or o2(A[2], Y[4], Y[5], Y[6], Y[7]);
endmodule