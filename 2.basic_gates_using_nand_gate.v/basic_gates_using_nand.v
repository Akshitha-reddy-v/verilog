`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:10 04/14/2025 
// Design Name: 
// Module Name:    Universal_gates 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module basic_gates_using_nand(
    input a,
    input b,
    output and_out,
    output or_out,
    output not_out,
    output xor_out,
    output xnor_out
    );
 
	 wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;
	 
	 // and_gate using nand_gate
	 nand_gate nand1( .a(a),.b(b),.y(w1) );
	 nand_gate nand2( .a(w1),.b(w1),.y(and_out) );
	 
	 // or_gate using nand_gate
	 nand_gate nand3( .a(a),.b(a),.y(w2) );
	 nand_gate nand4( .a(b),.b(b),.y(w3) );
	 nand_gate nand5( .a(w2),.b(w3),.y(or_out) );

	 // not_gate using nand_gate
	 nand_gate nand6( .a(a),.b(a),.y(not_out) );
	 
	 // xor_gate using nand_gate
	 nand_gate nand7( .a(a),.b(a),.y(w4) );
	 nand_gate nand8( .a(b),.b(b),.y(w5) );
	 nand_gate nand9( .a(w4),.b(b),.y(w6) );
	 nand_gate nand10( .a(a),.b(w5),.y(w7) );
	 nand_gate nand11( .a(w6),.b(w7),.y(xor_out) );
	 
	 // xnor_gate using nand_gate
	 nand_gate nand12( .a(a),.b(a),.y(w8) );
	 nand_gate nand13( .a(b),.b(b),.y(w9) );
	 nand_gate nand14( .a(a),.b(b),.y(w10) );
	 nand_gate nand15( .a(w8),.b(w9),.y(w11) );
	 nand_gate nand16( .a(w10),.b(w11),.y(xnor_out) );
	
endmodule
