`timescale 1ns/1ps

module half_adder(input a,
					input b,
					output sum,
					output carry
					);
					
	assign sum = a^b;
	assign carry = a&b;
	
endmodule

module fa_using_ha(input a,b,cin,
					output sum,carry
					);
	
	half_adder ha1( .a(a),.b(b),.sum(w1),.carry(w2) );
	half_adder ha2( .a(w1),.b(cin),.sum(sum),.carry(w3) );
	or or1( carry,w2,w3 );
	
endmodule
	