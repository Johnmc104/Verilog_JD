module BCD_to_E3_mealy(d_out,d_in,reset,clk);
	input d_in,reset,clk;
	output d_out; 
	
	reg d_out;
	reg [2:0]state,next_state;
	
	parameter 	s_0=3'b000,	
					s_1=3'b001,
					s_2=3'b010,
					s_3=3'b011,
					s_4=3'b100,
					s_5=3'b101,
					s_6=3'b110; 

	always@(posedge clk)
		if(reset)
			state<=s_0;
		else
			state<=next_state;
	always@(state,d_in)
		case(state)
			s_0: 
				if(d_in==0)
					begin
						d_out<=1;
						next_state<=s_1;
					end
				else if(d_in==1)
					begin
						d_out<=0;
						next_state<=s_2;
					end 
			s_1: 
				if(d_in==0)
					begin
						d_out<=1;
						next_state<=s_3;
					end
				else if(d_in==1)
					begin
						d_out<=0;
						next_state<=s_4;
					end 
			s_2: 
				if(d_in==0)
					begin
						d_out<=0;
						next_state<=s_4;
					end
				else if(d_in==1)
					begin
						d_out<=1;
						next_state<=s_4;
					end 
			s_3: 
				if(d_in==0)
					begin
						d_out<=0;
						next_state<=s_5;
					end
				else if(d_in==1)
					begin
						d_out<=1;
						next_state<=s_5;
					end
			s_4: 
				if(d_in==0)
					begin
						d_out<=1;
						next_state<=s_5;
					end
				else if(d_in==1)
					begin
						d_out<=0;
						next_state<=s_6;
					end
			s_5: 
				if(d_in==0)
					begin
						d_out<=0;
						next_state<=s_0;
					end
				else if(d_in==1)
					begin
						d_out<=1;
						next_state<=s_0;
					end
			s_6:
				if(d_in==0)
					begin
						d_out<=1;
						next_state<=s_0;
					end
			default:
				begin
					next_state<=3'bxxx;
					d_out<=1'bx;
				end 
		endcase
endmodule	
