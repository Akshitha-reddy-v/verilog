`timescale 1ns/1ps


module tb_full_adder;
	reg a,b,cin;
	wire sum,carry;
	
	integer i;
	
	// DUT module instantiation
	full_adder DUT ( .a(a),.b(b),.cin(cin),.sum(sum),.carry(carry) );  
	
	initial begin
		a = 0;
		b = 0;
		cin = 0;
		#100;
		for(i=0;i<7;i=i+1) begin
			{a,b,cin} = i;
			#5;
		end
	end
	
	initial 
		$monitor( "%t : a,b,cin=%b%b%b and sum=%b,carry=%b",$time,a,b,cin,sum,carry );
		
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
		
endmodule