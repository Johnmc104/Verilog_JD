module SRQC_FPGA(I1,I2,I3,I4,sel,dout);
	input I1,I2,I3,I4;
	input sel;
	output dout;
	
	assign dout = sel ? (I1+I2):(I3+I4);
	
endmodule
