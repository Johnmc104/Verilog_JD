module counter_3bit_state(reset,clk,out);//Moore state machine
	input clk, reset;
	output [2:0] out;
	
	reg [2:0] state,next_state;
	reg [2:0] out;
	
	parameter	s_0=3'b000,
					s_1=3'b001,
					s_2=3'b010,
					s_3=3'b011,
					s_4=3'b100;
	
	always @(posedge clk)
		if(reset) state <= s_0;
		else state <= next_state;
	
	always @(state, reset)
		begin
			case(state)
				s_0:begin
					out <= 3'b000;
					if(reset) next_state<=s_0;
					else next_state<=s_1;
					end
				
				s_1:begin
					out <= 3'b001;
					if(reset) next_state<=s_0;
					else next_state<=s_2;
					end
					
				s_2:begin
					out <= 3'b010;
					if(reset) next_state<=s_0;
					else next_state<=s_3;
					end
					
				s_3:begin
					out <= 3'b011;
					if(reset) next_state<=s_0;
					else next_state<=s_4;
					end
					
				s_4:begin
					out <= 3'b100;
					if(reset) next_state<=s_0;
					else next_state<=s_0;
					end
					
			endcase
		end
endmodule
