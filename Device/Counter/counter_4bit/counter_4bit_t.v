module counter_4bit_t();
	wire [3:0] Q;
	reg clk,clr;
	
	counter m1(.Q(Q),.clk(clk),.clr(clr));

/*
	initial 
		begin
			#500 $finish;
		end
*/

	initial
		begin
			clr=1;
			clk=0;
      #50
			clr=0; 
		end
		
always
		#40 clk=!clk;
		
endmodule
