module counter_decimal_3_bit(reset,clk,out);
	input clk,reset;
	output [3:0] out;
	reg[3:0] state,next_state;
	reg [3:0] out;

	parameter
		s_0=4'b0000,
		s_1=4'b0001,
		s_2=4'b0010,
		s_3=4'b0011,
		s_4=4'b0100,
		
		s_5=4'b0101,
		s_6=4'b0110,
		s_7=4'b0111,
		s_8=4'b1000,
		s_9=4'b1001,
		
		dont_care_state=4'bx,
		dont_care_out=4'bx;
		
	always@(posedge clk)
		if(reset) state<=s_0;
		else state<=next_state;
	
	always@(state,reset)
		begin case(state)
		
		s_0: begin
			out<=4'b0000; 
			
			if(reset) next_state<=s_0;
			else next_state<=s_1;
			end
		
		s_1: begin
			out<=4'b0001;
			
			if(reset) next_state<=s_0;
			else next_state<=s_2;
			end
		
		s_2: begin
			out<=4'b0010;
			
			if(reset) next_state<=s_0;
			else next_state<=s_3;
			end
		
		s_3: begin
			out<=4'b0011;
			
			if(reset) next_state<=s_0;
			else next_state<=s_4;
			end
			
		s_4: begin
			out<=4'b0100;
			
			if(reset) next_state<=s_0;
			else next_state<=s_5;
			end
			
		s_5: begin
			out<=4'b0101;
			
			if(reset) next_state<=s_0;
			else next_state<=s_6;
			end
			
		s_6: begin
			out<=4'b0110;
			
			if(reset) next_state<=s_0;
			else next_state<=s_7;
			end
			
		s_7: begin
			out<=4'b0111;
			
			if(reset) next_state<=s_0;
			else next_state<=s_8;
			end
			
		s_8: begin
			out<=4'b1000;
			
			if(reset) next_state<=s_0;
			else next_state<=s_9;
			end
			
		s_9: begin
			out<=4'b1001;
			
			next_state<=s_0;
			end
		
		default: begin
			out<=dont_care_out;
			next_state<= dont_care_state;
			end
			
		endcase
	end
endmodule


module counter_decimal_3_bit_3(reset,clk,out);
	input reset,clk;
	output [11:0] out;
	
	wire [3:0] out0,out1,out2;
	wire ckl0,clk1;
	
	assign clk0=~out[3];
	assign clk1=~out[7];
	
	counter_decimal_3_bit m1 (.reset(reset),.clk(clk),.out(out0));
	counter_decimal_3_bit m2 (.reset(reset),.clk(clk0),.out(out1));
	counter_decimal_3_bit m3 (.reset(reset),.clk(clk1),.out(out2));
	
	assign out={out2,out1,out0};
endmodule
		