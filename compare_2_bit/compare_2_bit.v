module compare_2_bit (equal,a,b);
	input [1:0]a,b;
	output equal;
	
	assign equal=(a==b)? 1:0;
	//判断两个输入信号是否相等，真为1，否为0

endmodule
