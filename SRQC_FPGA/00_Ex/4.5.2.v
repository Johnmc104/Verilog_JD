module SRQC_FPGA(clk,a,b,c,d,e,f,g,dout);
	input clk;
	input a,b,c,d,e,f,g;
	
	output reg dout;
	
	always @ (posedge clk)
		begin
			dout<=a&b&c&d&e&f&g;
		end

endmodule
