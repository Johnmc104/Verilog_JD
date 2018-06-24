module register_8bit(clr,clk,DOUT,D);
	input clr;
	wire clr;
	
	input clk;
	wire clk;
	
	input [7:0] D;
	wire [7:0] D;

	output [7:0] DOUT;
	reg [7:0] DOUT;
	
	always @(posedge clk or posedge clr)
	begin
		if (clr==1)
			DOUT <=D;
		else
			DOUT <=D;
	end
endmodule
