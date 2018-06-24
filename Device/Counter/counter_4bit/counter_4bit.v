module counter_4bit(out,clk,clr);
	input clk,clr;
	output [3:0] out;
	
	reg [3:0] out;
	
	always @(posedge clk)
		if(clr)
			out<=4'b0000;
		else
		   out<=out+1;
			
endmodule
