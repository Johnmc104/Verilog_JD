module counter_u_d_moore_new(count,enable,reset,clk);
	input reset,clk;
	input [1:0] enable;
	output count;
	
	reg [1:0] state,next_state;
	reg [1:0] count;
	
	parameter
		s_0=2'b00,
		s_1=2'b01,
		s_2=2'b10,
		s_3=2'b11;

	always @( posedge clk)
		if(reset)
			state<=s_0;
		else
			state<=next_state;

	
	always @(state,enable)
		case (state)
			s_0:
				begin
					count<=2'b00;
					
					if(enable==2'b01)
						next_state<=s_1;
					
					else if(enable==2'b10)
						next_state<=s_3;
						
					else if((enable==2'b00)||(enable==2'b11))
						next_state<=s_0;
						
					else
						next_state<=2'bxx;
				end
			
			s_1:
				begin
					count<=2'b01;
					if(enable==2'b01)
						next_state<=s_2;
						
					else if(enable==2'b10)
						next_state<=s_0;
						
					else if((enable==2'b00)||(enable==2'b11))
						next_state<=s_1;
					
					else
						next_state<=2'bxx;
				end
			
			s_2:
				begin
					count<=2'b10;
					if(enable==2'b01)
						next_state<=s_3;

					else if(enable==2'b10)
						next_state<=s_1;
						
					else if((enable==2'b00)||(enable==2'b11))
						next_state<=s_2;
					
					else
						next_state<=2'bxx;
				end
	
			s_3:
				begin
					count<=2'b11;
					if(enable==2'b01)
						next_state<=s_0;
						
					else if(enable==2'b10)
						next_state<=s_2;
						
					else if((enable==2'b00)||(enable==2'b11))
						next_state<=s_3;

					else
						next_state<=2'bxx;
				end
				
			default: 
				begin
				    count<=2'bxx;
					 next_state<=2'bxx;
				end
		endcase
endmodule
