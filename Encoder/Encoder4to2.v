module Encoder4to2(input[3:0] Y, output[1:0] A);
	// data flow model
	// assign A[1] = Y[2] | Y[3];
	// assign A[0] = Y[1] | Y[3];
	
	// gate level model
	or o1(A[1], Y[2], Y[3]);
	or o2(A[0], Y[1], Y[3]);
	
endmodule