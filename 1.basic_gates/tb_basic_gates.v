`timescale 1ns / 1ps

module tb_basic_gates;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire and_out;
	wire or_out;
	wire not_out;
	wire nand_out;
	wire nor_out;
	wire xor_out;
	wire xnor_out;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	basic_gates uut (
		.a(a), 
		.b(b), 
		.and_out(and_out), 
		.or_out(or_out), 
		.not_out(not_out), 
		.nand_out(nand_out), 
		.nor_out(nor_out), 
		.xor_out(xor_out), 
		.xnor_out(xnor_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for(i=0;i<4;i=i+1) begin
			{a,b} = i;
			#5;
		end
		#10 $finish;
	end
	
	initial
		$monitor("%t : a,b = %b%b and=%b,or=%b,not_a=%b,nand=%b,nor=%b,xor=%b,xnor=%b",$time,a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
      
endmodule

