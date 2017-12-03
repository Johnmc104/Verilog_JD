module test(clk,rst,data,add);
	input clk,rst;
	input [3:0] data;
	
	output reg [2:0] add;
	
	always @ (posedge clk)
		begin
			if(!rst)
				begin
					add<=0;
				end
			
			else
				begin
					case(data)
						0,1,2,3:			add<=1;
						4,5,6,7:			add<=2;
						8,9,10,11:		add<=3;
						12,13,14,15:	add<=4;
						default: ;
					endcase
				end
		end
endmodule
