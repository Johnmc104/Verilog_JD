module SRQC_FPGA(clk,rst,data,num);
	input clk,rst;
	input [12:0] data;
	
	output reg [15:0] num;
	
	reg [3:0] i;
	
	always @ (posedge clk)
		begin
			if(!rst)
				begin
					num<=0;
				end
			
			else
				begin
					for(i=0;i<13;i=i+1)
						if(data[i]) 
							num<=num+1;
				end
		end
endmodule
