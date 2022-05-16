module example3(
	input 		          		CLOCK_50,
	input 		     [3:0]		KEY,
	input 		          		RESET_N,
	output		     [9:0]		LEDR,
	input 		     [9:0]		SW
);

// ~KEY[0] : load is high

wire[31:0] count;
counter c(.clk(CLOCK_50), .count(count));
wire clk = count[25];

wire d0, d1;

parallelReg r(clk, ~KEY[0], LEDR[4:0], d0);

adder a(SW[9:5], d0, d1);

mul m(
	.d0(d0), 
	.d1(d1), 
	.d2(d0 ^ SW[9:5]), 
	.d3(SW[9:5]),
	.s(SW[1:0]),
	.q(LEDR[4:0])
	);


endmodule


// 4x1 multiplexer
module mul(input[4:0] d0, d1, d2, d3, input[1:0] s, output reg[4:0] q);
	always @ (*)
		case(s) 
			2'b00: q <= d0;
			2'b01: q <= d1;
			2'b10: q <= d2;
			2'b11: q <= d3;
		endcase
endmodule


// module mul(input[4:0] d0, d1, d2, d3, input s1, s0, output[4:0] q);
// 	assign q = s1 ? (s0 ? d3 : d2) : (s0 ? d1 : d0);
// endmodule


// s: 0 (shiftLeft)
// s: 1 (shiftRight)
module shiftReg(input clk, s, input[4:0] d, output reg[4:0] q);
	always @ (posedge clk)
		if (s)
			q <= d >> 1;
		else
			q <= d << 1;
		
endmodule


// counter to get a lower frequency clock
// count[25] becomes height in each 0.7 second
module counter(input clk, reset, en, output reg[31:0] count);
	always @ (posedge clk or negedge reset)
		if (!reset)
			count <= 32'b0;
		else if (en)
			count <= count + 32'b1;
		else
			count <= count;		
endmodule


// 5-bit parallel load register
module parallelReg(input clk, load, input[4:0] d, output reg[4:0] q);
	always @ (posedge clk)
		q <= (load == 1) ? d : q;
endmodule


// 5-bit adder
module adder(input[4:0] a, b, output[4:0] c);
	assign c = a + b;
endmodule