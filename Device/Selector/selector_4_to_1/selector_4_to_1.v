module selector_4_to_1(out,i0,i1,i2,i3,s1,s0);
	input i0,i1,i2,i3,s1,s0;
	output out;

	reg out;
	
	always @(i0,i1,i2,i3,s1,s0)
		begin
			case({s1,s0})
			2'b00: out=i0;
			2'b01: out=i1;
			2'b10: out=i2;
			2'b11: out=i3;
			endcase
		end
		
endmodule
