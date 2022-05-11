module halfAdder(input A, B, output Sum, Carry);
	xor g1(Sum, A, B);
	// if A and B both are 1 then Sum becames 0, Cary becames 1
	and g2(Carry, A, B);

endmodule 