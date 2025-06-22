


// counter that counts the sequence 0,0,0,1,1,1,2,2,2,3,3,3,0...
module triple_counter(input clk,rst,
					  output reg [1:0] count
					  );
	
	reg [3:0] state;
	
	always@(posedge clk) begin
		if(rst) 
			state <= 4'd0;
		else begin
			case(state)
				4'd0: state  <= 4'd4;
				4'd4: state  <= 4'd8;
				4'd8: state  <= 4'd1;
				4'd1: state  <= 4'd5;
				4'd5: state  <= 4'd9;
				4'd9: state  <= 4'd2;
				4'd2: state  <= 4'd6;
				4'd6: state  <= 4'd10;
				4'd10: state <= 4'd3;
				4'd3: state  <= 4'd7;
				4'd7: state  <= 4'd11;
				4'd11: state <= 4'd0;
				default: state <= 4'd0;
			endcase
		end
	end
	
	always@(*) begin
		count = state[1:0];
	end
	
endmodule