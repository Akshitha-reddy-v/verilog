`timescale 1ns/1ps


module half_subtractor(
	// inputs
	input a,b,
	// outputs
	output sub,borrow
	);
	
	assign sub = a ^ b;
	assign borrow = (~a)&b;
	
endmodule