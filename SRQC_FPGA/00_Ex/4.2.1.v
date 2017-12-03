module 2.2.1(clk,rst,add,data);
	input rst,clk;
	inout [3:0] data;
	output reg [2:0] add;
	
	always @ (posedge clk) 
		begin
			if(!rst)
				begin
					add<=0;
				end
		
			else 
				begin
					if(data<4) add<=1;
					else if(data<8) add<=2;
					else if(data<12) add<=3;
					else add<=4;
				end
		end
endmodule
		