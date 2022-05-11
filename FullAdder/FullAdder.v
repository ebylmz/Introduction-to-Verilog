module fullAdder(input A, B, Cin, output Sum, Cout);
	wire sumFirst;
	wire[2:0] c;
	halfAdder HA0(.A(A), .B(B), .Sum(sumFirst), .Carry(c[0]));
	halfAdder HA1(.A(sumFirst), .B(Cin), .Sum(Sum), .Carry(c[1]));
	or or1(Cout, c[0], c[1]);
endmodule 