`timescale 1ns/1ps

module tb_moore_110_overlap();
  reg clk,rst;
  reg x;
  wire z;
  
  moore_110_overlap DUT (.clk(clk),
						.rst(rst),
						.x(x),
						.z(z)
						);
  
  // clock generation
  always #5 clk = ~clk;
  
  task inputs(input i);
    #10;
    x = i;
  endtask
  
  initial begin
    clk = 1'b0;
    rst = 1'b0;
    inputs(0);
    #10;
    rst = 1'b1;
    #10 rst = 1'b0;
    inputs(0);
    inputs(0);
    inputs(1);
    inputs(1);
    inputs(1);
    inputs(0);
    inputs(1);
    inputs(1);
    inputs(0);
    inputs(0);
    #100 $finish;
  end
  
  initial 
    $monitor("%t : input=%d and output=%d",$time,x,z);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule