`timescale 1ns / 1ps

module nor_gate(
    input a,
    input b,
    output y
    );

    assign y = ~(a|b);
endmodule


module basic_gates_using_nor(
    input a,
    input b,
    output and_out,
    output or_out,
    output not_out,
    output xor_out,
    output xnor_out
    );
 
	 wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13;
	 
	 // and_gate using nor_gate
	 nor_gate nor1( .a(a),.b(a),.y(w1) );
	 nor_gate nor2( .a(b),.b(b),.y(w2) );
     nor_gate nor3( .a(w1),.b(w2),.y(and_out) );
	 
	 // or_gate using nor_gate
	 nor_gate nor4( .a(a),.b(b),.y(w3) );
	 nor_gate nor5( .a(w3),.b(w3),.y(or_out) );

	 // not_gate using nor_gate
	 nor_gate nor6( .a(a),.b(a),.y(not_out) );
	 
	 // xor_gate using nor_gate
	 nor_gate nor7( .a(b),.b(b),.y(w4) );
	 nor_gate nor8( .a(a),.b(a),.y(w5) );
	 nor_gate nor9( .a(a),.b(w4),.y(w6) );
	 nor_gate nor10( .a(w5),.b(b),.y(w7) );
	 nor_gate nor11( .a(w6),.b(w7),.y(w8) );
	 nor_gate nor12( .a(w8),.b(w8),.y(xor_out) );
	 
	 // xnor_gate using nor_gate
	 nor_gate nor13( .a(a),.b(a),.y(w9) );
	 nor_gate nor14( .a(b),.b(b),.y(w10) );
	 nor_gate nor15( .a(w9),.b(w10),.y(w11) );
	 nor_gate nor16( .a(a),.b(b),.y(w12) );
	 nor_gate nor17( .a(w11),.b(w12),.y(w13) );
	 nor_gate nor18( .a(w13),.b(w13),.y(xnor_out) );
	
endmodule
