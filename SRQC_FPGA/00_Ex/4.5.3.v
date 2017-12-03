module SRQC_FPGA(clk,I1,I2,I3,I4,I5,O1,O2,dout,fout);
	input clk;
	input I1,I2,I3,I4,I5;
	input O1,O2;
	
	output reg dout;
	output reg fout;
	
	always @ (posedge clk)
		begin
			dout<=I1&I2&I3&I4&I5;
			fout<=O1|O2;
		end

endmodule
