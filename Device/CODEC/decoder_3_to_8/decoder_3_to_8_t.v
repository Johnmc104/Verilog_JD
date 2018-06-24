module decoder_3_to_8_t();
	reg [2:0] in;
	wire [7:0] out;
	
	decoder_3_to_8 m1 (.in(in),.out(out));
	initial
		begin
			#500 $finish;
		end
		
	initial
		begin
			#10 in=3'b000;
			#10 in=3'b001;
			#10 in=3'b010;
			#10 in=3'b011;
			#10 in=3'b100;
			#10 in=3'b101;
			#10 in=3'b110;
			#10 in=3'b111;
		end
endmodule
