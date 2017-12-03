module full_adder_state(reset,a,b,ci,clk,s,co);
	input reset,a,b,ci,clk;
	output s,co;
	
	reg s,co;
	reg [1:0] state,next_state;
	
	parameter
		s_0=2'b00,
		s_1=2'b01,
		s_2=2'b10,
		s_3=2'b11;
		
	always @ (posedge clk or negedge reset)
		if(reset==0)
			state<=s_0;
		else
			state<=next_state;
			
	always @ (state,a,b,ci)
		begin
			case(state)
				s_0:
					begin
						s<=0;
						co<=0;
						
						if(~a&~b&~ci)
							next_state<=s_0;
						else if((~a&~b&ci)|(~a&b&~ci)|(a&~b&~ci))
							next_state<=s_1;
						else if((~a&b&ci)|(a&b&ci)|(a&b&~ci))
							next_state<=s_2;
						else if((a&b&ci))
							next_state<=s_3;
					end
					
				s_1:
					begin
						s<=1;
						co<=0;
						
						if(~a&~b&~ci)
							next_state<=s_0;
						else if((~a&~b&ci)|(~a&b&~ci)|(a&~b&~ci))
							next_state<=s_1;
						else if((~a&b&ci)|(a&b&ci)|(a&b&~ci))
							next_state<=s_2;
						else if((a&b&ci))
							next_state<=s_3;
					end
					
				s_2:
					begin
						s<=0;
						co<=1;
						
						if(~a&~b&~ci)
							next_state<=s_0;
						else if((~a&~b&ci)|(~a&b&~ci)|(a&~b&~ci))
							next_state<=s_1;
						else if((~a&b&ci)|(a&b&ci)|(a&b&~ci))
							next_state<=s_2;
						else if((a&b&ci))
							next_state<=s_3;
					end
					
				s_3:
					begin
						s<=1;
						co<=1;
						
						if(~a&~b&~ci)
							next_state<=s_0;
						else if((~a&~b&ci)|(~a&b&~ci)|(a&~b&~ci))
							next_state<=s_1;
						else if((~a&b&ci)|(a&b&ci)|(a&b&~ci))
							next_state<=s_2;
						else if((a&b&ci))
							next_state<=s_3;
					end
			endcase
		end
endmodule
