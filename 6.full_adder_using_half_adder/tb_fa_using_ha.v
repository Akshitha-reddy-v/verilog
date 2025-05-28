`timescale 1ns/1ps


module tb_fa_using_ha;
	reg a,b,cin;
	wire sum,carry;
	
	integer i;
	
	// DUT module instantiation
	fa_using_ha DUT ( .a(a),.b(b),.cin(cin),.sum(sum),.carry(carry) );  
	
	initial begin
		a = 0;
		b = 0;
		cin = 0;
		#100;
      for(i=0;i<8;i=i+1) begin
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