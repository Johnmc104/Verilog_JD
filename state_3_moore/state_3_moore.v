module state_3_moore(d_out,d_in,reset,clk);
	input d_in,reset,clk;
	output d_out;
	
	reg [1:0] state,next_state;
	reg d_out;
	
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
			
	always @(state,d_in)
		case (state)
			s_0: begin 
					d_out<=0;
				if(d_in==0) 
					next_state<=s_0;
				else if(d_in==1) 
					next_state<=s_1;
				end
			
			s_1: begin 
					d_out<=0;
				if(d_in==0) 
					next_state<=s_0;
				else if(d_in==1) 
					next_state<=s_2;
				end

			s_2: begin 
					d_out<=0;
				if(d_in==0) 
					next_state<=s_0;
				else if(d_in==1) 
					next_state<=s_3;
				end
		
			s_3: begin 
					d_out<=0;
				if(d_in==0) 
					next_state<=s_0;
				else if(d_in==1) 
					next_state<=s_1;
				end
		endcase
endmodule
