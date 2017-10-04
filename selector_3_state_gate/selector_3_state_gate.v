module selector_3_state_gate(out,in,enable);
	input in,enable;
	output out;
	
	bufif1 mybuf(out,in,enable);

endmodule
