`timescale 1ns/1ps


module tb_half_adder;
	reg a,b;
	wire sum,carry;
	
	integer i;
	
	// DUT module instantiation
	half_adder DUT ( .a(a),.b(b),.sum(sum),.carry(carry) );  
	
	initial begin
		a = 0;
		b = 0;
		#100;
		for(i=0;i<4;i=i+1) begin
			{a,b} = i;
			#5;
		end
	end
	
	initial 
		$monitor( "%t : a,b=%b%b and sum=%b,carry=%b",$time,a,b,sum,carry );
		
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
		
endmodule