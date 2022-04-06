// 5 bit binary adder
// it can be used to build a 10 bit adder since it also takes Cin value
module Adder5(input [4:0] A, input [4:0] B, input Cin, output [4:0] Sum, output Cout);
	wire [3:0] c; // carry out
	FullAdder FA0(.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(c[0]));
	FullAdder FA1(.A(A[1]), .B(B[1]), .Cin(c[0]), .Sum(Sum[1]), .Cout(c[1]));
	FullAdder FA2(.A(A[2]), .B(B[2]), .Cin(c[1]), .Sum(Sum[2]), .Cout(c[2]));
	FullAdder FA3(.A(A[3]), .B(B[3]), .Cin(c[2]), .Sum(Sum[3]), .Cout(c[3]));
	FullAdder FA4(.A(A[4]), .B(B[4]), .Cin(c[3]), .Sum(Sum[4]), .Cout(Cout));
endmodule