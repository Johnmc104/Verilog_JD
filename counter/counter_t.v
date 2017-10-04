module counter_t();

	reg clk,reset;
	wire [1:0] out; counter m1(.reset(reset ),.clk(clk),.out(out));
	
	initial
		begin
			#5000 $finish;
		end
		
	initial
		begin
			clk=0;
			#20 reset=0;
			#50 reset=1;
			#30 reset=0;
			end
			
	always
			#10 clk=~clk;
			
endmodule
