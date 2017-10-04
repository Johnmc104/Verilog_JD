module counter_decimal_3_bit_t();
	reg clk,reset;
	wire [11:0] out;
	
	counter_decimal_3_bit_3 m1(.reset(reset ),.clk(clk),.out(out));
	initial begin
		#160000 $finish;
		end
	
	initial begin
		clk=0;
		#20 reset=0;
		#50 reset=1;
		#30 reset=0;
		end

	always
		#2 clk=~clk;

endmodule
