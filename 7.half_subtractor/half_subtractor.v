`timescale 1ns/1ps


module half_subtractor(
	// inputs
	input a,b,
	// outputs
	output dif,borrow
	);
	
	assign dif = a ^ b;
	assign borrow = (~a)&b;
	
endmodule
