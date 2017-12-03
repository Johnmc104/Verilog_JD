module SRQC_FPGA(I1,I2,I3,I4,sel,dout);
	input I1,I2,I3,I4;
	input sel;
	output dout;
	wire I12,I34;
	
	assign I12=sel?I1:I3;
	assign I34=sel?I2:I4;
	assign dout = I12+I34;
	
endmodule
