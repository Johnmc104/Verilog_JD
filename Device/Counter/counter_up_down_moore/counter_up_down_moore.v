module counter_up_down_moore(count,enable,reset,clk);
	input reset,clk;
	input enable;
	output [2:0]count;
	
	reg [2:0] count,state,next_state;
	
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
					if(enable==1)
						begin
							count<=3'b000;
							next_state<=s_1;
						end
						
					else if(enable==0)
						next_state<=s_0;
				end
			
			s_1:
				begin
					if(enable==1)
						begin
							count<=count;
							next_state<=s_2;
						end
						
					else if(enable==0)
						next_state<=s_1;
				end
			
			s_2:
				begin
					
					if(enable==1)
						begin
							count<=count+1;
							next_state<=s_3;
						end
					else if(enable==0)
						next_state<=s_2;
				end
	
			s_3:
				begin
					if(enable==1)
						begin
							count<=count-1;
							next_state<=s_0;
						end
						
					else if(enable==0)
						next_state<=s_3;
				end
			default: 
			    begin
				    count<=3'bxxx;
					 next_state<=2'bxx;
				end
		endcase
endmodule
