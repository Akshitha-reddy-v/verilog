



module tb_triple_counter;
	reg clk,rst;
	wire [1:0] count;
	
	triple_counter DUT (.clk(clk),.rst(rst),.count(count));
	
	initial 
		clk = 1'b0;
	always #5 clk = ~clk;
	
	task display;
		begin
            #10;
			$display("Time=%t | Count=%t",$time,count);
           
		end
	endtask
	
	initial begin
		rst = 1'b0;
      @(posedge clk) rst = 1'b1;
      @(posedge clk) rst = 1'b0;
      repeat(12)
		display;
        #130 $finish;
	end
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
	
endmodule