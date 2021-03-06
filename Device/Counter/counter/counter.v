module counter(reset,clk,out);

	input clk,reset;
	output [1:0] out;
	
	reg [1:0] state,next_state;
	reg [1:0] out;
	
	parameter
		s_0=2'b00,
		s_1=2'b01,
		s_2=2'b10,
		s_3=2'b11;
		
	always@(posedge clk)
		if(reset)
			state<=s_0;
		else
			state<=next_state;
		
	always@(state,reset)
	begin
		case(state)
		
			s_0:
			begin
				out<=2'b00; 
				if(reset)
					next_state<=s_0;
				else
					next_state<=s_1;
			end
			
			s_1:
			begin
				out<=2'b01;
				if(reset)
					next_state<=s_0;
				else
					next_state<=s_2;
			end
			
			s_2:
			begin
				out<=2'b10;
				
				if(reset)
					next_state<=s_0;
				else
					next_state<=s_3;
			end
			
			s_3:
			begin
				out<=2'b11;
				next_state<=s_0;
			end
			
		endcase
	end
endmodule
