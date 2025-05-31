`timescale 1ns/1ps

module k,rst,x,z);
  // ports declaration
  input clk,rst;
  input x;
  output z;
  
  // states declaration
  parameter s0 = 2'b00,
  			s1 = 2'b01,
  			s2 = 2'b10,
  			s3 = 2'b11;
  
  // internal registers declaration
  reg [1:0] p_state, n_state;
  
  //present state logic - sequential
  always@(posedge clk or posedge rst)	// async reset
    begin
      if(rst)
        p_state <= s0;
      else
        p_state <= n_state;
    end
  
  // next state logic - combinational
  always@(p_state or x)
    begin
      n_state = s0;		// default assignment for next state register to avoid latches
      case(p_state)
        s0: begin
          if(!x)
            n_state = s1;
          else
            n_state = s0;
        end
        s1: begin
          if(x)
            n_state = s2;
          else
            n_state = s1;
        end
        s2: begin
          if(x)
            n_state = s3;
          else
            n_state = s1;
        end
        s3: begin
          if(x)
            n_state = s0;
          else
            n_state = s1;
        end
      endcase
    end
  
  // continuous assignment outputs
  assign z = (p_state==s3);
  
endmodule


