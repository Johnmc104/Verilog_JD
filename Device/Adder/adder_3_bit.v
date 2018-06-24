module adder_3_bit (cout,sum,a,b,cin);
	input[2:0] a,b;
	input cin;
	
	output cout;
	output[2:0] sum;
	
	assign {cout,sum}=a+b+cin;

endmodule
